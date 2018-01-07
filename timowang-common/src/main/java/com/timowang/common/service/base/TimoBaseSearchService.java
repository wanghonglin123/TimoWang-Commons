package com.timowang.common.service.base;
/**
 * @Title: TimoSearchService
 * @Package: com.timowang.common.service.base
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 2:20
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoBaseException;
import com.timowang.common.exception.TimoSearchException;

/**
 * @ClassName: TimoSearchService
 * @Description:    搜索接口
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 2:20
 */
public interface TimoBaseSearchService<T extends TimoBasePoAdapter, E extends TimoBaseException> extends TimoBaseService<T, E> {
    void search() throws E;
}
