<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class SshServer extends AbstractMigration
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
        $table = $this->table('ssh_server', ['comment' => 'SSH服务器']);
        $table->addColumn('host', Column::STRING, ['limit' => 100, 'comment' => '主机地址']);
        $table->addColumn('port', Column::INTEGER, ['default' => 22, 'comment' => '端口']);
        $table->addColumn('auth', Column::ENUM, ['values' => ['none', 'password', 'publickey'], 'comment' => '认证方式']);
        $table->addColumn('username', Column::STRING, ['limit' => 100, 'comment' => '账号']);
        $table->addColumn('password', Column::STRING, ['limit' => 100, 'comment' => '密码']);
        $table->addColumn('publickey', Column::TEXT, ['comment' => '公钥']);
        $table->addColumn('privatekey', Column::TEXT, ['comment' => '私钥']);
        $table->addColumn('passphrase', Column::TEXT, ['comment' => '证书密码']);
        $table->addColumn('admin_id', Column::INTEGER, ['comment' => '创建人']);
        $table->addColumn('created_at', Column::DATETIME, ['comment' => '创建时间']);
        $table->addColumn('updated_at', Column::DATETIME, ['comment' => '更新时间']);
        $table->create();
    }
}
