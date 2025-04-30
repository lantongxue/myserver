<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class SshToken extends AbstractMigration
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
        $table = $this->table('ssh_token', ['comment' => 'SSH授权']);
        $table->addColumn('server_id', Column::INTEGER, ['comment' => '服务器']);
        $table->addColumn('token', Column::STRING, ['comment' => 'Token']);
        $table->addColumn('expired', Column::DATETIME, ['comment' => '过期时间']);
        $table->addColumn('ip', Column::TEXT, ['comment' => '操作IP']);
        $table->addColumn('admin_id', Column::INTEGER, ['comment' => '操作人']);
        $table->addColumn('created_at', Column::DATETIME, ['comment' => '创建时间']);
        $table->addColumn('updated_at', Column::DATETIME, ['comment' => '更新时间']);
        $table->create();
    }
}
