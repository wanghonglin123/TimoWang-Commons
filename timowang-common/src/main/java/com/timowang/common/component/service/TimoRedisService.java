package com.timowang.common.component.service;
/**
 * @Title: TimoRedisService
 * @Package: com.timowang.common.component.service
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 5:13
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoRedisException;
import com.timowang.common.service.base.TimoAbstractRedisService;
import org.springframework.stereotype.Component;

/**
 * @ClassName: TimoRedisService
 * @Description: 缓存接口服务
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 5:13
 */
@Component
public class TimoRedisService<T extends TimoBasePoAdapter> extends TimoAbstractRedisService<T> {

    @Override
    public int add(T po) throws TimoRedisException {
        return 0;
    }

    @Override
    public int edit(T po) throws TimoRedisException {
        return 0;
    }

    @Override
    public int del(long idxCode) throws TimoRedisException {
        return 0;
    }

    @Override
    public T queryOne(long idxCode) throws TimoRedisException {
        return null;
    }
}
