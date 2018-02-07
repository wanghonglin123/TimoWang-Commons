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

/**
 * @Title: Test
 * @Package: PACKAGE_NAME
 * @Description:
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHongLin timo-wang@msyc.cc
 * @Date: 2018/2/2
 * @Version: V2.0.10
 * @Modify-by: WangHongLin timo-wang@msyc.cc
 * @Modify-date: 2018/2/2
 * @Modify-version: 2.1.5
 * @Modify-description: 新增：增，删，改，查方法
 */

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName: Test
 * @Description:
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHonglin timo-wang@msyc.cc
 * @Date: 2018/2/2
 */
public class Test {
    @org.junit.Test
    public void test() throws Exception{
        ScheduledExecutorService scheduledExecutorService = Executors.newScheduledThreadPool(1);
        scheduledExecutorService.schedule(() -> {
            System.out.println(1);
        }, 1000, TimeUnit.SECONDS);
        System.out.println(Integer.toBinaryString(1999999999).length());
        System.out.println(Long.toBinaryString(1234567891111111111L).length());
        System.out.println(Integer.toBinaryString(15));
        System.out.println(12 >> 24);
    }

    public boolean test1() {
        System.out.println(23 == 24);
        return 23 == 24;
    }

    public boolean test2() {
        System.out.println(23 == 23);
        return 23 == 23;
    }

    @org.junit.Test
    public void test3() {
        long begin = System.nanoTime();
        for (int i = 0; i <20000; i ++) {
            int k = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2;
        }
        long end = System.nanoTime();
        // 715663
        System.out.println(end - begin);
    }

    @org.junit.Test
    public void test4() {
        long begin = System.nanoTime();
        for (int i = 0; i < 20000; i ++) {
            int k = 1 >> 8;
        }
        long end = System.nanoTime();
        // 715663
        System.out.println(end - begin);
    }
}
