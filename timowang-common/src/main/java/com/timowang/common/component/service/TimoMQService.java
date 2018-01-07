package com.timowang.common.component.service;
/**
 * @Title: TimoMQService
 * @Package: com.timowang.common.component.service
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 5:15
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoMQException;
import com.timowang.common.service.base.TimoAbstractMQService;
import org.springframework.stereotype.Component;

/**
 * @ClassName: TimoMQService
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 5:15
 */
@Component
public class TimoMQService<T extends TimoBasePoAdapter> extends TimoAbstractMQService<T> {

    @Override
    public int add(T po) throws TimoMQException {
        return 0;
    }

    @Override
    public int edit(T po) throws TimoMQException {
        return 0;
    }

    @Override
    public int del(long idxCode) throws TimoMQException {
        return 0;
    }

    @Override
    public T queryOne(long idxCode) throws TimoMQException {
        return null;
    }
}
