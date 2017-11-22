package com.timowang.common.configura.redis.pojo;
/**
 * @Title: TimoJedisPoolConfig
 * @Package: com.timowang.common.configura.redis.pojo
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-22 下午 9:23
 * @Version: V2.0.0
 */

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

/**
 * @ClassName: TimoJedisPoolConfig
 * @Description:    自定义jedis连接池
 * @Author: WangHongLin
 * @Date: 2017-11-22 下午 9:23
 */
public class TimoJedisPoolConfig extends GenericObjectPoolConfig{
    public TimoJedisPoolConfig() {
        this.setTestWhileIdle(true);
        this.setMinEvictableIdleTimeMillis(60000L);
        this.setTimeBetweenEvictionRunsMillis(30000L);
        this.setNumTestsPerEvictionRun(-1);
    }
}
