<?php
$database = config('database');
$config = $database['connections'][$database['default']];
return [
    'enable' => true,
    "paths" => [
        "migrations" => "database/migrations",
        "seeds" => "database/seeders"
    ],
    "environments" => [
        "default_migration_table" => "phinxlog",
        "default_environment" => "product",
        "product" => [
            "adapter" => $database['default'],
            "host" => $config['host'],
            "name" => $config['database'],
            "user" => $config['username'],
            "pass" => $config['password'],
            "port" => $config['port'],
            "charset" => $config['charset']
        ]
    ]
];
