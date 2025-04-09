<?php

namespace plugin\admin\app\controller;

use support\Request;
use support\Response;
use plugin\admin\app\model\AppSmsToken;
use plugin\admin\app\controller\Crud;
use support\exception\BusinessException;

/**
 * 授权管理 
 */
class AppSmsTokenController extends Crud
{
    
    /**
     * @var AppSmsToken
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new AppSmsToken;
    }
    
    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('app-sms-token/index');
    }

    /**
     * 插入
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function insert(Request $request): Response
    {
        if ($request->method() === 'POST') {
            $data = $this->insertInput($request);
            $data['token'] = md5($data['ua'].$data['mobile'].time());
            $id = $this->doInsert($data);
            return $this->json(0, 'ok', ['id' => $id]);
        }
        return view('app-sms-token/insert');
    }

    /**
     * 更新
     * @param Request $request
     * @return Response
     * @throws BusinessException
    */
    public function update(Request $request): Response
    {
        if ($request->method() === 'POST') {
            [$id, $data] = $this->updateInput($request);
            $data['token'] = md5($data['ua'].$data['mobile'].time());
            $this->doUpdate($id, $data);
            return $this->json(0);
        }
        return view('app-sms-token/update');
    }

}
