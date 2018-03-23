package com.baofoo.demo;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;
import com.baofoo.demo.model.BaseResult;
import com.baofoo.demo.model.OrderItem;
import com.baofoo.demo.model.RequestParams;
import com.baofoo.demo.model.RequestParams2;
import com.baofoo.demo.utils.RsaCodingUtil;

public class CustomDeclaring {

	// 版本号：目前只支持1.0.0版本
	private static final String VERSION = "1.0.0";
	// 数据格式类型：目前只支持JSON版本
	private static final String DATAT_YPE = "JSON";
	// 商户号：（商户在宝付注册时提供）
	private static final String MEMBER_ID = "100024469";
	// 终端号：（商户在宝付注册时提供）
	private static final String TERMINAL_ID = "200000994";
	// 商户密钥文件：（商户在宝付注册时提供）
	public static String privateFile = "bfkey_100024469@@200000994.pfx";
	// 公钥内容：（商户在宝付注册时提供）
	public static String publicFile = "bfkey_100024469@@200000994.cer";
	// 商户数字证书密码
	public static String keyPwd = "100024469_291633";

	private static String path;

	public static void main(String[] args) throws IOException {
		
		declaring();

	}

	
	
	
	public static void declaring() throws UnsupportedEncodingException{
		
		 path = CustomDeclaring.class.getClass().getResource("/").getPath();
		
//        获取请求参数
        RequestParams2 requestParams = proxyParams();

//      2.请求内容转换成json数据格式
      String requestData = JSONObject.toJSONString(requestParams);
      System.out.println(requestData);

//      3.对json数据格式内容进行加密
      String encrypt = RsaCodingUtil.encryptByPriPfxFile(requestData, path+privateFile, keyPwd);
      System.out.println(encrypt);

//      4.发送请求(demo中只提供调用的方法，实际调用结果请联调)
        try {
			requestByPostMethod(encrypt);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 用于测试联调,数据进行请求
	 *
	 * @param dataContent
	 * @throws IOException
	 */
	public static void requestByPostMethod(String dataContent) throws IOException {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		List<NameValuePair> valuePairs = new LinkedList<>();
		valuePairs.add(new BasicNameValuePair("version", VERSION));
		valuePairs.add(new BasicNameValuePair("dataType", DATAT_YPE));
		valuePairs.add(new BasicNameValuePair("memberId", MEMBER_ID));
		valuePairs.add(new BasicNameValuePair("terminalId", TERMINAL_ID));
		valuePairs.add(new BasicNameValuePair("dataContent", dataContent));
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(valuePairs, "UTF-8");
		HttpPost post = new HttpPost("https://tcb.baofoo.com/declare");
		post.setEntity(entity);
		CloseableHttpResponse res = httpClient.execute(post);
		String content = EntityUtils.toString(res.getEntity());
		System.out.println("返回内容 ——>" + content);
		responseProcess(content);
	}

	/**
	 * 
	 * 代理跨境结算请求数据
	 */
	public static RequestParams2 proxyParams() {
		RequestParams2 requestParams = new RequestParams2();
		requestParams.setMemberId(MEMBER_ID);
		requestParams.setTerminalId(TERMINAL_ID);
		requestParams.setVersion(VERSION);
		requestParams.setMemberTransId("BD201708145368");
		requestParams.setMemberApplyNo("3211234567");
		requestParams.setFunctionId("300102");
		requestParams.setCompanyCode("");
		requestParams.setCompanyOrderNo("321123456");
		requestParams.setMemberTransDate("20170815144500");
		requestParams.setNotifyUrl("www.baofu.com");
		requestParams.setPayTotalAmount("5.00");
		requestParams.setPayGoodsAmount("0.00");
		requestParams.setPayFeeAmount("0.00");
		requestParams.setPayPreAmount("0.00");
		requestParams.setPayTaxAmount("0.00");
		requestParams.setRemarks("remark");
		requestParams.setCcy("CNY");
        
		
      
		return requestParams;
	}
 
	   /**
     * 返回数据进行处理
     *
     * @param resultString 接口同步返回字符串内容
     */
    
    public static void responseProcess(String resultString) {
//       返回结果转换成对象
        BaseResult baseResult = JSONObject.parseObject(resultString, BaseResult.class);
//      判断返回成功失败
        if (baseResult.getSuccess()) {
            System.out.println("成功响应内容数据解密前结果" + baseResult.getResult());
            System.out.println(path + publicFile);
            String decrypt = RsaCodingUtil.decryptByPubCerFile(baseResult.getResult(), path + publicFile);
            System.out.println("成功响应返回内容数据解密后结果" + decrypt);
        } else {
            System.out.println("失败响应原因：" + baseResult.getErrorMsg());
        }
    }
}
