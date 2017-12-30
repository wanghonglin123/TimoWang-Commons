package example.atomic;
/**
 * @Title: AtomicIntegerExample
 * @Package: example.atomic
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-12-20 下午 10:09
 * @Version: V2.0.0
 */

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @ClassName: AtomicIntegerExample
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-12-20 下午 10:09
 */
public class AtomicIntegerExample implements Runnable{
    private static AtomicInteger num = new AtomicInteger(0);
    public void run() {
        // 获取当前值
        System.out.println(num.get());
        // 添加和获取值，原子性操作
        System.out.println(num.addAndGet(5));
    }

    public static void main(String[] args) {
        AtomicIntegerExample atomicIntegerExample = new AtomicIntegerExample();
        AtomicIntegerExample atomicIntegerExample1 = new AtomicIntegerExample();
        new Thread(atomicIntegerExample).start();
        new Thread(atomicIntegerExample1).start();
    }
}
