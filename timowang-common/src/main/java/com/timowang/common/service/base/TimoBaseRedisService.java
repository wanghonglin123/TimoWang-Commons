package com.timowang.common.service.base;
/**
 * @Title: TimoRedisService
 * @Package: com.timowang.common.service.base
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 2:12
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoBaseException;
import com.timowang.common.exception.TimoRedisException;

/**
 * @ClassName: TimoRedisService
 * @Description:    缓存接口
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 2:12
 */
public interface TimoBaseRedisService<T extends TimoBasePoAdapter,E extends TimoBaseException> extends TimoBaseService<T, E> {
}
