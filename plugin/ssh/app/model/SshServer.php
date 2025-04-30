<?php

namespace plugin\ssh\app\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id (主键)
 * @property string $host 主机地址
 * @property integer $port 端口
 * @property string $auth 认证方式
 * @property string $username 账号
 * @property string $password 密码
 * @property string $publickey 公钥
 * @property string $privatekey 私钥
 * @property string $passphrase 证书密码
 * @property integer $admin_id 创建人
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class SshServer extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ssh_server';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    public const string AUTH_NONE = 'none';

    public const string AUTH_PASSWORD = 'password';

    public const string AUTH_PUBLIC_KEY = 'publickey';
    
    public static function getAuthMethods(): array
    {
        return [
            self::AUTH_NONE => '无需验证',
            self::AUTH_PASSWORD => '用户名和密码',
            self::AUTH_PUBLIC_KEY => '证书和密码',
        ];
    }
    
}
