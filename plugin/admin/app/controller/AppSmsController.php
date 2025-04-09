<?php

namespace plugin\admin\app\controller;

use support\Request;
use support\Response;
use plugin\admin\app\model\AppSms;

/**
 * APP验证码 
 */
class AppSmsController extends Crud
{
    
    /**
     * @var AppSms
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new AppSms;
    }
    
    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('app-sms/index');
    }

    public function selectType()
    {
        $items = $this->model->select('type')->distinct()->get();
        $formatted_items = [];
        foreach ($items as $item) {
            $formatted_items[] = [
                'name' => $item->type,
                'value' => $item->type
            ];
        }
        return  $this->json(0, 'ok', $formatted_items);
    }

    public function selectApp()
    {
        $items = $this->model->select('app')->distinct()->get();
        $formatted_items = [];
        foreach ($items as $item) {
            $formatted_items[] = [
                'name' => $item->app,
                'value' => $item->app
            ];
        }
        return  $this->json(0, 'ok', $formatted_items);
    }
}
