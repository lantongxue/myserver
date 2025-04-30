<?php

namespace plugin\ssh\app\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id (主键)
 * @property integer $server_id 服务器
 * @property string $token Token
 * @property string $expired 过期时间
 * @property string $ip 操作IP
 * @property integer $admin_id 操作人
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class SshToken extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ssh_token';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
    
}
