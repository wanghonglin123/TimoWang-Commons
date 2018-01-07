package com.timowang.common.service.base;
/**
 * @Title: TimoAbstractDBService
 * @Package: com.timowang.common.service.base
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 9:37
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoBaseException;
import com.timowang.common.exception.TimoDBException;

/**
 * @ClassName: TimoAbstractDBService
 * @Description:  DB 数据库服务，提供DB所有接口操作，用于扩展和抽取相同代码
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 9:37
 */
public abstract class TimoAbstractDBService<T extends TimoBasePoAdapter>
        extends TimoAbstactBaseService<T, TimoDBException>implements TimoBaseDBService<T, TimoDBException> {

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
}
