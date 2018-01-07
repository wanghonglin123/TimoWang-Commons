package com.timowang.common.service.base;
/**
 * @Title: TimoAbstractRedisService
 * @Package: com.timowang.common.service.base
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 2:05
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoRedisException;

/**
 * @ClassName: TimoAbstractRedisService
 * @Description: redis 缓存服务接口抽象，用于扩展和抽取相同代码
 * @Author: WangHongLin
 * @Date: 2018-01-07 上午 2:05
 */
public abstract class TimoAbstractRedisService<T extends TimoBasePoAdapter>
        extends TimoAbstactBaseService<T, TimoRedisException> implements TimoBaseRedisService<T, TimoRedisException> {

}
