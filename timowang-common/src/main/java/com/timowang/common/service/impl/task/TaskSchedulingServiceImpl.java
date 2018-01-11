/**
 * 广州市两棵树网络科技有限公司版权所有
 * DT Group Technology & commerce Co., LtdAll rights reserved.
 * <p>
 * 广州市两棵树网络科技有限公司，创立于2009年。旗下运营品牌洋葱小姐。
 * 洋葱小姐（Ms.Onion） 下属三大业务模块 [洋葱海外仓] , [洋葱DSP] , [洋葱海外聚合供应链]
 * [洋葱海外仓]（DFS）系中国海关批准的跨境电商自营平台(Cross-border ecommerce platform)，
 * 合法持有海外直邮保税模式的跨境电商营运资格。是渠道拓展，平台营运，渠道营运管理，及客户服务等前端业务模块。
 * [洋葱DSP]（DSP）系拥有1.3亿消费者大数据分析模型。 是基于客户的消费行为，消费轨迹，及多维度云算法(MDPP)
 * 沉淀而成的精准消费者模型。洋葱DSP能同时为超过36种各行业店铺 及200万个销售端口
 * 进行多店铺高精度配货，并能预判消费者购物需求进行精准推送。同时为洋葱供应链提供更前瞻的商品采买需求模型 。
 * [洋葱海外聚合供应链]（Super Supply Chain）由中国最大的进口贸易集团共同
 * 合资成立，拥有20余年的海外供应链营运经验。并已入股多家海外贸易企业，与欧美澳等9家顶级全球供应商达成战略合作伙伴关系。
 * 目前拥有835个国际品牌直接采买权，12万个单品的商品供应库。并已建设6大海外直邮仓库，为国内客户提供海外商品采买集货供应，
 * 跨境 物流，保税清关三合一的一体化模型。目前是中国唯一多模式聚合的海外商品供应链 。
 * <p>
 * 洋葱商城：http://m.msyc.cc/wx/indexView?tmn=1
 * <p>
 * 洋桃商城：http://www.yunyangtao.com
 */
package com.timowang.common.service.impl.task;

/**
 * @Title: AbstractTaskScheduling
 * @Package: com.timowang.common.abstracts.task
 * @Description:
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHongLin timo-wang@msyc.cc
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.adapter.task.TimoTaskAdapter;
import com.timowang.common.adapter.task.TimoTaskSchedulingAdapter;
import com.timowang.common.factory.TimoThreadFactory;
import com.timowang.common.service.task.TaskService;
import com.timowang.common.task.DynamicTask;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.*;

/**
 * @ClassName: AbstractTaskScheduling
 * @Description: 任务调度服务，对任务调度中心操作，停止，删除
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHonglin timo-wang@msyc.cc
 * @Date: 2018/1/5
 */
@Component
public class TaskSchedulingServiceImpl<T extends TimoBasePoAdapter> implements TimoTaskSchedulingAdapter<T> {
    /**
     * 任务调度线程池
     */
    private static ScheduledThreadPoolExecutor executorService =
            (ScheduledThreadPoolExecutor)Executors.newScheduledThreadPool(50, new TimoThreadFactory());

    /**
     * 启动线程池，执行任务
     * @param runnable
     */
    @Override
    public void start(TimoTaskAdapter runnable) throws Exception{
        this.execute(runnable /*this.addTask(runnable)*/);
    }

    /**
     * 停止线程池，执行任务
     */
    @Override
    public void stop() {
        // shutdownNow 和 shuntdown 的区别。shuntdown 不会停止已经执行的线程，shutdownNow会中断全部线程
        executorService.shutdownNow();
    }

    @Override
    public void sleep() {
        // TODO 更改任务表状态，全部改成暂停中，在Task ruan的时候多要检查下最新状态
    }

    /**
     * 执行线程池的任务调度
     * @param runnable
     */
    private void execute(TimoTaskAdapter runnable) {
        /*TaskSchedulingExceptionHandler taskSchedulingExceptionHandler = new TaskSchedulingExceptionHandler();
        Thread thread = new Thread(runnable);
        thread.setUncaughtExceptionHandler(taskSchedulingExceptionHandler);*/
        executorService.schedule(runnable, 10, TimeUnit.SECONDS);
    }

    /**
     * 添加任务调度，需要保存到zk里面，需要重启或者停止
     * 这里需要加上分布式锁
     * @param runnable
     *//*
    private TimoTaskAdapter addTask(TimoTaskAdapter runnable) {
        String key = runnable.getClass().getName();
        if (this.getTask(key) == null) {
            synchronized (key) {
                this.putTask(key, runnable);
            }
        }
        return getTask(key);
    }

    private TimoTaskAdapter getTask(String key) {
        return taskMap.get(key);
    }

    private void putTask(String key, TimoTaskAdapter task) {
        taskMap.put(key, task);
    }*/
}
