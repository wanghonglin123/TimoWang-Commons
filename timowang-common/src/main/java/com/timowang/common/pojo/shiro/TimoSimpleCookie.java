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
package com.timowang.common.pojo.shiro;

import org.apache.shiro.web.servlet.Cookie;
import org.apache.shiro.web.servlet.SimpleCookie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName: TimoSimpleCookie
 * @Description: 自定义SimpleCookie，主要是可以扩展SimpleCookie，加入自己的行为
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHonglin timo-wang@msyc.cc
 * @Date: 2017/11/21
 */
public class TimoSimpleCookie extends SimpleCookie{
    public TimoSimpleCookie() {
        super();
    }

    public TimoSimpleCookie(String name) {
        super(name);
    }

    public TimoSimpleCookie(Cookie cookie) {
        super(cookie);
    }

    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public void setName(String name) {
        super.setName(name);
    }

    @Override
    public String getValue() {
        return super.getValue();
    }

    @Override
    public void setValue(String value) {
        super.setValue(value);
    }

    @Override
    public String getComment() {
        return super.getComment();
    }

    @Override
    public void setComment(String comment) {
        super.setComment(comment);
    }

    @Override
    public String getDomain() {
        return super.getDomain();
    }

    @Override
    public void setDomain(String domain) {
        super.setDomain(domain);
    }

    @Override
    public String getPath() {
        return super.getPath();
    }

    @Override
    public void setPath(String path) {
        super.setPath(path);
    }

    @Override
    public int getMaxAge() {
        return super.getMaxAge();
    }

    @Override
    public void setMaxAge(int maxAge) {
        super.setMaxAge(maxAge);
    }

    @Override
    public int getVersion() {
        return super.getVersion();
    }

    @Override
    public void setVersion(int version) {
        super.setVersion(version);
    }

    @Override
    public boolean isSecure() {
        return super.isSecure();
    }

    @Override
    public void setSecure(boolean secure) {
        super.setSecure(secure);
    }

    @Override
    public boolean isHttpOnly() {
        return super.isHttpOnly();
    }

    @Override
    public void setHttpOnly(boolean httpOnly) {
        super.setHttpOnly(httpOnly);
    }

    @Override
    public void saveTo(HttpServletRequest request, HttpServletResponse response) {
        super.saveTo(request, response);
    }

    @Override
    protected String buildHeaderValue(String name, String value, String comment, String domain, String path, int maxAge, int version, boolean secure, boolean httpOnly) {
        return super.buildHeaderValue(name, value, comment, domain, path, maxAge, version, secure, httpOnly);
    }

    @Override
    public void removeFrom(HttpServletRequest request, HttpServletResponse response) {
        super.removeFrom(request, response);
    }

    @Override
    public String readValue(HttpServletRequest request, HttpServletResponse ignored) {
        return super.readValue(request, ignored);
    }
}
