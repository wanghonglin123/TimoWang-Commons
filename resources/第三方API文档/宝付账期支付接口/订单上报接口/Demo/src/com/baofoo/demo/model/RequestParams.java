package com.baofoo.demo.model;


import java.util.List;

public class RequestParams {

    /**
     * 商户编号
     */
    private String memberId;

    /**
     * 终端编号
     */
    private String terminalId;

    /**
     * 商户在宝付支付时的订单号
     */
    private String memberTransId;

    /**
     * 订单支付类型(QUICK-快捷支付、AUTH-认证支付、B2C-网银支付、WEIXIN-微信扫码、ALIPAY-支付宝扫码)
     */
    private String orderPayType;

    /**
     * 商品信息集合
     */
    private List<OrderItem> goodsInfo;

    /**
     * 身份证号
     */
    private String idCardNo;

    /**
     * 持卡人姓名
     */
    private String idHolder;

    /**
     * 银行卡号
     */
    private String bankCardNo;

    /**
     * 预留手机号
     */
    private String mobile;
  
    private long orderId;
    
    private String clientIp;
    
    private String idName;
    
    private String orderAmt;
    
    private String orderCcy;
    
    private String transAmt;
    
    private String transCcy;
    

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(String terminalId) {
        this.terminalId = terminalId;
    }

    public String getMemberTransId() {
        return memberTransId;
    }

    public void setMemberTransId(String memberTransId) {
        this.memberTransId = memberTransId;
    }

    public String getOrderPayType() {
        return orderPayType;
    }

    public void setOrderPayType(String orderPayType) {
        this.orderPayType = orderPayType;
    }

    public List<OrderItem> getGoodsInfo() {
        return goodsInfo;
    }

    public void setGoodsInfo(List<OrderItem> goodsInfo) {
        this.goodsInfo = goodsInfo;
    }

    public String getIdCardNo() {
        return idCardNo;
    }

    public void setIdCardNo(String idCardNo) {
        this.idCardNo = idCardNo;
    }

    public String getIdHolder() {
        return idHolder;
    }

    public void setIdHolder(String idHolder) {
        this.idHolder = idHolder;
    }

    public String getBankCardNo() {
        return bankCardNo;
    }

    public void setBankCardNo(String bankCardNo) {
        this.bankCardNo = bankCardNo;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

	public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

	public String getIdName() {
		return idName;
	}

	public void setIdName(String idName) {
		this.idName = idName;
	}

	public String getOrderAmt() {
		return orderAmt;
	}

	public void setOrderAmt(String orderAmt) {
		this.orderAmt = orderAmt;
	}

	public String getOrderCcy() {
		return orderCcy;
	}

	public void setOrderCcy(String orderCcy) {
		this.orderCcy = orderCcy;
	}

	public String getTransAmt() {
		return transAmt;
	}

	public void setTransAmt(String transAmt) {
		this.transAmt = transAmt;
	}

	public String getTransCcy() {
		return transCcy;
	}

	public void setTransCcy(String transCcy) {
		this.transCcy = transCcy;
	}
}
