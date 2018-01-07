package com.timowang.common.service.base;
/**
 * @Title: TimoDBService
 * @Package: com.timowang.common.service.base
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 2:19
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoBaseException;

/**
 * @ClassName: TimoDBService
 * @Description: DB 接口
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 2:19
 */
public interface TimoBaseDBService<T extends TimoBasePoAdapter, E extends TimoBaseException> extends TimoBaseService<T, E> {
    void template() throws E;
}
