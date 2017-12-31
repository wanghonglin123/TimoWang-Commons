package com.timowang.common.component.log.adapter;
/**
 * @Title: TimoLogAdapter
 * @Package: com.timowang.common.component.log.adapter
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:03
 * @Version: V2.0.0
 */

/**
 * @ClassName: TimoLogAdapter
 * @Description: 日志适配器
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:03
 */
public interface TimoLogAdapter {
    /**
     * deg
     * @param msg
     */
    void debug(String msg);

    /**
     * info
     * @param msg
     */
    void info(String msg);

    /**
     * error
     * @param msg
     */
    void error(String msg);

    /**
     * warn
     * @param msg
     */
    void warn(String msg);
}
