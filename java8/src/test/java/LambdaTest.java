/**
 * @Title: LambdaTest
 * @Package: PACKAGE_NAME
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-11 下午 10:20
 * @Version: V2.0.0
 */

import static java.lang.System.*;

/**
 * @ClassName: LambdaTest
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-11 下午 10:20
 */
public class LambdaTest {
    public static void main(String[] args) {
        new Thread( () -> {
            System.out.println("This is from an anonymous method (lambda exp).");
        } );
        out.println(1);
    }

    interface Test2{
        void test();
    }
}
