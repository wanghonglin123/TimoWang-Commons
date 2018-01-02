package com.timowang.common.exception;
/**
 * @Title: TimoLogExecption
 * @Package: com.timowang.common.exception
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 1:30
 * @Version: V2.0.0
 */

/**
 * @ClassName: TimoLogExecption
 * @Description:    自定义日志异常
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 1:30
 */
public class TimoLogExecption extends Exception{
    public TimoLogExecption() {
        super();
    }

    public TimoLogExecption(String message) {
        super(message);
    }

    public TimoLogExecption(String message, Throwable cause) {
        super(message, cause);
    }

    public TimoLogExecption(Throwable cause) {
        super(cause);
    }

    protected TimoLogExecption(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
