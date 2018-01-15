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
 * @Description: java Stream 实例，
 * @Author: WangHongLin
 * @Date: 2018-01-14 下午 9:28
 */

/**
 * - ：Stream 常用函数接口
 * Consumer<T> – 在T上执行一个操作，无返回结果,比如foreach,循环遍历每个结果
 * Function<T,R> –输入参数为T的实例，返回R的实例，函数参数 等于 integer -> String.valueOf(integer) == String :: valueOf 语法传参
 * Supplier<T> –无输入参数，返回T的实例， 实例：ArrayList :: new  ，创建ArrayList对象
 * Collector<T, A, R> 收集器，参数 = Collectors.method 作为参数 比如：Stream.collector(Collectors.toList)
 * Predicate<T> –输入参数为T的实例，返回boolean值， 比如Stream.map()函数
 */
public class StremExample {

    public static void main(String[] args) {
        // 生成顺序流
        Stream.of(1, 2, 3);

        // foreach 实例
        Stream.of(1, 2, 3).forEach(integer -> {
            System.out.println(integer);
        });

        // 结束操作，返回流元素个数
        Stream.of(1, 2, 3).count();

        // 中间无状态操作，true 过滤， false 不过滤
        Stream.of(1, 2, 3).filter(integer -> {
            // 中间无状态操作不会被打印，只有在执行结束操作的时候，这里的代码才会被执行
            System.out.println(integer);
            return true;
        });

        // 返回由应用给定结果的流组成的流,改变元素的结果
        Stream.of(1, 2, 3).map(integer -> String.valueOf(integer)
        );

        // collect用法，收集流结果，汇总返回新的IntegerList集合
        Stream.of(1, 2, 3).collect(Collectors.toList());
        // 自定义ArrayList收集器
        Stream.of(1, 2, 3).collect(ArrayList::new, ArrayList::remove, ArrayList::remove).size();
        // 收集流结果，汇总生成新的ArrayList，Collectors.toCollection((ArrayList :: new)，使用工厂生成指定集合
        ArrayList<Integer> integers = Stream.of(1, 2, 3).collect(Collectors.toCollection((ArrayList::new)));
        integers.forEach(integer -> {
            System.out.println("---" + integer);
        });
        // Collectors.averagingDouble,Collectors.averagingInt,Collectors.averagingLong 求各个基本类型平均值
        Stream.of(1, 2, 3).collect(Collectors.averagingDouble(value -> Double.valueOf(value)));
        Stream.of(1, 2, 3).collect(Collectors.averagingInt(value -> Integer.valueOf(value)));
        Stream.of(1, 2, 3).collect(Collectors.averagingLong(value -> Long.valueOf(value)));
        Stream.of(1, 2, 3).collect(Collectors.averagingLong(value -> Long.valueOf(value)));
        // Collectors.counting()，计算元素个数 == Stream.of(1, 2, 3).count()
        Stream.of(1, 2, 3).collect(Collectors.counting());
        // collectingAndThen 结果转换器,对其结果应用转换函数，比如返回的List, 那么可以调用List的接口方法返回新的结果
        Stream.of(1, 2, 3).collect(Collectors.collectingAndThen(Collectors.toList(), List::size));
        Stream.of(1, 2, 3).collect(Collectors.collectingAndThen(Collectors.toSet(), Set::size));
        // Collectors.groupingBy 根据idx分组返回map, idx作为key ,value List
        Student.getStudentData().stream().collect(Collectors.groupingBy(Student::getIdx));
        // Collectors.groupingBy 根据idx分组默认返回Hashmap, idx作为key ,value 可以进行结果转换器，转换一些常用类型
        Student.getStudentData().stream().collect(Collectors.groupingBy(Student::getIdx, Collectors.counting()));
        Student.getStudentData().stream().collect(Collectors.groupingBy(Student::getIdx, Collectors.toSet()));
        // Collectors.groupingByConcurrent 返回一个并发收集器ConcurrentMap 使用跟groupingBy一样，返回结果不一样
        Student.getStudentData().stream().collect(Collectors.groupingByConcurrent(Student::getIdx, Collectors.toSet()));
        // Collectors.groupingBy 根据idx分组，返回自定义Map，value 可以进行结果转换器，转换一些常用类型
        Student.getStudentData().stream().collect(
                Collectors.groupingBy(
                        Student::getIdx,
                        LinkedHashMap::new,
                        Collectors.toSet()));
        // Collectors.maxBy 获取最大的值
        Stream.of(1,2,3).collect(Collectors.maxBy(Comparator.comparingInt(value -> value.intValue())));
        // Collectors.maxBy 获取最小的值
        Stream.of(1,2,3).collect(Collectors.minBy(Comparator.comparingInt(value -> value.intValue())));
        // Collectors.mapping 返回List集合，存储源元素studentName的值, 映射需要的值
        Student.getStudentData().stream().collect(Collectors.mapping(Student :: getIdx, Collectors.toList())).forEach(s -> System.out.println(s));
    }

}

class Student {
    private long idx;
    private String studentName;

    /**
     * @return idx
     */
    public long getIdx() {
        return idx;
    }

    /**
     * @param idx idx
     */
    public void setIdx(long idx) {
        this.idx = idx;
    }

    /**
     * @return studentName
     */
    public String getStudentName() {
        return studentName;
    }

    /**
     * @param studentName studentName
     */
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public static List<Student> getStudentData() {
        List<Student> students = new ArrayList<>();
        Student student = new Student();
        student.setIdx(1);
        student.setStudentName("张三");
        students.add(student);

        Student student2 = new Student();
        student2.setIdx(2);
        student2.setStudentName("李四");
        students.add(student2);
        return students;
    }
}

class school {
    private long idx;
    private String schoolName;
}
