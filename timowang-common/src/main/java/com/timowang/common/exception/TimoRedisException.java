package com.timowang.common.exception;
/**
 * @Title: TimoRedisException
 * @Package: com.timowang.common.exception
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:22
 * @Version: V2.0.0
 */

/**
 * @ClassName: TimoRedisException
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:22
 */
public class TimoRedisException extends TimoBaseException{
    public TimoRedisException() {
        super();
    }

    public TimoRedisException(String message) {
        super(message);
    }

    public TimoRedisException(String message, Throwable cause) {
        super(message, cause);
    }

    public TimoRedisException(Throwable cause) {
        super(cause);
    }

    protected TimoRedisException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
