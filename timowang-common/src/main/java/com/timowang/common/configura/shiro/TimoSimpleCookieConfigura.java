package com.timowang.common.configura.shiro;
/**
 * @Title: TimoSimpleCookieConfigura
 * @Package: com.timowang.common.configura.shiro
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-21 下午 10:19
 * @Version: V2.0.0
 */

import com.timowang.common.configura.shiro.pojo.TimoCookieRememberMeManager;
import com.timowang.common.configura.shiro.pojo.TimoSimpleCookie;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @ClassName: TimoSimpleCookieConfigura
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-21 下午 10:19
 */
@Configuration
public class TimoSimpleCookieConfigura {

    @Bean(name = "sessionIdCookie")
    public SimpleCookie sessionIdCookie() {
        SimpleCookie timoSimpleCookie = new TimoSimpleCookie("sid.timowang.com");
        timoSimpleCookie.setMaxAge(36000);
        timoSimpleCookie.setHttpOnly(true);
        return timoSimpleCookie;
    }

    @Bean(name = "rememberMeCookie")
    public SimpleCookie rememberMeCookie() {
        SimpleCookie timoSimpleCookie = new TimoSimpleCookie("rme.timowang.com");
        timoSimpleCookie.setMaxAge(36000);
        timoSimpleCookie.setHttpOnly(true);
        return timoSimpleCookie;
    }

    @Bean
    public CookieRememberMeManager cookieRememberMeManager(SimpleCookie sessionIdCookie) {
        CookieRememberMeManager timoCookieRememberMeManager = new TimoCookieRememberMeManager();
        timoCookieRememberMeManager.setCookie(sessionIdCookie);
        timoCookieRememberMeManager.setCipherKey("test".getBytes());
        return timoCookieRememberMeManager;
    }
}
