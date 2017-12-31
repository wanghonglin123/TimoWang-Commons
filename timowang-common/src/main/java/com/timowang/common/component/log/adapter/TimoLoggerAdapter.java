package com.timowang.common.component.log.adapter;
/**
 * @Title: TimoLogger
 * @Package: com.timowang.common.component.log.adapter
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:03
 * @Version: V2.0.0
 */

/**
 * @ClassName: TimoLogger
 * @Description: 记录器适配器, 使用适配器的作用：统一使用这个
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:03
 */
public interface TimoLoggerAdapter {
    /**
     *  日志级别：Info
     * @param clazz 当前操作类
     * @param ex    异常类
     * @param logMsg
     */
    void info(Class<?> clazz, Exception ex, String logMsg);

    /**
     *  日志级别：error
     * @param clazz 当前操作类
     * @param ex    异常类
     * @param logMsg
     */
    void error(Class<?> clazz, Exception ex, String logMsg);

    /**
     *  日志级别：warn
     * @param clazz 当前操作类
     * @param ex    异常类
     * @param logMsg
     */
    void warn(Class<?> clazz, Exception ex, String logMsg);

    /**
     *  日志级别：debug
     * @param clazz 当前操作类
     * @param ex    异常类
     * @param logMsg
     */
    void debug(Class<?> clazz, Exception ex, String logMsg);

    /**
     *  日志级别：debug
     * @param clazz 当前操作类
     * @param logMsg
     */
    void debug(Class<?> clazz,  String logMsg);

    /**
     *  日志级别：info
     * @param clazz 当前操作类
     * @param logMsg
     */
    void info(Class<?> clazz,  String logMsg);

    /**
     *  日志级别：error
     * @param clazz 当前操作类
     * @param logMsg
     */
    void error(Class<?> clazz,  String logMsg);

    /**
     *  日志级别：warn
     * @param clazz 当前操作类
     * @param logMsg
     */
    void warn(Class<?> clazz,  String logMsg);

    /**
     *  日志级别：warn
     * @param clazz 当前操作类
     * @param throwable 异常
     * @param logMsg
     */
    void warn(Class<?> clazz, Throwable throwable, String logMsg);

    /**
     *  日志级别：info
     * @param clazz 当前操作类
     * @param throwable 异常
     * @param logMsg
     */
    void info(Class<?> clazz, Throwable throwable, String logMsg);

    /**
     *  日志级别：error
     * @param clazz 当前操作类
     * @param throwable 异常
     * @param logMsg
     */
    void error(Class<?> clazz, Throwable throwable, String logMsg);

    /**
     *  日志级别：debug
     * @param clazz 当前操作类
     * @param throwable 异常
     * @param logMsg
     */
    void debug(Class<?> clazz, Throwable throwable, String logMsg);
}
