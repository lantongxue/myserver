class BinaryProtocol {

    static encode(cmd, payload) {
        const encoder = new TextEncoder();
        const bodyBytes = encoder.encode(payload);

        // 创建数据缓冲区（CMD + LEN + BODY）
        const headerSize = 1 + 4; // cmd(1) + len(4)
        const crcSize = 4;
        const totalSize = headerSize + bodyBytes.length + crcSize;

        // 创建 ArrayBuffer
        const buffer = new ArrayBuffer(totalSize);
        const view = new DataView(buffer);
        const uint8Array = new Uint8Array(buffer);
        // 填充 CMD（1字节）
        let offset = 0;
        view.setUint8(offset, cmd);
        offset += 1;
        // 填充 LEN（4字节，大端序）
        view.setUint32(offset, bodyBytes.length, false); // false 表示大端序
        offset += 4;
        // 填充 BODY
        uint8Array.set(bodyBytes, offset);
        offset += bodyBytes.length;
        // 计算 CRC32（计算范围：CMD + LEN + BODY）
        const crcData = uint8Array.subarray(0, offset); // 获取不含CRC的部分
        const crcValue = CRC32.buf(crcData) >>> 0; // 转成无符号32位整数

        // 填充 CRC32（4字节，大端序）
        view.setUint32(offset, crcValue, false);
        return buffer;
    }
    static decode(data) {
        const view = new DataView(data);
        let offset = 0;

        // 解析头部
        const cmd = view.getUint8(offset);
        offset += 1;

        const len = view.getUint32(offset, false); // 大端序
        offset += 4;

        // 验证数据长度
        if (data.byteLength !== 9 + len) {
            throw new Error(`Invalid packet length, expected ${9 + len} got ${data.byteLength}`);
        }

        // 提取body
        const bodyBytes = new Uint8Array(data, offset, len);
        offset += len;

        // 验证CRC
        const receivedCrc = view.getUint32(offset, false);
        const calculatedCrc = this.calculateCrc(data, 0, 9 + len - 4);

        if (receivedCrc !== calculatedCrc) {
            throw new Error(`CRC mismatch: ${receivedCrc} vs ${calculatedCrc}`);
        }

        // 转换body为文本
        const decoder = new TextDecoder();
        const body = decoder.decode(bodyBytes);

        return { cmd, len, body };
    }

    static calculateCrc(buffer, start, end) {
        // 使用第三方库（如 https://www.npmjs.com/package/crc-32）
        const slice = new Uint8Array(buffer, start, end - start);
        return CRC32.buf(slice) >>> 0; // 转换为无符号32位
    }
}
