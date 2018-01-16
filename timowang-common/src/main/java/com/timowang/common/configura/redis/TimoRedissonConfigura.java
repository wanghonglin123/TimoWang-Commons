package com.timowang.common.configura.redis;
/**
 * @Title: TimoRedissonConfigura
 * @Package: com.timowang.common.configura.redis
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-16 下午 9:51
 * @Version: V2.0.0
 */

import com.timowang.common.beans.TimoBeans;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.File;
import java.io.IOException;

/**
 * @ClassName: TimoRedissonConfigura
 * @Description: Redisson 分布式redis 操作api
 * @Author: WangHongLin
 * @Date: 2018-01-16 下午 9:51
 */
@Configuration
public class TimoRedissonConfigura extends TimoBeans {
    private static Logger logger = LoggerFactory.getLogger(TimoRedissonConfigura.class);
    private static final String REDISSON_JSON_FILE_PATH = "redisson.json";
    // 自动锁释放时间，当锁
    private static final long LOCK_WATCHDOG_TIMEOUT = 30;

    @Bean
    public RedissonClient redissonClient() {
        RedissonClient redisson = null;
        try {
            Config config = Config.fromJSON(new File(getRedissonJsonFilePath()));
            config.setLockWatchdogTimeout(LOCK_WATCHDOG_TIMEOUT);
            redisson = Redisson.create(config);
            return redisson;
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
        return redisson;
    }

    private String getRedissonJsonFilePath() {
        return "/" + super.getDomain() + "/" + REDISSON_JSON_FILE_PATH;
    }

}
