package com.timowang.common.component.log;
/**
 * @Title: TimoFlogger
 * @Package: com.timowang.common.component.log
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:04
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.log.TimoLoggerAdapter;
import com.timowang.common.beans.TimoBeans;
import com.timowang.common.constants.TimoWangConstant;
import com.timowang.common.exception.TimoLogExecption;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.util.StringUtils;

/**
 * @ClassName: TimoFlogger
 * @Description:    Flogger日志记录器实现
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:04
 */
//@Component
public class TimoLogger extends TimoBeans implements TimoLoggerAdapter{

    /**
     * 环境名称
     */
    private String domain;

    /**
     * 是否支持打印到控制台
     * 大于2，允许打印到控制台,debug,info级别需要自己打印到控制台，error,warn默认会打印到控制台
     */
    private int isPrintConole = 3;

    /**
     * 日志级别， 1：debug， 2:info ， 3:warn， 4:error
     */
    private int logLevel;

    @Override
    public void info(Class<?> clazz, Exception ex, String logMsg) {
        this.logPrint(clazz, ex, logMsg, TimoWangConstant.TWO);
    }

    @Override
    public void error(Class<?> clazz, Exception ex, String logMsg) {
        this.logPrint(clazz, ex, logMsg, TimoWangConstant.FORE);
    }

    @Override
    public void warn(Class<?> clazz, Exception ex, String logMsg) {
        this.logPrint(clazz, ex, logMsg, TimoWangConstant.THREE);
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
        String msg = null;
        try {
            // 获取打印的日志信息
            msg = getMsg(clazz, ex, logMsg);
            if (isPrintConole > 2) {
                switch (level) {
                    case TimoWangConstant.ONE :
                        System.out.println(String.format("debug#%s", msg));
                        break;
                    case TimoWangConstant.TWO :
                        System.out.println(String.format("info#%s", msg));
                        break;
                }
            }

            // 判断level 是否支持打印到日志文件
            if (logLevel > level) {
                return;
            }
            // 根据级别，打印不同的日志
            switch (level) {
                case TimoWangConstant.ONE :
                    super.getLogAdapter().debug(String.format("debug#%s", msg));
                    break;
                case TimoWangConstant.TWO :
                    super.getLogAdapter().info(String.format("info#%s", msg));
                    break;
                case TimoWangConstant.THREE :
                    super.getLogAdapter().info(String.format("warn#%s", msg));
                    break;
                case TimoWangConstant.FORE :
                    super.getLogAdapter().info(String.format("error#%s", msg));
                    break;
            }

        } catch (TimoLogExecption e) {
            msg = null;
            super.getLogAdapter().error(String.format("error#%s", "日志打印失败"));
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
            throw new TimoLogExecption("日志打印参数非法");
        }
        // 环境获取
        this.domain = super.getDomain();
        if (ex == null) {
            return String.format("environment: %s, %s, %s", domain, clazz.getName(), logMsg);
        } else {
            return String.format("environment: %s, %s, %s, %s", domain,
                    clazz.getName(), ExceptionUtils.getStackTrace(ex), logMsg);
        }
    }
}
