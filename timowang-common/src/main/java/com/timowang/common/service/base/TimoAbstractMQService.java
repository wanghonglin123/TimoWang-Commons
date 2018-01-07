package com.timowang.common.service.base;
/**
 * @Title: TimoAbstractMQService
 * @Package: com.timowang.common.service.base
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 2:01
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoMQException;

/**
 * @ClassName: TimoAbstractMQService
 * @Description: MQ服务，提供MQ所有的接口操作，用于扩展和抽取相同代码
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 2:01
 */
public abstract class TimoAbstractMQService<T extends TimoBasePoAdapter>
        extends TimoAbstactBaseService<T, TimoMQException> implements TimoBaseMQService<T, TimoMQException>{

}
