<?php
namespace plugin\ssh\app\process;

use plugin\ssh\app\model\SshToken;
use plugin\ssh\app\process\protocol\Cmd;
use plugin\ssh\app\process\protocol\WebSSHProtocol;
use plugin\ssh\app\process\protocol\WebSSHSession;
use Workerman\Connection\TcpConnection;
use Workerman\Protocols\Http\Request;
use Workerman\Protocols\Websocket;
use Workerman\Timer;
use Workerman\Worker;


class WebSSH
{
    /**
     * 当前已正确连接的客户端会话列表
     * @var WebSSHSession[]
     */
    public static array $clients = [];

    public const string PATH = '/web-ssh/';

    /**
     * 默认端口
     */
    public const int PORT = 8788;

    /**
     * 黑名单
     * @var array
     */
    public static array $deny = [];

    /**
     * 心跳间隔30秒
     */
    public const int HEARTBEAT_INTERVAL = 30;

    /**
     * 心跳响应时间30秒
     */
    public const int HEARTBEAT_RESPONSE_TIME = 30;

    /**
     * Token有效期1小时
     */
    public const int TOKEN_LIFETIME = 3600;

    /**
     * Token刷新时间5分钟
     */
    public const int TOKEN_REFRESH_TIME = 300;

    /**
     * 超2小时没有交互自动断开连接
     */
    public const int TIMEOUT_AUTO_CLOSE = 7200;

    public function onWorkerStart(Worker $worker)
    {
        Timer::add(self::HEARTBEAT_INTERVAL, function() use ($worker) {
            foreach (self::$clients as $client) {
                // 超2小时没有交互则关闭连接
                if (time() - $client->lastMessageTime > self::TIMEOUT_AUTO_CLOSE) {
                    $client->dispose();
                } else {
                    $client->response(Cmd::Heartbeat, 'ping');
                }
            }
        });
    }

    public function onConnect(TcpConnection $connection): void
    {
        if(in_array($connection->getRemoteIp(), self::$deny)) {
            $connection->close();
            return;
        }
    }

    public function onWebSocketConnect(TcpConnection $connection, Request $request): void
    {
        $path = $request->path();
        if(empty($path) || !str_starts_with($path, self::PATH)) {
            $connection->close();
            return;
        }
        $token = str_replace(self::PATH, '', $path);
        if(empty($token)) {
            $connection->close();
            return;
        }
        $tokenObj = SshToken::where([
            ['token', '=', $token],
            ['expired', '>', date('Y-m-d H:i:s')],
        ])->first();
        if($tokenObj === null) {
            $connection->close();
            return;
        }
        $connection->websocketType = Websocket::BINARY_TYPE_ARRAYBUFFER;
        $buff = WebSSHProtocol::encode(Cmd::AuthOk, '');
        $connection->send($buff);

        try {
            self::$clients[$connection->id] = new WebSSHSession($tokenObj, $connection);
        } catch(\Exception $e) {
            $buff = WebSSHProtocol::encode(Cmd::SshOutput, $e->getMessage());
            $connection->send($buff);
            $connection->close();
        }
    }

    public function onMessage(TcpConnection $connection, $data): void
    {
        $parsed = WebSSHProtocol::decode($data);
        $connection->websocketType = Websocket::BINARY_TYPE_ARRAYBUFFER;
        $client = self::$clients[$connection->id] ?? null;
        if ($client === null) {
            $connection->close();
            return;
        }

        if ($parsed['cmd'] === Cmd::Heartbeat->value) {
            $pongTime = intval(str_replace('pong', '', $parsed['body']));
            if (time() - $pongTime >= self::HEARTBEAT_RESPONSE_TIME) { // 心跳响应时间不能超过30秒
                $connection->close();
                return;
            }
        }
        $client->lastMessageTime = time();
        // 如果token时间剩余5分钟内，自动续期
        $expired = strtotime($client->token->expired);
        if ($expired - time() <= self::TOKEN_REFRESH_TIME) {
            $expired += self::TOKEN_LIFETIME;
            $client->refreshTokenTime($expired);
        }

        if($parsed['cmd'] == Cmd::SshLogin->value) { // request shell
            if($client->loginSSH()) {
                $client->openShell();
            } else {
                $client->response(Cmd::SshOutput, '服务器连接失败');
                $client->dispose();
            }
        }
        if ($parsed['cmd'] === Cmd::SshInput->value) {
            $client->writeShell($parsed['body']);
        }
        if ($parsed['cmd'] === Cmd::SshResize->value) {
            $size = explode('x', $parsed['body']);
            $client->resizeShell(intval($size[0]), intval($size[1]));
        }
    }

    public function onClose(TcpConnection $connection): void
    {
        if(array_key_exists($connection->id, self::$clients)) {
            self::$clients[$connection->id]->dispose();
        }
        unset(self::$clients[$connection->id]);
        console_log('['. $connection->id .'] closed');
    }
}