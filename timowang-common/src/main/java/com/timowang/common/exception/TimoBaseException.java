package com.timowang.common.exception;
/**
 * @Title: TimoBaseException
 * @Package: com.timowang.common.exception
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:21
 * @Version: V2.0.0
 */

/**
 * @ClassName: TimoBaseException
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:21
 */
public class TimoBaseException extends Exception{
    public TimoBaseException() {
        super();
    }

    public TimoBaseException(String message) {
        super(message);
    }

    public TimoBaseException(String message, Throwable cause) {
        super(message, cause);
    }

    public TimoBaseException(Throwable cause) {
        super(cause);
    }

    protected TimoBaseException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
