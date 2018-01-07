package com.timowang.common.service.base;
/**
 * @Title: TimoBaseService
 * @Package: com.timowang.common.service.base
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 9:49
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;
import com.timowang.common.exception.TimoBaseException;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName: TimoBaseService
 * @Description: 接口顶级父类
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 9:49
 */
public interface TimoBaseService<T extends TimoBasePoAdapter, E extends TimoBaseException>{
    int add(T po) throws E;
    int edit(T po) throws E;
    int del(long idxCode) throws E;
    T queryOne(long idxCode) throws E;
}
