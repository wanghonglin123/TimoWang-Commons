package com.timowang.common.configura.shiro;
/**
 * @Title: TimoCachingSessionDAOConfigura
 * @Package: com.timowang.common.configura.shiro
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-21 下午 10:22
 * @Version: V2.0.0
 */

import com.timowang.common.configura.shiro.pojo.TimoSessionDao;
import org.apache.shiro.session.mgt.eis.CachingSessionDAO;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @ClassName: TimoCachingSessionDAOConfigura
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-21 下午 10:22
 */
@Configuration
public class TimoCachingSessionDAOConfigura {

    @Bean
    public CachingSessionDAO sessionDAO() {
        CachingSessionDAO cachingSessionDAO = new TimoSessionDao();
        return cachingSessionDAO;
    }

}
