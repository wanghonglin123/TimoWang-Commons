package com.timowang.common.service.base;
/**
 * @Title: TimoAbstractSeivice
 * @Package: com.timowang.common.service.base
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 12:39
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoException;

/**
 * @ClassName: TimoAbstractSeivice
 * @Description: 公共接口
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 12:39
 */
public abstract class TimoAbstractSeivice<T extends TimoBasePoAdapter>
        extends TimoAbstactBaseService<T, TimoException> implements TimoBaseService<T, TimoException> {

    @Override
    public int add(T po) throws TimoException {
        return 0;
    }

    @Override
    public int edit(T po) throws TimoException {
        return 0;
    }

    @Override
    public int del(long idxCode) throws TimoException {
        return 0;
    }

    @Override
    public T queryOne(long idxCode) throws TimoException {
        return null;
    }
}
