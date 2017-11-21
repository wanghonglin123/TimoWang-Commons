package com.timowang.common.configura.shiro;
/**
 * @Title: TimoShiroManageConfigura
 * @Package: com.timowang.common.configura.shiro.pojo
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-21 下午 10:23
 * @Version: V2.0.0
 */

import com.timowang.common.configura.shiro.pojo.TimoDefaultWebSecurityManager;
import com.timowang.common.configura.shiro.pojo.TimoMemoryConstrainedCacheManager;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @ClassName: TimoShiroManageConfigura
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-21 下午 10:23
 */
@Configuration
public class TimoShiroManageConfigura {

    @Bean
    public MemoryConstrainedCacheManager cacheManager() {
        return new TimoMemoryConstrainedCacheManager();
    }

    @Bean
    public TimoDefaultWebSecurityManager defaultWebSecurityManager() {
        TimoDefaultWebSecurityManager timoDefaultWebSecurityManager = new TimoDefaultWebSecurityManager();
        return timoDefaultWebSecurityManager;
    }
}
