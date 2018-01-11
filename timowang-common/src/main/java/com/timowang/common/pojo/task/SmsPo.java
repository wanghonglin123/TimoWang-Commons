package com.timowang.common.pojo.task;
/**
 * @Title: SmsPo
 * @Package: com.timowang.common.pojo.task
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 12:07
 * @Version: V2.0.0
 */

import com.timowang.common.adapter.pojo.TimoBasePoAdapter;

/**
 * @ClassName: SmsPo
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-06 下午 12:07
 */
public class SmsPo implements TimoBasePoAdapter{

    private Long idx;
    private Short status;

    /**
     * @return idx
     */
    public Long getIdx() {
        return idx;
    }

    /**
     * @param idx idx
     */
    public void setIdx(Long idx) {
        this.idx = idx;
    }

    /**
     * @return status
     */
    public Short getStatus() {
        return status;
    }

    /**
     * @param status status
     */
    public void setStatus(Short status) {
        this.status = status;
    }
}
