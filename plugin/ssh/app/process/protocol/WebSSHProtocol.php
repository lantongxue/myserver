<?php

namespace plugin\ssh\app\process\protocol;

use Exception;

class WebSSHProtocol
{
    /**
     * 协议格式
     * 字段    字节长度    描述
     * CMD    1 Byte    指令类型（直接使用完整1字节，如 0x01=输入、0x02=输出等）
     * LEN    4 Bytes    Body长度（大端序，32位无符号整数，支持最大 4,294,967,295 字节）
     * BODY    变长    实际数据内容
     * CRC32    4 Bytes    CRC32校验（大端序，覆盖 CMD + LEN + BODY）
     */

    // 0x00 ~ 0x0F 基础指令段
    // 0x10 ~ 0x1F 保留
    // 0x20 ~ 0x2F SSH指令段
    // 0x30 ~ 0x3F 保留
    // 0x40 ~ 0x4F SFTP指令段
    // 0x50 ~ 0x5F 保留
    // 0x60 ~ 0x6F 保留
    // 0x70 ~ 0x7F 保留
    // 0x80 ~ 0x8F 保留
    // 0x90 ~ 0x9F 保留
    // 0xA0 ~ 0xAF 保留
    // 0xB0 ~ 0xBF 保留
    // 0xC0 ~ 0xCF 保留
    // 0xD0 ~ 0xDF 保留
    // 0xE0 ~ 0xEF 保留
    // 0xF0 ~ 0xFF 保留
    public const int CMD_AUTH_OK = 0x01;

    public const int CMD_HEARTBEAT = 0x02;

    public const int CMD_REQUEST_SHELL = 0x10;

    public const int CMD_SSH_INPUT = 0x21;

    public const int CMD_SSH_OUTPUT = 0x22;

    public const int CMD_SSH_RESIZE = 0x23;


    public static function encode(int $cmd, string $body): string
    {
        // 1. 编码指令（直接使用1字节）
        $cmdBin = pack('C', $cmd);

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