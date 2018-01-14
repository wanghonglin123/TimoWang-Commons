package example.lambda;
/**
 * @Title: LambdaExample
 * @Package: example.lambda
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-13 下午 1:09
 * @Version: V2.0.0
 */

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @ClassName: LambdaExample
 * @Description: lambda 表达式
 * @Author: WangHongLin
 * @Date: 2018-01-13 下午 1:09
 */
//65054673
public class LambdaExample {
    private static List<String> strings = new ArrayList<>();
    public static void main(String[] args) {
        LambdaExample lambdaExample = new LambdaExample();
        long beginTime = System.nanoTime();
        strings.stream().filter(s -> s.isEmpty()).forEach(str -> {
            int strLeng = str.length();
            System.out.println(strLeng);
        });
        long endTime = System.nanoTime();
        System.out.println(endTime - beginTime);
    }

    public LambdaExample() {
        for (int i = 0; i < 10000; i++) {
            strings.add("" + i);
        }
    }
}
