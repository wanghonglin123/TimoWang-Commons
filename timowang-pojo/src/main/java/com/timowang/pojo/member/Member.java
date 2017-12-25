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
package com.timowang.pojo.member;

/**
 * @Title: Member
 * @Package: com.timowang.pojo.member
 * @Description:    用户Po
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHongLin timo-wang@msyc.cc
 * @Date: 2017/12/19
 * @Version: V2.0.10
 * @Modify-by: WangHongLin timo-wang@msyc.cc
 * @Modify-date: 2017/12/19
 * @Modify-version: 2.1.5
 * @Modify-description: 新增：增，删，改，查方法
 */

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName: Member
 * @Description: 用户Po
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHonglin timo-wang@msyc.cc
 * @Date: 2017/12/19
 */
public final class Member implements Serializable{

    private long idx;
    private long idxCode;
    private String userName;
    private String pwd;
    private Date createTime;
    private Date updateTime;
    private long createByMemberIdxCode;
    private String createByMemberName;
    private long updateByMemberIdxCode;
    private String updateByMemberName;
    private long version;
    private short status;
    private String ext;

    /**
     * @return createTime
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return updateTime
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * @param updateTime updateTime
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * @return createByMemberIdxCode
     */
    public long getCreateByMemberIdxCode() {
        return createByMemberIdxCode;
    }

    /**
     * @param createByMemberIdxCode createByMemberIdxCode
     */
    public void setCreateByMemberIdxCode(long createByMemberIdxCode) {
        this.createByMemberIdxCode = createByMemberIdxCode;
    }

    /**
     * @return createByMemberName
     */
    public String getCreateByMemberName() {
        return createByMemberName;
    }

    /**
     * @param createByMemberName createByMemberName
     */
    public void setCreateByMemberName(String createByMemberName) {
        this.createByMemberName = createByMemberName;
    }

    /**
     * @return updateByMemberIdxCode
     */
    public long getUpdateByMemberIdxCode() {
        return updateByMemberIdxCode;
    }

    /**
     * @param updateByMemberIdxCode updateByMemberIdxCode
     */
    public void setUpdateByMemberIdxCode(long updateByMemberIdxCode) {
        this.updateByMemberIdxCode = updateByMemberIdxCode;
    }

    /**
     * @return updateByMemberName
     */
    public String getUpdateByMemberName() {
        return updateByMemberName;
    }

    /**
     * @param updateByMemberName updateByMemberName
     */
    public void setUpdateByMemberName(String updateByMemberName) {
        this.updateByMemberName = updateByMemberName;
    }

    /**
     * @return version
     */
    public long getVersion() {
        return version;
    }

    /**
     * @param version version
     */
    public void setVersion(long version) {
        this.version = version;
    }

    /**
     * @return status
     */
    public short getStatus() {
        return status;
    }

    /**
     * @param status status
     */
    public void setStatus(short status) {
        this.status = status;
    }

    /**
     * @return ext
     */
    public String getExt() {
        return ext;
    }

    /**
     * @param ext ext
     */
    public void setExt(String ext) {
        this.ext = ext;
    }

    /**
     * @return idx
     */
    public long getIdx() {
        return idx;
    }

    /**
     * @param idx idx
     */
    public void setIdx(long idx) {
        this.idx = idx;
    }

    /**
     * @return idxCode
     */
    public long getIdxCode() {
        return idxCode;
    }

    /**
     * @param idxCode idxCode
     */
    public void setIdxCode(long idxCode) {
        this.idxCode = idxCode;
    }

    /**
     * @return userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName userName
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return pwd
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * @param pwd pwd
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
