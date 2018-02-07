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
package example.algorithm;

/**
 * @Title: BinaryExample
 * @Package: example.algorithm
 * @Description:
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHongLin timo-wang@msyc.cc
 * @Date: 2018/2/5
 * @Version: V2.0.10
 * @Modify-by: WangHongLin timo-wang@msyc.cc
 * @Modify-date: 2018/2/5
 * @Modify-version: 2.1.5
 * @Modify-description: 新增：增，删，改，查方法
 */

/**
 * @ClassName: BinaryExample
 * @Description: 二进制实例
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHonglin timo-wang@msyc.cc
 * @Date: 2018/2/5
 */

import com.sun.deploy.util.StringUtils;
import org.junit.Test;

/**
 * java 保存的数字的补码
 * int 转 二进制规律， Num/2 > 0, true 1 false 0, 循环到结果为0为止，后面的结果往左移
 * 实例： int number = 7, 7/2 = 3  取1, 3/2=1 取1, 1/2=0 取1， 结果为111
 * int number = 12, 12/ 2 = 6  取0,6/2=3 取0, 3/2=0 取1，1/2 取1 结果为1100
 *
 * int 转 二进制规律 参考方法test2()
 * 负整数转二进制规律: 奇数： 获取负数的原码x，在反码得到y，y 最低位加1得到补码
 * 负整数转二进制规律: 偶数： 获取负数的原码x，在反码得到y，y 全部位值+1  得到补码
 */

/**
 * 按位右移运算，m >> n 整数m 往右移动n位， m >> n = m / 2^n, 低位移除n位，高位补0，5 >> 2 = 1
 * 正整数： 低位移除n位，高位补n个0
 * 负整数： 低位移除n位，低位补n个1
 */

/**
 * 参考test2() 方法
 * 按位左移运算， m << n 整数m往左移n位
 * 正整数： 高位移除n个0，低位补n个0
 * 负整数： 高位移除n个1，低位补n个0
 */

public class BinaryExample {
    // 使用高位的好处, 方便阅读记忆
    private static final int STATUS_1 = -1 << 29;

    private static final int NUM_1 = 1;
    private static final int NUM_2 = 0;

    final static char[] digits = {
            '0' , '1' , '2' , '3' , '4' , '5' ,
            '6' , '7' , '8' , '9' , 'a' , 'b' ,
            'c' , 'd' , 'e' , 'f' , 'g' , 'h' ,
            'i' , 'j' , 'k' , 'l' , 'm' , 'n' ,
            'o' , 'p' , 'q' , 'r' , 's' , 't' ,
            'u' , 'v' , 'w' , 'x' , 'y' , 'z'
    };

    @Test
    public void test() {
        int k = -7; // 0000 0000 0000 0000 0000 0000 0000 0000 0111
        // 转换成二进制字符串
        String a = Integer.toBinaryString(k);
        // 转换成16进制字符串
        String b = Integer.toHexString(111);
        // 转换成8进制字符串
        String c = Integer.toOctalString(123);

        /**
         * 参考test2() 方法
         * 按位左移运算， m << n 整数m往左移n位
         * 正整数： 高位移除n个0，低位补n个0
         * 负整数： 高位移除n个1，低位补n个0
         */
        System.out.println(k << 2);
        /**
         * >> 按位右移运算，m >> n 整数m 往右移动n位， m >> n = m / 2^n, 低位移除n位，高位补0，5 >> 2 = 1
         * 正整数： 低位移除n位，高位补n个0
         * 负整数： 低位移除n位，低位补n个1
         */
        System.out.println(-9 >> 2);
        /**
         * m >>> n 按位右移补零操作符
         * m == 正整数，m >>> n = m >> n, m 往右移动n位，高位补n个0，低位移除n位 返回的值一样
         * m == 负整数, m >>> n， m 往右移动n位，高位补n个0，m >> n，高位补1，所以返回结果不一样
         */
        System.out.println(-9 >>> 2);

        /**
         * m ^ n, 判断m 补码 和 n补码对应位值是否相同，相同结果为0，否则为1
         * 同是正整数或者负整数， 右移31的值多为0，可以用于实现是否多是正整数和负整数
         */
        System.out.println(2 >> 31 ^ 15 >> 31);

    }

    /**
     * 位运算和普通运算对比
     * 代码热点或者循环未超过10000的时候，使用位运算性能快很多
     * 代码热点或者循环超过10000的时候，JVM会使用JIT编译器进行即时编译成本地机器码进行执行，优化，所以普通运算和位运算相差不大
     */
    @Test
    public void test1() {
        int a = -123456;
        int b = 123456;
        long beginTime = System.nanoTime();
        boolean isTrue = false;
        for (int i = 0; i < 2000; i ++) {
            if (a > 0 && b > 0) {
                isTrue = true;
            }
            else if (a < 0 && b < 0) {
                isTrue = true;
            } else {
                isTrue = false;
            }
        }
        System.out.println(1);
        long endTime = System.nanoTime();
        System.out.println("普通判断====" + (endTime - beginTime));

        beginTime = System.nanoTime();
        isTrue = false;
        for (int i = 0; i < 2000; i ++) {
            if ((a >> 31 ^ b >> 31) == 0) {
                isTrue = true;
            } else {
                isTrue = false;
            }
        }
        System.out.println(1);
        endTime = System.nanoTime();
        System.out.println("位运算判断====" + (endTime - beginTime));
    }

    @Test
    public void test2() {
        // -9 原码 10001001
        // -9 反码 11111111 11111111 11111111 11110110
        // -9 补码 11111111 11111111 11111111 11110111
        // -12 原码 10001100
        // -12 反码 11111111 11111111 11111111 11110011
        // -12 补码 11111111 11111111 11111111 11110100
        // -7 原码 10010111
        // -7 反码 11111111 11111111 11111111 11111000
        // -7 补码 11111111 11111111 11111111 11111001
        // -16 原码 10001100
        // -16 反码 11111111 11111111 11111111 11110011
        // -16 补码 11111111 11111111 11111111 11110100
        // -16 >>> 2 11111111 11111111 11111111 00001101
        // -1 原码 10000001
        // -1 反码 11111111 11111111 11111111 11111110
        // -1 补码 11111111 11111111 11111111 11111111
        // -2 原码 10000010
        // -2 反码 11111111 11111111 11111111 11111101
        // -2 补码 11111111 11111111 11111111 11111110
        System.out.println(Integer.toBinaryString(-28));
        System.out.println(Integer.toBinaryString(1073741821));
    }
    /**
     * 二进制转int， 左位移运算
     * @param binary
     * @return
     */
    public int binaayToInt(String binary) {
        int num = 0;
        String numStr = "";
        for (int i = 0; i < binary.length(); i++) {
            if (i < binary.length()) {
                numStr = binary.substring(i, i + 1);
            }
            num = num << 1;
            if (numStr.equals(0)) {
                num = 1;
            } else if(numStr.equals("1")){
                num ++;
            }
        }

        return num;
    }

    /**
     * int 转二进制, 右位移运算
     * @param num
     * @return
     */
    public String intToBinaay(int num) {
        char[] buff = new char[27];
        int i = 0;
        do {
            num = num >> 1;
            buff[i] =  digits[num];
            i ++;
        } while (num > 0 && num != 0);

        return String.valueOf(buff);
    }

    @Test
    public void test5(){
        int b = 1;
        long beginTime = System.nanoTime();
        boolean isTrue = false;
        for (int i = 0; i < 2000; i ++) {
            if (b > 0) {
                isTrue = true;
            }
            else {
                isTrue = false;
            }
        }
        System.out.println(isTrue);
        long endTime = System.nanoTime();
        System.out.println("普通判断====" + (endTime - beginTime));

        beginTime = System.nanoTime();
        isTrue = false;
        for (int i = 0; i < 2000; i ++) {
            if (b << 1 > 0) {
                isTrue = true;
            } else {
                isTrue = false;
            }
        }
        System.out.println(isTrue);
        endTime = System.nanoTime();
        System.out.println("位运算判断====" + (endTime - beginTime));
    }
}
