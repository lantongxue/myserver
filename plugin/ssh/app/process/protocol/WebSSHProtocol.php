<?php

namespace plugin\ssh\app\process\protocol;

use Exception;

class WebSSHProtocol
{
    public static function encode(Cmd $cmd, string $body): string
    {
        // 1. 编码指令（直接使用1字节）
        $cmdBin = pack('C', $cmd->value);

        // 2. 编码长度（4字节大端序）
        $len = strlen($body);
        $lenBin = pack('N', $len);  // 'N' 表示32位大端序

        // 3. 计算CRC32（覆盖 CMD + LEN + BODY）
        $crcData = $cmdBin . $lenBin . $body;
        $crc32 = crc32($crcData);
        $crcBin = pack('N', $crc32);  // 大端序4字节

        return $cmdBin . $lenBin . $body . $crcBin;
    }

    public static function decode(string $data): array
    {
        // 最小长度校验（CMD 1 + LEN 4 + CRC32 4 = 9字节）
        if (strlen($data) < 9) {
            throw new Exception("Invalid packet: too short");
        }

        // 1. 解析指令（直接读取1字节）
        $cmd = ord($data[0]);

        // 2. 解析长度（4字节大端序）
        $lenBin = substr($data, 1, 4);
        $len = unpack('N', $lenBin)[1];  // 'N' 解析大端序32位整数

        // 3. 检查数据完整性（总长度应为 1 + 4 + $len + 4 = 9 + $len）
        if (strlen($data) < 9 + $len) {
            throw new Exception("Invalid packet: incomplete body");
        }

        // 4. 提取内容和CRC32
        $body = substr($data, 5, $len);
        $crcReceived = substr($data, 5 + $len, 4);

        // 5. 重新计算CRC32
        $crcData = substr($data, 0, 5 + $len);  // CMD(1) + LEN(4) + BODY($len)
        $crcCalculated = crc32($crcData);
        $crcCalculatedBin = pack('N', $crcCalculated);

        // 6. 校验比对
        if ($crcCalculatedBin !== $crcReceived) {
            throw new Exception("CRC32 mismatch");
        }

        return [
            'cmd' => $cmd,
            'len' => $len,
            'body' => $body,
            'crc_valid' => true
        ];
    }

}