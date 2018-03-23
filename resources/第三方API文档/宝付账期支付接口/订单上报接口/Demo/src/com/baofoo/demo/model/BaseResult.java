package com.baofoo.demo.model;

import java.io.Serializable;

/**
 * 商户请求参数内容
 */
public class BaseResult implements Serializable {

    /**
     * 成功标识
     */
    private Boolean success = Boolean.TRUE;

    /**
     * 错误描述
     */
    private String errorMsg = "成功";

    /**
     * 返回结果信息
     */
    private String result;

    /**
     * 商户编号
     */
    private String memberId;

    /**
     * 终端编号
     */
    private String terminalId;

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
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
}
