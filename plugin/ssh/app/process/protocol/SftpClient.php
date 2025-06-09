<?php

namespace plugin\ssh\app\process\protocol;

class SftpClient
{
    public function __construct(protected $sshConnection)
    {
    }
}