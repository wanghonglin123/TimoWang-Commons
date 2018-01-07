package com.timowang.common.component.service;
/**
 * @Title: TimoDbService
 * @Package: com.timowang.common.component.service
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 4:53
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoDBException;
import com.timowang.common.service.base.TimoAbstractDBService;
import org.springframework.stereotype.Component;

/**
 * @ClassName: TimoDbService
 * @Description:    DB接口服务
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 4:53
 */
@Component
public class TimoDbService<T extends TimoBasePoAdapter> extends TimoAbstractDBService<T>{

    @Override
    public int add(T po) throws TimoDBException {
        return 0;
    }

    @Override
    public int edit(T po) throws TimoDBException {
        return 0;
    }

    @Override
    public int del(long idxCode) throws TimoDBException {
        return 0;
    }

    @Override
    public T queryOne(long idxCode) throws TimoDBException {
        return null;
    }

    @Override
    public void template() throws TimoDBException {

    }
}
