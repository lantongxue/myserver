<?php

namespace plugin\ssh\app\process\protocol;

use plugin\ssh\app\model\SshServer;
use React\EventLoop\Loop;
use React\EventLoop\LoopInterface;
use React\Stream\ReadableResourceStream;
use Workerman\Connection\TcpConnection;

class SshClient
{
    protected ?SshServer $server = null;

    /**
     * ssh 会话
     * @var resource
     */
    protected $sshSession = null;

    /**
     * shell 会话
     * @var resource
     */
    protected $shellSession = null;

    protected ?ReadableResourceStream $shellStream = null;

    protected bool $auth = false;

    protected int $cols = 80;
    protected int $rows = 40;

    protected ?LoopInterface $loop = null;

    protected string $termType = 'xterm';

    public function __construct(protected int $serverId, protected TcpConnection $connection)
    {
        $this->server = SshServer::find($serverId);
        if($this->server === null) {
            throw new \Exception('Server not found');
        }
    }

    public function connect(): bool
    {
        $this->sshSession = ssh2_connect($this->server->host, $this->server->port);
        $this->auth = $this->auth();
        $this->shellSession = ssh2_shell($this->sshSession, $this->termType, null, $this->cols, $this->rows, SSH2_TERM_UNIT_CHARS);
        $this->loop = Loop::get();
        $this->shellStream = new ReadableResourceStream($this->shellSession, $this->loop);
        $this->shellStream->on('data', function($data): void {
            $buff = WebSSHProtocol::encode(Cmd::SshOutput, $data);
            $this->connection->send($buff);
        });
        return $this->auth;
    }

    private function auth(): bool
    {
        if($this->server->auth === SshServer::AUTH_NONE) {
            if(ssh2_auth_none($this->sshSession, $this->server->username) !== true) {
                return false;
            }
        }

        if($this->server->auth === SshServer::AUTH_PASSWORD) {
            return ssh2_auth_password($this->sshSession, $this->server->username, $this->server->password);
        }

        if($this->server->auth === SshServer::AUTH_PUBLIC_KEY) {
            $key_data = $this->server->privatekey;

            $pem = tmpfile();
            $pem_file = stream_get_meta_data($pem)['uri'];
            file_put_contents($pem_file, $key_data);

            //convert key to rsa
            shell_exec('ssh-keygen -p -N "" -m pem -f ' . $pem_file);

            $pub = tmpfile();
            $pub_file = stream_get_meta_data($pub)['uri'];

            //extract public key
            shell_exec("ssh-keygen -m pem -y -f $pem_file > $pub_file");

            $passphrase = empty($this->server->passphrase) ? null : $this->server->passphrase;
            return ssh2_auth_pubkey_file(
                $this->sshSession,
                $this->server->username,
                $pub_file,
                $pem_file,
                $passphrase
            );
        }

        return false;
    }

    public function getSession()
    {
        return $this->sshSession;
    }

    public function startShell(): void
    {
        if(!$this->auth) {
            return;
        }
        $this->loop?->run();
    }

    public function send(string $data): bool|int
    {
        return fwrite($this->shellSession, $data);
    }

    public function resize(int $cols, int $rows): void
    {
        // 最新版本的ssh2扩展已经支持此函数了
        if(function_exists('ssh2_shell_resize')) {
            ssh2_shell_resize($this->shellSession, $cols, $rows);
        }
        $this->cols = $cols;
        $this->rows = $rows;
    }

    public function dispose(): void
    {
        $this->shellStream?->close();
        if($this->sshSession !== null) {
            ssh2_disconnect($this->sshSession);
        }
    }
}