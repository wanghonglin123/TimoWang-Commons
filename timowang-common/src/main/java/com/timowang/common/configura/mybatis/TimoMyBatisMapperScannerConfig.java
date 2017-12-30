
package com.timowang.common.configura.mybatis;

/**
 * @Title: MyBatisMapperScannerConfig
 * @Package: com.timowang.common.configura.mybatis
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-18 下午 10:04
 * @Version: V2.0.0
 */


import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * @ClassName: MyBatisMapperScannerConfig
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-18 下午 10:04
 */


//@Configuration
public class TimoMyBatisMapperScannerConfig {


    private static final String BASEPACKAGE = "com.timowang.dao.mapper";

    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer() throws Exception{
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        mapperScannerConfigurer.setBasePackage(BASEPACKAGE);
        return  mapperScannerConfigurer;
    }
}

