<?php

namespace app\api\controller;

use plugin\admin\app\model\AppSms;
use plugin\admin\app\model\AppSmsToken;
use support\Request;

class AppSmsController
{
    public function push(Request $request, string $token)
    {
        $ua = $request->header('ua');
        if(empty($ua)) {
            return '不支持的设备';
        }

        if(empty($token)) {
            return 'token错误';
        }

        $appToken = (new AppSmsToken())->where([
            ['token', '=', $token],
            ['ua', '=', $ua],
        ])->first();

        if($appToken === null) {
            return 'token错误';
        }

        $data = $request->post();
        if(empty($data['type'])) {
            return '类型错误';
        }
        if(empty($data['sender'])) {
            return '发送人错误';
        }
        if(empty($data['text'])) {
            return '内容错误';
        }

        preg_match('/【(.*?)】/', $data['text'], $matches);

        $model = new AppSms();
        $model->type = $data['type'];
        $model->app = $matches[1] ?? '未知';
        $model->from = $appToken->mobile;
        $model->sender = $data['sender'];
        $model->content = $data['text'];
        $model->save();

        return '推送成功';
    }
}
