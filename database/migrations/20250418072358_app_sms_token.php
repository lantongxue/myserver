<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class AppSmsToken extends AbstractMigration
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
        $table = $this->table('app_sms_token', ['comment' => 'APP短信验证码授权']);
        $table->addColumn('token', Column::STRING, ['limit' => 255]);
        $table->addColumn('ua', Column::STRING, ['limit' => 255]);
        $table->addColumn('mobile', Column::STRING, ['limit' => 11]);
        $table->addColumn('created_at', Column::DATETIME, ['comment' => '创建时间']);
        $table->addColumn('updated_at', Column::DATETIME, ['comment' => '更新时间']);
        $table->create();
    }
}
