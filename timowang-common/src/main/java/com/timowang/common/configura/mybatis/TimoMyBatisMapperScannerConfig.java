
package com.timowang.common.configura.mybatis;

/**
 * @Title: MyBatisMapperScannerConfig
 * @Package: com.timowang.common.configura.mybatis
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-18 下午 10:04
 * @Version: V2.0.0
 */


import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.boot.autoconfigure.MybatisAutoConfiguration;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;


/**
 * @ClassName: MyBatisMapperScannerConfig
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-18 下午 10:04
 */


@Configuration
public class TimoMyBatisMapperScannerConfig {


    private static final String BASEPACKAGE = "com.timowang.dao.mapper";

    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer() throws Exception{
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setBasePackage(BASEPACKAGE);
        return  mapperScannerConfigurer;
    }
}

