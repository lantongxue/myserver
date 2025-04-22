<?php
return  [
    'default' => env('DB_DRIVER', 'mysql'),
    'connections' => [
        'mysql' => [
            'driver'      => 'mysql',
            'host'        => env('DB_MYSQL_HOST'),
            'port'        => env('DB_MYSQL_PORT', 3306),
            'database'    => env('DB_MYSQL_NAME'),
            'username'    => env('DB_MYSQL_USER'),
            'password'    => env('DB_MYSQL_PASS'),
            'charset'     => env('DB_MYSQL_CHARSET', 'utf8mb4'),
            'collation'   => env('DB_MYSQL_CHARSET_COLLATION', 'utf8mb4_general_ci'),
            'prefix'      => '',
            'strict'      => true,
            'engine'      => null,
            'options'   => [
                PDO::ATTR_EMULATE_PREPARES => false, // Must be false for Swoole and Swow drivers.
            ],
            'pool' => [
                'max_connections' => 5,
                'min_connections' => 1,
                'wait_timeout' => 3,
                'idle_timeout' => 60,
                'heartbeat_interval' => 50,
            ],
        ],
    ],
];