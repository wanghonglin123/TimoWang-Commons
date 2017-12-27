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
package com.timowang.common.data;

/**
 * @Title: MemberRelevantData
 * @Package: com.timowang.common.data
 * @Description:
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHongLin timo-wang@msyc.cc
 * @Date: 2017/12/26
 * @Version: V2.0.10
 * @Modify-by: WangHongLin timo-wang@msyc.cc
 * @Modify-date: 2017/12/26
 * @Modify-version: 2.1.5
 * @Modify-description: 新增：增，删，改，查方法
 */

import com.timowang.pojo.member.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName: MemberRelevantData
 * @Description: Member模块相关模拟数据，用户实现shiro安全管理
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHonglin timo-wang@msyc.cc
 * @Date: 2017/12/26
 */
public final class MemberRelevantData {
    private MemberRelevantData() {}

    /**
     * 用户数据
     */
    public static final List<Member> members;
    /**
     * 菜单数据
     */
    public static final List<Menu> menus;
    /**
     * 角色数据
     */
    public static final List<Role> roles;
    /**
     * 资源组数据
     */
    public static final List<ResourceGroup> resourceGroups;
    /**
     * 用户角色关联数据
     */
    public static final List<MemberRole> memberRoles;

    /**
     * 角色关联资源组数据
     */
    public static final List<RoleResourceGroup> roleResourceGroups;

    /**
     * 资源组数据
     */
    public static final List<Resource> resources;



    static {
        members = getMemberData();
        menus = getMenuData();
        roles = getRoleData();
        resourceGroups = getResourceGroupData();
        memberRoles = getMemberRoleData();
        roleResourceGroups = getRoleResourceGroupData();
        resources = getResourceData();
    }

    private static List<Resource> getResourceData() {
        List<Resource> objs = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            Resource obj = new Resource();
            obj.setIdx(i);
            obj.setMenuCode("menucode" + i);
            obj.setResourceRroupIdx(i);
            objs.add(obj);
        }
        return objs;
    }

    private static List<RoleResourceGroup> getRoleResourceGroupData() {
        List<RoleResourceGroup> objs = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            RoleResourceGroup obj = new RoleResourceGroup();
            obj.setIdx(i);
            obj.setResourceGroupIdx(i);
            obj.setRoleIdx(i);
            objs.add(obj);
        }
        return objs;
    }
    private static List<Member> getMemberData() {
        List<Member> objs = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            Member obj = new Member();
            obj.setIdx(i);
            obj.setUserName("zhangsan" + i);
            obj.setPwd("zhangsan" + i);
            objs.add(obj);
        }
        return objs;
    }

    private static List<Menu> getMenuData() {
        List<Menu> objs = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            Menu obj = new Menu();
            obj.setIdx(i);
            obj.setMenuName("菜单" + i);
            obj.setMenuCode("menucode" + i);
            objs.add(obj);
        }
        return objs;
    }

    private static List<ResourceGroup> getResourceGroupData() {
        List<ResourceGroup> objs = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            ResourceGroup obj = new ResourceGroup();
            obj.setIdx(i);
            obj.setGroupName("资源组" + i);
            obj.setGroupCode("resourcegroupcode" + i);
            objs.add(obj);
        }
        return objs;
    }

    private static List<Role> getRoleData() {
        List<Role> objs = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            Role obj = new Role();
            obj.setIdx(i);
            obj.setRoleName("角色" + i);
            obj.setRoleCode("rolecode" + i);
            objs.add(obj);
        }
        return objs;
    }

    private static List<MemberRole> getMemberRoleData() {
        List<MemberRole> objs = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            MemberRole obj = new MemberRole();
            obj.setIdx(i);
            obj.setMemberIdx(i);
            obj.setRoleIdx(i);
            objs.add(obj);
        }
        return objs;
    }

}
