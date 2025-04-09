<?php

namespace plugin\admin\app\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id 主键(主键)
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 * @property string $from 手机号
 * @property string $content 内容
 * @property string $type 短信类型
 * @property string $app 对应APP
 * @property string $sender 发送人
 */
class AppSms extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'app_sms';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
    
    
    
}
