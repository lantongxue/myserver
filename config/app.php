<?php
/**
 * This file is part of webman.
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the MIT-LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @author    walkor<walkor@workerman.net>
 * @copyright walkor<walkor@workerman.net>
 * @link      http://www.workerman.net/
 * @license   http://www.opensource.org/licenses/mit-license.php MIT License
 */

use support\Request;

return [
    'debug' => env('APP_DEBUG', false),
    // 说明一下为什么忽略E_USER_DEPRECATED错误
    // 因为这个PR：https://github.com/cakephp/phinx/pull/2327
    // phinx 将会在0.17.0版本移除Util::mapClassNameToFileName方法，当前版本0.16.6标记了废弃
    // 目前此方法触发了一个手动标记的废弃错误，所以在0.17.0发布之前，要忽略这个错误
    'error_reporting' => E_ALL & ~(E_USER_DEPRECATED),
    'default_timezone' => 'Asia/Shanghai',
    'request_class' => Request::class,
    'public_path' => base_path() . DIRECTORY_SEPARATOR . 'public',
    'runtime_path' => base_path(false) . DIRECTORY_SEPARATOR . 'runtime',
    'controller_suffix' => 'Controller',
    'controller_reuse' => false,
];
