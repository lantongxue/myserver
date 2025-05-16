<?php

namespace plugin\ssh\app\process\protocol;

use plugin\ssh\app\model\SshToken;
use Swoole\Process;
use Workerman\Connection\TcpConnection;

class WebSSHSession
{
    public ?SshToken $token = null;

    public ?TcpConnection $websocket = null;

    public int $lastMessageTime = 0;

    public ?SshClient $sshClient = null;

    public ?Process $shellProcess = null;

    public ?SftpClient $sftpClient = null;

    public function __construct(SshToken $token, TcpConnection $connection)
    {
        $this->token = $token;
        $this->websocket = $connection;
        $this->lastMessageTime = time();
        $this->sshClient = new SshClient($token->server_id, $connection);
        $this->shellProcess = new Process(function(){
            $this->sshClient->startShell();
        });
        $this->sftpClient = new SftpClient();
    }

    public function loginSSH(): bool
    {
        return $this->sshClient->connect();
    }

    public function openShell(): void
    {
        $this->shellProcess->start();
    }

    public function writeShell(string $data): void
    {
        $this->sshClient->send($data);
    }

    public function resizeShell(int $cols, int $rows): void
    {
        $this->sshClient->resize($cols, $rows);
    }

    public function response(int $cmd, string $body): ?bool
    {
        $buff = WebSSHProtocol::encode($cmd, $body);
        return $this->websocket?->send($buff);
    }

    public function refreshTokenTime(int $time): bool
    {
        $this->token->expired = date('Y-m-d H:i:s', $time);
        return $this->token->save();
    }

    public function dispose(): void
    {
        $this->sshClient?->dispose();
        $this->shellProcess?->close();
        $this->websocket?->close();
    }
}