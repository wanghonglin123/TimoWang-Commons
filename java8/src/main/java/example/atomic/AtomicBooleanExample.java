package example.atomic;
/**
 * @Title: AtomicBoolean
 * @Package: example.atomic
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-12-20 下午 9:42
 * @Version: V2.0.0
 */

import java.util.concurrent.atomic.AtomicBoolean;

/**
 * @ClassName: AtomicBoolean
 * @Description: 多线程原子性Boolean操作，保证多线程boolean类型的值是原子性
 * @Author: WangHongLin
 * @Date: 2017-12-20 下午 9:42
 */
public class AtomicBooleanExample implements Runnable{
    private String name;

    public AtomicBooleanExample(String name){
        this.name = name;
    }

    private static AtomicBoolean isExits = new AtomicBoolean(false);

    public void run() {
        // 比较isExits是否是false， 如果是false 设置为true;ompareAndSet AtomicBoolean核心方法，用于比较并且赋值
        // 主要测试并发下，boolean的原子性
        if (isExits.compareAndSet(false, true)) {
            System.out.println(name + "test");
            // 改变AtomicBoolean得值，不比较
            isExits.set(false);
        } else {
            System.out.println(name + " give up");
        }
    }

    public static void main(String[] args) {
        AtomicBooleanExample atomicBooleanExample = new AtomicBooleanExample("test1");
        AtomicBooleanExample atomicBooleanExample2 = new AtomicBooleanExample("test2");
        AtomicBooleanExample atomicBooleanExample3 = new AtomicBooleanExample("test1");
        AtomicBooleanExample atomicBooleanExample4 = new AtomicBooleanExample("test2");
        new Thread(atomicBooleanExample).start();
        new Thread(atomicBooleanExample2).start();
        new Thread(atomicBooleanExample3).start();
        new Thread(atomicBooleanExample4).start();
    }
}
