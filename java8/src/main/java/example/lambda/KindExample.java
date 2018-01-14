package example.lambda;
/**
 * @Title: LambdaExample
 * @Package: example.lambda
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-13 下午 1:09
 * @Version: V2.0.0
 */

import java.util.*;

/**
 * @ClassName: LambdaExample
 * @Description: lambda 表达式
 * @Author: WangHongLin
 * @Date: 2018-01-13 下午 1:09
 */
public class KindExample {
    private static List<String> strings = new ArrayList<>();
    public static void main(String[] args) {
        KindExample lambdaExample = new KindExample();
        long beginTime = System.nanoTime();
        for (String str : strings) {
            if (str.startsWith("s")) {
                int strLeng = str.length();
                System.out.println(strLeng);
            }
        }
        long endTime = System.nanoTime();
        System.out.println(endTime - beginTime);
    }

    public KindExample() {
        for (int i = 0; i < 1000; i++) {
            strings.add("stream" + i);
        }
    }
}
