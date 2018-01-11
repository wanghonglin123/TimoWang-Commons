package com.timowang.common.task;
/**
 * @Title: DynamicTask
 * @Package: com.timowang.common.task
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-05 下午 10:35
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.adapter.task.TimoTaskAdapter;
import com.timowang.common.exception.TimoException;
import com.timowang.common.pojo.task.SmsPo;
import com.timowang.common.service.base.TimoAbstactBaseService;
import com.timowang.common.service.task.TaskService;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: DynamicTask
 * @Description: 动态任务
 * @Author: WangHongLin
 * @Date: 2018-01-05 下午 10:35
 */
public class DynamicTask<T extends TimoBasePoAdapter> implements TimoTaskAdapter<T> {
    /**
     * 任务名称
     */
    private TaskService taskServer;

    /**
     * 任务Po数据
     */
    private T taskPo;

    public DynamicTask (TaskService taskServer, T taskPo) {
        this.taskServer = taskServer;
        this.taskPo = taskPo;
    }
    /**
     * 运行动态任务
     */
    @Override
    public void run() {
        try {
            /*imoBasePoAdapter basePo = taskPo;
            List<T> list = new ArrayList<>();
            list.add(taskPo);
            for (T taskPo : list) {
                SmsPo smsPo = (SmsPo) taskPo;
                System.out.println(Thread.currentThread().getName() + "测试" + smsPo.getIdx());
            }*/
            taskServer.doTask(taskPo);
        } catch (Exception e) {
            // TODO 失败，保存到数据库
            e.printStackTrace();
            taskServer.editTask(taskPo);
        }
    }

    /**
     * @return taskServer
     */
    public TaskService getTaskServer() {
        return taskServer;
    }

    /**
     * @return taskPo
     */
    public T getTaskPo() {
        return taskPo;
    }
}
