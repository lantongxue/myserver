<?php

declare(strict_types=1);

use Phinx\Db\Table\Column;
use Phinx\Migration\AbstractMigration;

final class WaUploads extends AbstractMigration
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
        $table = $this->table('wa_uploads', ['comment' => '附件']);
        $table->addColumn('name', Column::STRING, ['limit' => 128, 'comment' => '名称']);
        $table->addColumn('url', Column::STRING, ['limit' => 255, 'comment' => '文件']);
        $table->addColumn('admin_id', Column::INTEGER, ['comment' => '管理员']);
        $table->addColumn('file_size', Column::INTEGER, ['comment' => '文件大小']);
        $table->addColumn('mime_type', Column::STRING, ['limit' => 255, 'comment' => 'mime类型']);
        $table->addColumn('image_width', Column::INTEGER, ['comment' => '图片宽度']);
        $table->addColumn('image_height', Column::INTEGER, ['comment' => '图片高度']);
        $table->addColumn('ext', Column::STRING, ['limit' => 128, 'comment' => '扩展名']);
        $table->addColumn('storage', Column::STRING, ['limit' => 255, 'default' => 'local', 'comment' => '存储位置']);
        $table->addColumn('category', Column::STRING, ['limit' => 128, 'comment' => '类别']);
        $table->addColumn('created_at', Column::DATETIME, ['comment' => '创建时间']);
        $table->addColumn('updated_at', Column::DATETIME, ['comment' => '更新时间']);
        $table->addIndex('admin_id', ['name' => 'admin_id']);
        $table->addIndex('category', ['name' => 'category']);
        $table->addIndex('ext', ['name' => 'ext']);
        $table->addIndex('name', ['name' => 'name']);
        $table->create();
    }
}
