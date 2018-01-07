package com.timowang.common.exception;
/**
 * @Title: TimoSearchException
 * @Package: com.timowang.common.exception
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:23
 * @Version: V2.0.0
 */

/**
 * @ClassName: TimoSearchException
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 10:23
 */
public class TimoSearchException extends TimoBaseException {
    public TimoSearchException() {
        super();
    }

    public TimoSearchException(String message) {
        super(message);
    }

    public TimoSearchException(String message, Throwable cause) {
        super(message, cause);
    }

    public TimoSearchException(Throwable cause) {
        super(cause);
    }

    protected TimoSearchException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
