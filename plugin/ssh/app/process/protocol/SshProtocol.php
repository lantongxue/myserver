<?php

namespace plugin\ssh\app\process\protocol;

use plugin\ssh\app\model\SshServer;
use React\Stream\ReadableResourceStream;
use Workerman\Connection\TcpConnection;

class SshProtocol
{
    protected int $serverId = 0;

    protected ?TcpConnection $connection = null;

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

    protected string $termType = 'xterm';

    public function __construct(int $serverId, TcpConnection $connection)
    {
        $this->serverId = $serverId;
        $this->connection = $connection;

        $this->server = SshServer::find($serverId);
        if($this->server === null) {
            throw new \Exception('Server not found');
        }
    }

    public function connect(): bool
    {
        $this->sshSession = ssh2_connect($this->server->host, $this->server->port);
        $this->auth = $this->auth();
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

    public function startShell(): void
    {
        if(!$this->auth) {
            return;
        }
        console_log('ssh startShell');
        $this->shellSession = ssh2_shell($this->sshSession, $this->termType, null, $this->cols, $this->rows, SSH2_TERM_UNIT_CHARS);
        sleep(1);
        $this->shellStream = new ReadableResourceStream($this->shellSession);
        $this->shellStream->on('data', function(mixed $data): void {
            print_r($data);
            $this->onData($data);
        });
    }

    protected function onData(mixed $data): void
    {
        $buff = WebSSHProtocol::encode(WebSSHProtocol::CMD_SSH_OUTPUT, $data);
        $this->connection->send($buff);
    }

    public function send(string $data): int
    {
        $len = fwrite($this->shellSession, $data);
        if($len !== false) {
            return $len;
        }
        return -1;
    }

    public function resize(int $cols, int $rows): void
    {
        // 最新版本的ssh2扩展已经支持此函数了
        ssh2_shell_resize($this->shellSession, $cols, $rows);
        $this->cols = $cols;
        $this->rows = $rows;
    }

    public function dispose(): void
    {
        $this->shellStream?->close();
    }
}