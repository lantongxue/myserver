<?php

namespace plugin\ssh\app\controller;

use plugin\admin\app\common\Layui;
use plugin\ssh\app\model\SshToken;
use plugin\ssh\app\process\WebSSH;
use support\Request;
use support\Response;
use plugin\ssh\app\model\SshServer;
use plugin\admin\app\controller\Crud;
use support\exception\BusinessException;
use Tinywan\Jwt\JwtToken;

/**
 * SSH服务器 
 */
class SshServerController extends Crud
{
    
    /**
     * @var SshServer
     */
    protected $model = null;

    protected $dataLimit = 'personal';

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new SshServer;
    }
    
    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('ssh-server/index');
    }
    
    /**
     * 查询
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
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
            $data = $this->inputFilter($request->post());
            $data[$this->dataLimitField] = admin_id();
            $id = $this->doInsert($data);
            return $this->json(0, 'ok', ['id' => $id]);
        }
        return view('ssh-server/insert');
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
            $data = $this->inputFilter($request->post());
            $this->doUpdate($data['id'], $data);
            return $this->json(0);
        }
        return view('ssh-server/update');
    }
    
    /**
     * 删除
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function delete(Request $request): Response
    {
        return parent::delete($request);
    }

    public function selectAuthMethod(Request $request): Response
    {
        return  $this->json(0, 'ok', Layui::getXmSelectData(SshServer::getAuthMethods()));
    }

    public function login(Request $request): Response
    {
        $id = $request->get('id');
        if(empty($id)) {
            throw new BusinessException('参数错误');
        }
        $server = $this->model->where(['admin_id' => admin_id(), 'id' => $id])->first();
        if(empty($server)) {
            throw new BusinessException('无权访问');
        }

        $serverToken = new SshToken();
        $serverToken->server_id = $server->id;
        $serverToken->token = md5(admin_id() . $server->id. time());
        $serverToken->expired = date('Y-m-d H:i:s', time() + WebSSH::TOKEN_LIFETIME); // 默认1小时有效期
        $serverToken->ip = $request->getRealIp();
        $serverToken->admin_id = admin_id();
        $serverToken->save();

        $host = $request->host(true);
        $port = WebSSH::PORT;
        $path = WebSSH::PATH;
        return view('ssh-server/login', [
            'ws' => "$host:$port$path$serverToken->token",
        ]);
    }

}
