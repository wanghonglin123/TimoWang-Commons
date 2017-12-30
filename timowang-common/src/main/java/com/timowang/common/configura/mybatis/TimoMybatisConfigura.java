package com.timowang.common.configura.mybatis;
/**
 * @Title: MybatisConfigura
 * @Package: com.timowang.common.configura.mybatis
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-18 下午 8:30
 * @Version: V2.0.0
 */

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;

/**
 * @ClassName: MybatisConfigura
 * @Description:    Mybaits配置
 * @Author: WangHongLin
 * @Date: 2017-11-18 下午 8:30
 */
//@Configuration
@PropertySource({"mybatis.properties"})
public class TimoMybatisConfigura {

    @Value("${mybatis.typeAliasesPackage}")
    private String typeAliasesPackage;

    @Value("${mybatis.mapperLocations}")
    private Resource[] mapperLocations;

    @Autowired
    private DruidDataSource dataSource;

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception{
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(dataSource);
        sqlSessionFactory.setMapperLocations(this.mapperLocations);
        sqlSessionFactory.setTypeAliasesPackage(this.typeAliasesPackage);
        return sqlSessionFactory.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception{
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}

