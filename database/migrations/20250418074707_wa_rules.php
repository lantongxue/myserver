<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class WaRules extends AbstractMigration
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
        $table = $this->table('wa_rules', ['comment' => '权限规则']);
        $table->addColumn('title', Column::STRING, ['limit' => 255, 'comment' => '标题']);
        $table->addColumn('icon', Column::STRING, ['limit' => 255, 'comment' => '图标']);
        $table->addColumn('key', Column::STRING, ['limit' => 255, 'comment' => '标识']);
        $table->addColumn('pid', Column::INTEGER, ['signed' => false, 'default' => 0, 'comment' => '上级菜单']);
        $table->addColumn('href', Column::STRING, ['limit' => 255, 'comment' => 'url']);
        $table->addColumn('type', Column::INTEGER, ['default' => 1, 'comment' => '类型']);
        $table->addColumn('weight', Column::INTEGER, ['default' => 0, 'comment' => '排序']);
        $table->addColumn('created_at', Column::DATETIME, ['comment' => '创建时间']);
        $table->addColumn('updated_at', Column::DATETIME, ['comment' => '更新时间']);
        $table->create();
    }
}
