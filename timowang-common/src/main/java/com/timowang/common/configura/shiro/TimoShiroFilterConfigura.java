/**
 * 广州市两棵树网络科技有限公司版权所有
 * DT Group Technology & commerce Co., LtdAll rights reserved.
 * <p>
 * 广州市两棵树网络科技有限公司，创立于2009年。旗下运营品牌洋葱小姐。
 * 洋葱小姐（Ms.Onion） 下属三大业务模块 [洋葱海外仓] , [洋葱DSP] , [洋葱海外聚合供应链]
 * [洋葱海外仓]（DFS）系中国海关批准的跨境电商自营平台(Cross-border ecommerce platform)，
 * 合法持有海外直邮保税模式的跨境电商营运资格。是渠道拓展，平台营运，渠道营运管理，及客户服务等前端业务模块。
 * [洋葱DSP]（DSP）系拥有1.3亿消费者大数据分析模型。 是基于客户的消费行为，消费轨迹，及多维度云算法(MDPP)
 * 沉淀而成的精准消费者模型。洋葱DSP能同时为超过36种各行业店铺 及200万个销售端口
 * 进行多店铺高精度配货，并能预判消费者购物需求进行精准推送。同时为洋葱供应链提供更前瞻的商品采买需求模型 。
 * [洋葱海外聚合供应链]（Super Supply Chain）由中国最大的进口贸易集团共同
 * 合资成立，拥有20余年的海外供应链营运经验。并已入股多家海外贸易企业，与欧美澳等9家顶级全球供应商达成战略合作伙伴关系。
 * 目前拥有835个国际品牌直接采买权，12万个单品的商品供应库。并已建设6大海外直邮仓库，为国内客户提供海外商品采买集货供应，
 * 跨境 物流，保税清关三合一的一体化模型。目前是中国唯一多模式聚合的海外商品供应链 。
 * <p>
 * 洋葱商城：http://m.msyc.cc/wx/indexView?tmn=1
 * <p>
 * 洋桃商城：http://www.yunyangtao.com
 */
package com.timowang.common.configura.shiro;

/**
 * @Title: TimoShiroFilterConfigura
 * @Package: com.timowang.common.configura.shiro
 * @Description:
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHongLin timo-wang@msyc.cc
 * @Date: 2017/11/22
 * @Version: V2.0.10
 * @Modify-by: WangHongLin timo-wang@msyc.cc
 * @Modify-date: 2017/11/22
 * @Modify-version: 2.1.5
 * @Modify-description: 新增：增，删，改，查方法
 */

import com.timowang.common.configura.shiro.filter.TimoAnyRolesFilter;
import com.timowang.common.configura.shiro.pojo.TimoDefaultWebSecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.PassThruAuthenticationFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName: TimoShiroFilterConfigura
 * @Description:
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHonglin timo-wang@msyc.cc
 * @Date: 2017/11/22
 */

@Configuration
public class TimoShiroFilterConfigura {

    @Bean
    public ShiroFilterFactoryBean shiroFilters(DefaultWebSecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);

        Map<String, Filter> filterMap = new HashMap<>();
        filterMap.put("authc", new PassThruAuthenticationFilter());
        filterMap.put("anyRoles", new TimoAnyRolesFilter());
        shiroFilterFactoryBean.setFilters(filterMap);

        shiroFilterFactoryBean.setFilterChainDefinitions(getFilterChainDefinitions());

        return shiroFilterFactoryBean;
    }

    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    private String getFilterChainDefinitions() {
        StringBuilder filterChainDefinitions = new StringBuilder();
        //filterChainDefinitions.append("/rebuild/item/index = anon \n");
        // <!-- anon表示此地址不需要任何权限即可访问 -->
        filterChainDefinitions.append("/*/**=anon \n");
        /*// <!-- authc需要认证(登录)才能使用 -->
        filterChainDefinitions.append("/collect/item/downExcel = authc \n");
        // <!--所有的请求(除去配置的静态资源请求或请求地址为anon的请求)都要通过登录验证,如果未登录则跳到/loginUrl -->
        filterChainDefinitions.append("*//** = anyRoles \n");*/
        return filterChainDefinitions.toString();
    }
}
