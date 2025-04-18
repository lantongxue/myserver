<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class WaRoles extends AbstractMigration
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
        $table = $this->table('wa_roles', ['comment' => '管理员角色']);
        $table->addColumn('name', Column::STRING, ['limit' => 80, 'comment' => '角色组']);
        $table->addColumn('rules', Column::TEXT, ['comment' => '权限']);
        $table->addColumn('pid', Column::INTEGER, ['signed' => false, 'comment' => '父级']);
        $table->addColumn('created_at', Column::DATETIME, ['comment' => '创建时间']);
        $table->addColumn('updated_at', Column::DATETIME, ['comment' => '更新时间']);
        $table->create();
    }
}
