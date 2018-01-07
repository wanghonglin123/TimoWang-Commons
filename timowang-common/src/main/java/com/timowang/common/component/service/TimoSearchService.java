package com.timowang.common.component.service;
/**
 * @Title: TimoSearchService
 * @Package: com.timowang.common.component.service
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 5:32
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoSearchException;
import com.timowang.common.service.base.TimoAbstractMQService;
import com.timowang.common.service.base.TimoAbstractSearchService;
import org.springframework.stereotype.Component;

/**
 * @ClassName: TimoSearchService
 * @Description:   搜索接口服务
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 5:32
 */
@Component
public class TimoSearchService <T extends TimoBasePoAdapter> extends TimoAbstractSearchService<T> {

    @Override
    public int add(T po) throws TimoSearchException {
        return 0;
    }

    @Override
    public int edit(T po) throws TimoSearchException {
        return 0;
    }

    @Override
    public void search() throws TimoSearchException {

    }

    @Override
    public int del(long idxCode) throws TimoSearchException {
        return 0;
    }

    @Override
    public T queryOne(long idxCode) throws TimoSearchException {
        return null;
    }
}
