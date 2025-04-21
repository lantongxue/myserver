<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class WaAdmins extends AbstractMigration
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
        $table = $this->table('wa_admins', ['comment' => '管理员表']);
        $table->addColumn('username', Column::STRING, ['limit' => 32, 'comment' => '用户名']);
        $table->addColumn('nickname', Column::STRING, ['limit' => 40, 'comment' => '昵称']);
        $table->addColumn('password', Column::STRING, ['limit' => 255, 'comment' => '密码']);
        $table->addColumn('avatar', Column::STRING, ['limit' => 255, 'default' => '/app/admin/avatar.png', 'comment' => '头像']);
        $table->addColumn('email', Column::STRING, ['limit' => 100, 'comment' => '邮箱']);
        $table->addColumn('mobile', Column::STRING, ['limit' => 16, 'comment' => '手机']);
        $table->addColumn('status', Column::TINYINTEGER, ['default' => null, 'comment' => '禁用']);
        $table->addColumn('login_at', Column::DATETIME, ['comment' => '登录时间']);
        $table->addColumn('created_at', Column::DATETIME, ['comment' => '创建时间']);
        $table->addColumn('updated_at', Column::DATETIME, ['comment' => '更新时间']);
        $table->addIndex('username', ['name' => 'username', 'unique' => true]);
        $table->create();

        $table->insert([
            'username' => 'admin',
            'nickname' => '超级管理员',
            // 密码为：admin
            'password' => '$2y$12$42YVLih66nbBjkfoP75vxOjU/YqI1KDexWdudwhUrbWZSxw6PEoqu',
            'avatar' => '/app/admin/avatar.png',
            'email' => null,
            'mobile' => null,
            'status' => null,
            'login_at' => null,
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        $table->saveData();
    }
}
