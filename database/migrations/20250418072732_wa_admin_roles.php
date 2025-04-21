<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class WaAdminRoles extends AbstractMigration
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
        $table = $this->table('wa_admin_roles', ['comment' => '管理员角色表']);
        $table->addColumn('role_id', Column::INTEGER, ['comment' => '角色id']);
        $table->addColumn('admin_id', Column::INTEGER, ['comment' => '管理员id']);
        $table->addIndex(['role_id', 'admin_id'], ['name' => 'role_admin_id', 'unique' => true]);
        $table->create();

        $table->insert([
            'role_id' => 1,
            'admin_id' => 1
        ]);
        $table->saveData();
    }
}
