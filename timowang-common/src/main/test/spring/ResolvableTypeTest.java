package spring;
/**
 * @Title: ResolvableTypeTest
 * @Package: spring
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-12-16 上午 10:55
 * @Version: V2.0.0
 */

import org.springframework.core.ResolvableType;

/**
 * @ClassName: ResolvableTypeTest
 * @Description:    spring ResolvableType java 泛型api 测试
 * @Author: WangHongLin
 * @Date: 2017-12-16 上午 10:55
 */
public class ResolvableTypeTest {
    public static void main(String[] args) {
        try {
            ResolvableType resolvableType = ResolvableType.forClass(B.class);
            Class<?> classes = resolvableType.resolve();
            System.out.println(resolvableType.forField(classes.getDeclaredField("name")));
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    interface  A{
       void get();
    }

    abstract class B implements A{
        private String name;
        abstract void getName();
    }

    class C extends B{
        @Override
        public void get() {

        }

        @Override
        void getName() {

        }
    }
}
