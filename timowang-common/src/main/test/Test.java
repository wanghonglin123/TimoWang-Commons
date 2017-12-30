/**
 * @Title: Test
 * @Package: PACKAGE_NAME
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-12-16 下午 9:25
 * @Version: V2.0.0
 */

import java.util.Collection;

/**
 * @ClassName: Test
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-12-16 下午 9:25
 */
public class Test<T extends Class<?>> {
    public  static void main(String[] args) {
        Test test = new Test<Class<?>>();
        test.test();
    }

    public static void test(int...idxs){
        System.out.println(idxs.length);
    }


    static class B{

    }


}
