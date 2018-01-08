package com.timowang.common.task;
/**
 * @Title: DynamicTask
 * @Package: com.timowang.common.task
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-05 下午 10:35
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.task.TimoTaskAdapter;
import com.timowang.common.service.impl.task.impl.ItemTaskServiceImpl;
import com.timowang.common.service.impl.task.impl.SmsTaskServiceImpl;
import com.timowang.common.service.task.TaskService;

import java.util.concurrent.*;

/**
 * @ClassName: DynamicTask
 * @Description: 动态任务
 * @Author: WangHongLin
 * @Date: 2018-01-05 下午 10:35
 */
public class DynamicTask implements TimoTaskAdapter {
    /**
     * 任务名称
     */
    private TaskService taskServer;

    private static int status = 0;

    public DynamicTask (TaskService taskServer) {
        this.taskServer = taskServer;
    }
    /**
     * 运行动态任务
     */
    @Override
    public void run() {
        try {
            System.out.println(1/0);
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        taskServer.doTask();
    }

    public static void main(String[] args) {
        ScheduledExecutorService executorService = Executors.newScheduledThreadPool(100);
        for(int i = 0; i < 100; i ++) {
            executorService.schedule(
                    new DynamicTask(new ItemTaskServiceImpl()), 10, TimeUnit.SECONDS);
        }
        executorService.schedule(
                new DynamicTask(new ItemTaskServiceImpl()), 10, TimeUnit.SECONDS);
    }
}
