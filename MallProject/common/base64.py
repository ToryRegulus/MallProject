import string

# base字符集
base64_charset = string.ascii_uppercase + string.ascii_lowercase + \
    string.digits + '+/'


def encode(origin):
    """base64加密"""
    # {:0>8}不足8位最前处填充0
    base64_bytes = [
        '{:0>8}'.format(str(bin(vo)).replace('0b', '')) for vo in origin
    ]

    resp = list()
    nums = len(base64_bytes) // 3
    remain = len(base64_bytes) % 3

    integral_part = base64_bytes[0:3 * nums]  # 每3个字节作为一组的列表

    while integral_part:
        tmp_unit = ''.join(integral_part[0:3])  # 取3个字节，每字节6位，并转化为字符串

        # 转换为4个十进制数
        tmp_unit = [int(tmp_unit[vo:vo + 6], 2) for vo in [0, 6, 12, 18]]

        # 取对应base64字符
        resp += ''.join([base64_charset[vo] for vo in tmp_unit])

        integral_part = integral_part[3:]

    if remain:
        # 补齐三个字节，每个字节补充 0000 0000
        remain_part = ''.join(base64_bytes[3 * nums:]) + (3 - remain) * 8 * '0'

        # 取前（剩余字节+1）个字节
        tmp_unit = [int(remain_part[x:x + 6], 2)
                    for x in [0, 6, 12, 18]][:remain + 1]

        # 剩余字节构造补充相应'='
        resp += ''.join([base64_charset[i]
                         for i in tmp_unit]) + (3 - remain) * '='

    return resp


def base64_encode(para):
    base64 = str()
    utf = para.encode()   # 转化为UTF-8编码
    base64 = ''.join(encode(utf))
    return(base64)
