<?php
/**
 * Here is your custom functions.
 */
function console_log(...$msg): void
{
    if (PHP_SAPI === 'cli') {
        if(config('app.debug')) {
            $backtrace = debug_backtrace(DEBUG_BACKTRACE_PROVIDE_OBJECT, 0);
            $call = $backtrace[0]['file'];
            $line = $backtrace[0]['line'];
            $debug = sprintf('[%s:%s]', $call, $line);
        } else {
            $debug = '';
        }

        $msg = array_map(function ($item) {
            if (is_array($item) || is_object($item)) {
                return json_encode($item, JSON_UNESCAPED_UNICODE);
            } if (is_bool($item)) {
                return $item ? 'true' : 'false';
            } else {
                return $item;
            }
        }, $msg);

        $str = implode('', $msg);
        echo sprintf('[%s]%s %s' . PHP_EOL, date('Y-m-d H:i:s'), $debug, $str);
    }
}