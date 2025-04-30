<?php

use plugin\ssh\app\process\WebSSH;


return [
    'webssh' => [
        'handler' => WebSSH::class,
        'listen' => 'websocket://0.0.0.0:'.WebSSH::PORT,
        'count' => 1,
        'user' => '',
        'group' => '',
        'reusePort' => false,
        'eventLoop' => '',
        'context' => [],
    ],
];
