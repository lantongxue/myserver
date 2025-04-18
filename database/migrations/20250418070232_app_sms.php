<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class AppSms extends AbstractMigration
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
        $table = $this->table('app_sms', ['comment' => 'APP短信验证码']);
        // 默认会创建自增id列
        //$table->addColumn('id', 'integer', ['increment' => true]);
        $table->addColumn('from', Column::STRING, ['limit' => 11]);
        $table->addColumn('content', Column::TEXT);
        $table->addColumn('type', Column::STRING, ['limit' => 20]);
        $table->addColumn('app', Column::STRING, ['limit' => 20]);
        $table->addColumn('sender', Column::STRING, ['limit' => 20]);
        $table->addColumn('created_at', Column::DATETIME, ['comment' => '创建时间']);
        $table->addColumn('updated_at', Column::DATETIME, ['comment' => '更新时间']);
        $table->create();
    }
}
