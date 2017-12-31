package com.timowang.common.component.log;
/**
 * @Title: TimoFlogger
 * @Package: com.timowang.common.component.log
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:04
 * @Version: V2.0.0
 */

import com.timowang.common.component.log.adapter.TimoLoggerAdapter;
import com.timowang.common.configura.TimoBaseConfigura;
import com.timowang.common.constants.TimoWangConstant;
import com.timowang.common.exception.TimoLogExecption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * @ClassName: TimoFlogger
 * @Description:    Flogger日志记录器实现
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:04
 */
@Component
public class TimoFlogger extends TimoBaseConfigura implements TimoLoggerAdapter{

    @Autowired
    private TimoLog timoLog;

    @Override
    public void info(Class<?> clazz, Exception ex, String logMsg) {
        this.logPrint(clazz, ex, logMsg, TimoWangConstant.TWO);
    }

    @Override
    public void error(Class<?> clazz, Exception ex, String logMsg) {
        this.logPrint(clazz, ex, logMsg, TimoWangConstant.THREE);
    }

    @Override
    public void warn(Class<?> clazz, Exception ex, String logMsg) {
        this.logPrint(clazz, ex, logMsg, TimoWangConstant.FORE);
    }

    @Override
    public void debug(Class<?> clazz, Exception ex, String logMsg) {
        this.logPrint(clazz, ex, logMsg, TimoWangConstant.ONE);
    }

    @Override
    public void debug(Class<?> clazz, String logMsg) {
        this.logPrint(clazz, null, logMsg, TimoWangConstant.ONE);
    }

    @Override
    public void info(Class<?> clazz, String logMsg) {
        this.logPrint(clazz, null, logMsg, TimoWangConstant.TWO);
    }

    @Override
    public void error(Class<?> clazz, String logMsg) {
        this.logPrint(clazz, null, logMsg, TimoWangConstant.THREE);
    }

    @Override
    public void warn(Class<?> clazz, String logMsg) {
        this.logPrint(clazz, null, logMsg, TimoWangConstant.FORE);
    }

    @Override
    public void warn(Class<?> clazz, Throwable throwable, String logMsg) {
        this.logPrint(clazz, throwable, logMsg, TimoWangConstant.FORE);
    }

    @Override
    public void info(Class<?> clazz, Throwable throwable, String logMsg) {
        this.logPrint(clazz, throwable, logMsg, TimoWangConstant.TWO);
    }

    @Override
    public void error(Class<?> clazz, Throwable throwable, String logMsg) {
        this.logPrint(clazz, throwable, logMsg, TimoWangConstant.THREE);
    }

    @Override
    public void debug(Class<?> clazz, Throwable throwable, String logMsg) {
        this.logPrint(clazz, throwable, logMsg, TimoWangConstant.ONE);
    }

    /**
     * 异常打印
     * @param clazz 操作类
     * @param ex 异常
     * @param logMsg 日志信息
     * @param level 日志级别
     */
    private void logPrint(Class<?> clazz, Throwable ex, String logMsg, short level) {
        try {
            String msg = getMsg(clazz, ex, logMsg);
        } catch (TimoLogExecption e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取日志打印信息
     * @param clazz
     * @param ex
     * @param logMsg
     * @return
     */
    private String getMsg(Class<?> clazz, Throwable ex, String logMsg) throws TimoLogExecption{
        if (clazz == null || StringUtils.isEmpty(logMsg)) {
            throw new TimoLogExecption();
        }
        return null;
    }
}
