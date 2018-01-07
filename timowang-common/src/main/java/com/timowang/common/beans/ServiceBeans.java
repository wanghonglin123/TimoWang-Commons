package com.timowang.common.beans;
/**
 * @Title: ServiceBeans
 * @Package: com.timowang.common.beans
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 7:37
 * @Version: V2.0.0
 */

import com.timowang.common.component.service.TimoDbService;
import com.timowang.common.component.service.TimoMQService;
import com.timowang.common.component.service.TimoRedisService;
import com.timowang.common.component.service.TimoSearchService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName: ServiceBeans
 * @Description: 底层接口bean
 * @Author: WangHongLin
 * @Date: 2018-01-07 下午 7:37
 */
public class ServiceBeans {
    @Autowired
    private TimoDbService dbService;
    @Autowired
    private TimoMQService mqService;
    @Autowired
    private TimoRedisService redisService;
    @Autowired
    private TimoSearchService searchService;

    public TimoDbService getDbService() {
        return dbService;
    }

    public TimoMQService getMqService() {
        return mqService;
    }

    public TimoRedisService getRedisService() {
        return redisService;
    }

    public TimoSearchService getSearchService() {
        return searchService;
    }
}
