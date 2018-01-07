package com.timowang.common.service.base;
/**
 * @Title: TimoAbstractSearchService
 * @Package: com.timowang.common.service.base
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 2:10
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoBaseException;
import com.timowang.common.exception.TimoSearchException;

/**
 * @ClassName: TimoAbstractSearchService
 * @Description: 搜索服务接口抽象，
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 2:10
 */
public abstract class TimoAbstractSearchService<T extends TimoBasePoAdapter>
        extends TimoAbstactBaseService<T, TimoSearchException> implements TimoBaseSearchService<T, TimoSearchException> {

}
