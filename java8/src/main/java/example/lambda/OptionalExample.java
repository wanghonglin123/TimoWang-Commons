package example.lambda;
/**
 * @Title: OptionalExample
 * @Package: example.lambda
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-13 下午 6:16
 * @Version: V2.0.0
 */

import com.sun.org.apache.regexp.internal.RE;

import java.util.Optional;

/**
 * @ClassName: OptionalExample
 * @Description:
 * @Author: WangHongLin
 * @Date: 2018-01-13 下午 6:16
 */
public class OptionalExample {
    public static void main(String[] args) {
        Result name = null;
        Result name1 = Optional.ofNullable(name).orElse(new Result());
        System.out.println(name1);  // pr
    }

    public static String fail() {
        return "fail";
    }
}

class Result {
    private int statu;
    private String msg;

    public int getStatu() {
        return statu;
    }

    public void setStatu(int statu) {
        this.statu = statu;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
