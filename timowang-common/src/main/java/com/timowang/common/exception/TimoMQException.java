package com.timowang.common.exception;
/**
 * @Title: TimoMQException
 * @Package: com.timowang.common.exception
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:23
 * @Version: V2.0.0
 */

/**
 * @ClassName: TimoMQException
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:23
 */
public class TimoMQException extends TimoBaseException{
    public TimoMQException() {
        super();
    }

    public TimoMQException(String message) {
        super(message);
    }

    public TimoMQException(String message, Throwable cause) {
        super(message, cause);
    }

    public TimoMQException(Throwable cause) {
        super(cause);
    }

    protected TimoMQException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
