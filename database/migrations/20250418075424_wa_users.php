<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class WaUsers extends AbstractMigration
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * https://book.cakephp.org/phinx/0/en/migrations.html#the-change-method
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function change(): void
    {
        $table = $this->table('wa_users', ['comment' => '用户表']);
        $table->addColumn('username', Column::STRING, ['limit' => 32, 'comment' => '用户名']);
        $table->addColumn('nickname', Column::STRING, ['limit' => 40, 'comment' => '昵称']);
        $table->addColumn('password', Column::STRING, ['limit' => 255, 'comment' => '密码']);
        $table->addColumn('sex', Column::ENUM, ['values' => ['0', '1'], 'default' => '1', 'comment' => '性别']);
        $table->addColumn('avatar', Column::STRING, ['limit' => 255, 'comment' => '头像']);
        $table->addColumn('email', Column::STRING, ['limit' => 128, 'comment' => '邮箱']);
        $table->addColumn('mobile', Column::STRING, ['limit' => 16, 'comment' => '手机']);
        $table->addColumn('level', Column::TINYINTEGER, ['default' => 0, 'comment' => '等级']);
        $table->addColumn('birthday', Column::DATE, ['comment' => '生日']);
        $table->addColumn('money', Column::DECIMAL, ['precision' => 10, 'scale' => 2, 'default' => 0, 'comment' => '余额(元)']);
        $table->addColumn('score', Column::INTEGER, ['default' => 0, 'comment' => '积分']);
        $table->addColumn('last_time', Column::DATETIME, ['comment' => '登录时间']);
        $table->addColumn('last_ip', Column::STRING, ['limit' => 50, 'comment' => '登录ip']);
        $table->addColumn('join_time', Column::DATETIME, ['comment' => '注册时间']);
        $table->addColumn('join_ip', Column::STRING, ['limit' => 50, 'comment' => '注册ip']);
        $table->addColumn('token', Column::STRING, ['limit' => 50, 'comment' => 'token']);
        $table->addColumn('role', Column::INTEGER, ['default' => 1, 'comment' => '角色']);
        $table->addColumn('status', Column::TINYINTEGER, ['default' => 0, 'comment' => '禁用']);
        $table->addColumn('created_at', Column::DATETIME, ['comment' => '创建时间']);
        $table->addColumn('updated_at', Column::DATETIME, ['comment' => '更新时间']);
        $table->addIndex('username', ['name' => 'username', 'unique' => true]);
        $table->addIndex('email', ['name' => 'email']);
        $table->addIndex('join_time', ['name' => 'join_time']);
        $table->addIndex('mobile', ['name' => 'mobile']);
        $table->create();
    }
}
