package example.stream;
/**
 * @Title: StremExample
 * @Package: example.stream
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-14 下午 9:28
 * @Version: V2.0.0
 */

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

/**
 * @ClassName: StremExample
 * @Description: java Stream 实例
 * @Author: WangHongLin
 * @Date: 2018-01-14 下午 9:28
 */

public class StremExample {

    public static void main(String[] args) {
        // 生成顺序流
        Stream.of(1,2,3);

        // foreach 实例
        Stream.of(1,2,3).forEach(integer -> {
            System.out.println(integer);
        });

        // 结束操作，返回流元素个数
        Stream.of(1,2,3).count();

        // 中间无状态操作，true 过滤， false 不过滤
        Stream.of(1,2,3).filter(integer -> {
            // 中间无状态操作不会被打印，只有在执行结束操作的时候，这里的代码才会被执行
            System.out.println(integer);
            return true;
        });

        // 返回由应用给定结果的流组成的流,改变元素的结果
        Stream.of(1,2,3).map(integer -> {
            // 中间无状态操作不会被打印，只有在执行结束操作的时候，这里的代码才会被执行
            System.out.println(integer);
            // 将元素的int 转换为String
            return String.valueOf(integer);
        });

        // 收集流结果，汇总返回新的IntegerList集合
        Stream.of(1,2,3).collect(Collectors.toList());
        // 收集流结果，汇总生成新的ArrayList，Collectors.toCollection((ArrayList :: new)，使用工厂生成指定集合
        ArrayList<Integer> integers = Stream.of(1,2,3).collect(Collectors.toCollection((ArrayList :: new)));
        integers.forEach(integer -> {
            System.out.println("---"+integer);
        });
    }
}
