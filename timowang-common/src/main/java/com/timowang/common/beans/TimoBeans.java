package com.timowang.common.beans;
/**
 * @Title: TimoComponent
 * @Package: com.timowang.common
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 12:12
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.log.TimoLogAdapter;
import com.timowang.common.component.domain.TimoWangDomain;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName: TimoComponent
 * @Description: beans 所有，全部bean 注入在这里，提供get方法获取bean
 * 用处：减少bean的内存大小，提高代码耦合度，提高代码使用率，减少代码量，性能提升
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 12:12
 */
public class TimoBeans extends TaskBeans {
    /**
     * 环境
     */
    @Autowired
    private TimoWangDomain timoWangDomain;

    /**
     * 日志组件
     */
    //@Autowired
    private TimoLogAdapter logAdapter;

    /*@Autowired
    protected TimoLoggerAdapter timoLoggerAdapter;*/
    /**
     * 获取运行环境name
     * @return
     */
    protected String getDomain() {
        return timoWangDomain.getDomain();
    }

    public TimoWangDomain getTimoWangDomain() {
        return timoWangDomain;
    }

    public TimoLogAdapter getLogAdapter() {
        return logAdapter;
    }
}
