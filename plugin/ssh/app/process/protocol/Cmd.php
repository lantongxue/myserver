<?php

namespace plugin\ssh\app\process\protocol;

enum Cmd: int
{
    /**
     * 协议格式
     * 字段    字节长度    描述
     * CMD    1 Byte    指令类型（直接使用完整1字节，如 0x01=输入、0x02=输出等）
     * LEN    4 Bytes    Body长度（大端序，32位无符号整数，支持最大 4,294,967,295 字节）
     * BODY    变长    实际数据内容
     * CRC32    4 Bytes    CRC32校验（大端序，覆盖 CMD + LEN + BODY）
     */

    // 协议指令
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

    case AuthOk = 0x01;

    case Heartbeat = 0x02;

    case SshLogin = 0x10;

    case SshInput = 0x21;

    case SshOutput = 0x22;

    case SshResize = 0x23;

}
