package example.stream;
/**
 * @Title: LongStreamExample
 * @Package: example.stream
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-14 下午 9:33
 * @Version: V2.0.0
 */

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.LongStream;

/**
 * @ClassName: LongStreamExample
 * @Description: 长整型流实例
 * @Author: WangHongLin
 * @Date: 2018-01-14 下午 9:33
 */
public class LongStreamExample {
    @Test
    public void test() {
        List<Long> longList = new ArrayList<>();
        longList.add(1L);
        longList.add(3L);
        IntStream.range(0, longList.size()).forEach(value -> System.out.println(longList.get(value)));
    }
}
