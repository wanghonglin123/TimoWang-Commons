package com.timowang.common.exception;
/**
 * @Title: TimoException
 * @Package: com.timowang.common.exception
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:30
 * @Version: V2.0.0
 */

/**
 * @ClassName: TimoException
 * @Description: 父类异常
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:30
 */
public class TimoException extends TimoBaseException{
    public TimoException() {
        super();
    }

    public TimoException(String message) {
        super(message);
    }

    public TimoException(String message, Throwable cause) {
        super(message, cause);
    }

    public TimoException(Throwable cause) {
        super(cause);
    }

    protected TimoException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
