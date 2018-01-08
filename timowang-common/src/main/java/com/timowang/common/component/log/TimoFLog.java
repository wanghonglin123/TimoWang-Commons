package com.timowang.common.component.log;
/**
 * @Title: TimoLog
 * @Package: com.timowang.common.component.log
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:20
 * @Version: V2.0.0
 */

import com.cyfonly.flogger.FLogger;
import com.timowang.common.adapter.log.TimoLogAdapter;
import org.springframework.stereotype.Component;

/**
 * @ClassName: TimoLog
 * @Description:    Flogger 日志组件实现
 * @Author: WangHongLin
 * @Date: 2018-01-01 上午 12:20
 */
//@Component
public class TimoFLog implements TimoLogAdapter {

    private static final FLogger FLOGGER = FLogger.getInstance();

    @Override
    public void debug(String msg) {
        FLOGGER.debug(msg);
    }

    @Override
    public void info(String msg) {
        FLOGGER.info(msg);
    }

    @Override
    public void error(String msg) {
        FLOGGER.error(msg);
    }

    @Override
    public void warn(String msg) {
        FLOGGER.warn(msg);
    }
}
