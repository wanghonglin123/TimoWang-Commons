package com.timowang.common.service;
/**
 * @Title: TimoServiceExt
 * @Package: com.timowang.common.service
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 12:44
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.service.base.TimoAbstractSeivice;

/**
 * @ClassName: TimoServiceExt
 * @Description: 公共接口扩展，所有业务接口必须继承此接口
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 12:44
 */
public abstract class TimoServiceExt<T extends TimoBasePoAdapter>
        extends TimoAbstractSeivice<T> {

}
