package example.lambda;
/**
 * @Title: Test
 * @Package: example.lambda
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-14 下午 2:36
 * @Version: V2.0.0
 */

/**
 * @ClassName: Test
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-14 下午 2:36
 */
public interface Test<T> {
    static void test1() {

    }

    void test(T t);
}

class Test1<T>{
    private T t;
    private Test<T> test;
    public Test1(Test<T> test) {
        this.test = test;
    }

    public void run() {
        test.test(t);
    }
}
