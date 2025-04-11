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

    public function select(Request $request): Response
    {
        return parent::select($request);
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
            $post = $request->post();
            $post['token'] = md5($post['ua'].$post['mobile'].time());
            $request->setPost($post);
            return parent::insert($request);
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
            $post = $request->post();
            $post['token'] = md5($post['ua'].$post['mobile'].time());
            $request->setPost($post);
            return parent::update($request);
        }
        return view('app-sms-token/update');
    }

    public function delete(Request $request): Response
    {
        return parent::delete($request);
    }

}
