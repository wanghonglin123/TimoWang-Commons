package com.timowang.common.exception.handler;
/**
 * @Title: TaskSchedulingExceptionHandler
 * @Package: com.timowang.common.exception.ExceptionHandler
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 上午 12:31
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.execption.handler.TimoExecptionHandlerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @ClassName: TaskSchedulingExceptionHandler
 * @Description:    任务调度异常处理器
 * @Author: WangHongLin
 * @Date: 2018-01-06 上午 12:31
 */
public class TaskSchedulingExceptionHandler implements TimoExecptionHandlerAdapter {
    private static Logger logger = LoggerFactory.getLogger(TaskSchedulingExceptionHandler.class);

    @Override
    public void uncaughtException(Thread t, Throwable e) {
        logger.error(e.getMessage());
    }
}
