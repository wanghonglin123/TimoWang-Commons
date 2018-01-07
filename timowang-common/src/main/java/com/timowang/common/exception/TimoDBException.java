package com.timowang.common.exception;
/**
 * @Title: TimoDBException
 * @Package: com.timowang.common.exception
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:28
 * @Version: V2.0.0
 */

/**
 * @ClassName: TimoDBException
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:28
 */
public class TimoDBException extends TimoBaseException{
    public TimoDBException() {
        super();
    }

    public TimoDBException(String message) {
        super(message);
    }

    public TimoDBException(String message, Throwable cause) {
        super(message, cause);
    }

    public TimoDBException(Throwable cause) {
        super(cause);
    }

    protected TimoDBException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
