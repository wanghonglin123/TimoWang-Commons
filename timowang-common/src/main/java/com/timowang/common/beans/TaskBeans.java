package com.timowang.common.beans;
/**
 * @Title: TaskComponents
 * @Package: com.timowang.common.components
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 12:43
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.task.TimoTaskSchedulingAdapter;
import com.timowang.common.component.task.TaskScheduling;
import com.timowang.common.service.task.TaskService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName: TaskComponents
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 12:43
 */
class TaskBeans extends ServiceBeans{
    /**
     * 任务调度
     */
    @Autowired
    private TaskScheduling taskScheduling;

    /**
     * 商品服务
     */
    @Autowired
    private TaskService itemTaskService;

    /**
     * 商品服务
     */
    @Autowired
    private TaskService smsTaskService;

    /**
     * taskSchedulingAdapter 任务调度适配器
     */
    @Autowired
    private TimoTaskSchedulingAdapter taskSchedulingAdapter;

    public TaskScheduling getTaskScheduling() {
        return taskScheduling;
    }

    public TaskService getItemTaskService() {
        return itemTaskService;
    }

    public TimoTaskSchedulingAdapter getTaskSchedulingAdapter() {
        return taskSchedulingAdapter;
    }

    public TaskService getSmsTaskService() {
        return smsTaskService;
    }
}
