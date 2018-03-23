package com.baofoo.demo;

import com.alibaba.fastjson.JSONObject;
import com.baofoo.demo.model.BaseResult;
import com.baofoo.demo.model.OrderItem;
import com.baofoo.demo.model.RequestParams;
import com.baofoo.demo.utils.RsaCodingUtil;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * DEMO
 *
 * 应为运用到json数据的转换用到了fastjson工具，需要把fastjson.jar 添加到lib中
 *  1、intellij（IDEA），找到lib文件中的fastJson-1.1.27.jar 右键 点击 Add as Library.. 就可以。
 *  2、eclipse，找到lib文件中的fastJson-1.1.27.jar 右键 选自 build path 点击 Add to build path 就可以。
 *
 */
public class OrderUpload {

//    版本号：目前只支持1.0.0版本
    private static final String VERSION = "1.0.0";
//    数据格式类型：目前只支持JSON版本
    private static final String DATAT_YPE = "JSON";
//    商户号：（商户在宝付注册时提供）
    private static final String MEMBER_ID = "100024469";
//    终端号：（商户在宝付注册时提供）
    private static final String TERMINAL_ID = "200000994";
//    商户密钥文件：（商户在宝付注册时提供）
    public static String privateFile = "bfkey_100024469@@200000994.pfx";
//    公钥内容：（商户在宝付注册时提供）
    public static String publicFile = "bfkey_100024469@@200000994.cer";
//    商户数字证书密码
    public static String keyPwd = "100024469_291633";

    private static String path;
    /**
     * 主方法进行测试
     *  1、封装请求参数
     *  2、请求内容转换成json数据格式
     *  3、对json数据格式内容进行加密
     *  4、发送请求
     *  5、响应参数解析
     *
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {
//       跨境订单上报
        crossOrderReq();
    }

    /**
     * 跨境订单上报
     *  1、封装请求参数
     *  2、请求内容转换成json数据格式
     *  3、对json数据格式内容进行加密
     *  4、发送请求
     *  5、响应参数解析
     */
    public static void crossOrderReq() throws UnsupportedEncodingException {
        path = OrderUpload.class.getClass().getResource("/").getPath();
//        请求处理：
//        1.封装请求参数
//        a.订单类型是b2c和网银支付
        RequestParams requestParams = proxyParams();
//        b.订单类型是QUICK-快捷支付、AUTH-认证支付
//        RequestParams sendDatatParam = tissueQuickAndAUTHParams();

//        2.请求内容转换成json数据格式
        String requestData = JSONObject.toJSONString(requestParams);
        System.out.println(requestData);
        System.out.println("123"+path+privateFile);

//        3.对json数据格式内容进行加密
        String encrypt = RsaCodingUtil.encryptByPriPfxFile(requestData, path+privateFile, keyPwd);
        System.out.println(encrypt);

//        4.发送请求(demo中只提供调用的方法，实际调用结果请联调)
          try {
			requestByPostMethod(encrypt);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//        响应处理：
//        5.响应参数解析
//        模拟响应数据（实际调用中由宝付返回响应数据，这里是为了模拟数据）
//        String resultString = "{\"errorMsg\":\"成功\",\"memberId\":\"100024469\",\"result\":\"4585b05b0cd1327683f058968d1f220bd22e9ade1b4f35ef2d704038c9faf91a9f7db7b317c67db263b8a44131d8893b55f123b5899ef9fdd4c3849cb217276554e5aa71fc37cdacb75a6f656c9f65ce7d1e5df22ace12cbe7a4bebaffe04c08cd9911b676aa8a9ccb7105a3c205053916295fa83163c9d1791eca7ec2508f446437aedb97b5f9be26443ac3579bcdd9c7e5793605b4e1891b7db000255498d703e2692d5173e33eab4e99ac7f412d0892b4e239b79a74d450ac9beaed63a049f6d13996aa79b720a5081f9b9951891ba56c60b31d86e74a4a4487f9af3f8129d7fba4012fa4dd5dc650c6994df1da2b3a457ec30f7dea1f318fdfadf94af7e973c722526f1484a4edc63c52d3419be39da3ec8fd576e0d68ca45eb2f3ca74b543bf303ff391d594cd2e13966019d7d52051ab26a687489860822b723ce521c4c9d2947d7a8bcf42924c5f95bb4baf1c9bdf7ffd27954a872f5f6108cea84c46565dad5478b051bcf01210b9c726c445785bb5bd00e8003c4b3d7d4e6874561466ae0bbdedbc79723870be0731b026a226d7b7b767b714c6c25f5b6c99f9504a1ba4dae751d47717c2cf07f2e7b5e25c7c03eeb3fba5df726c8b0bcca95877b4df31aed70b72bc1552c87015948f4c1b934117b6cffa8868ba11f443a3d51015d1a82fe8c8d53346e0f31ec3ddbd9b6dbaabfa0f10691a2520d5fc2535840f62\",\"success\":true,\"terminalId\":\"100001204\"}";
//        解析响应数据
//        responseProcess(resultString);
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
        HttpPost post = new HttpPost("https://tcb.baofoo.com/cbpay/order/proxy/submit");
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
    public static RequestParams proxyParams() {
        RequestParams requestParams = new RequestParams();
        requestParams.setMemberId(MEMBER_ID);
        requestParams.setTerminalId(TERMINAL_ID);
        requestParams.setMemberTransId("BD201708145368");
        requestParams.setIdCardNo("430105198601240012");
        requestParams.setBankCardNo("15387502656");
        requestParams.setMobile("13838385438");
        requestParams.setIdName("张三");
        requestParams.setTransAmt("5.00");
        requestParams.setTransCcy("CNY");
        requestParams.setOrderAmt("5.00");
        requestParams.setOrderCcy("CNY");
        List<OrderItem> orderItems = new ArrayList<>();
        for (int i = 1; i < 3; i++) {
            OrderItem orderItem = new OrderItem();
            orderItem.setGoodsName("商品名称" + i);
            orderItem.setGoodsNum(i);
            orderItem.setGoodsPrice(new BigDecimal(i));
            orderItems.add(orderItem);
        }
        requestParams.setGoodsInfo(orderItems);
        return requestParams;
    }

    /**
     * 组织请求数据
     * 1、订单类型是QUICK-快捷支付、AUTH-认证支付不需要添加身份信息
     */
    public static RequestParams tissueQuickAndAUTHParams() {
        RequestParams requestParams = new RequestParams();
        requestParams.setMemberId(MEMBER_ID);
        requestParams.setTerminalId(TERMINAL_ID);
        requestParams.setMemberTransId("123321456");
        requestParams.setOrderPayType("AUTH");
        requestParams.setClientIp("192.168.0.2");
        List<OrderItem> orderItems = new ArrayList<>();
        for (int i = 1; i < 3; i++) {
            OrderItem orderItem = new OrderItem();
            orderItem.setGoodsName("商品名称" + i);
            orderItem.setGoodsNum(i);
            orderItem.setGoodsPrice(new BigDecimal(i));
            orderItems.add(orderItem);
        }
        requestParams.setGoodsInfo(orderItems);
        return requestParams;
    }

}

