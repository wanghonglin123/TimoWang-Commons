/**
 * 广州市两棵树网络科技有限公司版权所有
 * DT Group Technology & commerce Co., LtdAll rights reserved.
 * <p>
 * 广州市两棵树网络科技有限公司，创立于2009年。旗下运营品牌洋葱小姐。
 * 洋葱小姐（Ms.Onion） 下属三大业务模块 [洋葱海外仓] , [洋葱DSP] , [洋葱海外聚合供应链]
 * [洋葱海外仓]（DFS）系中国海关批准的跨境电商自营平台(Cross-border ecommerce platform)，
 * 合法持有海外直邮保税模式的跨境电商营运资格。是渠道拓展，平台营运，渠道营运管理，及客户服务等前端业务模块。
 * [洋葱DSP]（DSP）系拥有1.3亿消费者大数据分析模型。 是基于客户的消费行为，消费轨迹，及多维度云算法(MDPP)
 * 沉淀而成的精准消费者模型。洋葱DSP能同时为超过36种各行业店铺 及200万个销售端口
 * 进行多店铺高精度配货，并能预判消费者购物需求进行精准推送。同时为洋葱供应链提供更前瞻的商品采买需求模型 。
 * [洋葱海外聚合供应链]（Super Supply Chain）由中国最大的进口贸易集团共同
 * 合资成立，拥有20余年的海外供应链营运经验。并已入股多家海外贸易企业，与欧美澳等9家顶级全球供应商达成战略合作伙伴关系。
 * 目前拥有835个国际品牌直接采买权，12万个单品的商品供应库。并已建设6大海外直邮仓库，为国内客户提供海外商品采买集货供应，
 * 跨境 物流，保税清关三合一的一体化模型。目前是中国唯一多模式聚合的海外商品供应链 。
 * <p>
 * 洋葱商城：http://m.msyc.cc/wx/indexView?tmn=1
 * <p>
 * 洋桃商城：http://www.yunyangtao.com
 */
package example.concurrent;

/**
 * @Title: CompletableFuture
 * @Package: example.concurrent
 * @Description:
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHongLin timo-wang@msyc.cc
 * @Date: 2018/1/18
 * @Version: V2.0.10
 * @Modify-by: WangHongLin timo-wang@msyc.cc
 * @Modify-date: 2018/1/18
 * @Modify-version: 2.1.5
 * @Modify-description: 新增：增，删，改，查方法
 */

import org.junit.Test;
import sun.security.krb5.KrbException;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;
import java.util.function.Function;

/**
 * @ClassName: CompletableFuture
 * @Description:    CompletableFuture 异步结果实例
 *  http://developer.51cto.com/art/201506/480000.htm
 * @Company: 广州市两棵树网络科技有限公司
 * @Author: WangHonglin timo-wang@msyc.cc
 * @Date: 2018/1/18
 */
public class CompletableFutureExample {
    /**
     * supplyAsync(param)执行异步操作并且返回一个结果，param 异步结果类型
     * @throws Exception
     */
    @Test
    public void test() throws Exception{
        // 执行异步操作并且返回一个结果，param 异步结果类型
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            int i = 0;
            return i;
        });
        System.out.println(completableFuture.get());
    }

    /**
     * supplyAsync(param1, param2),执行异步操作并且返回一个结果，param1 异步结果类型 param2 使用指定的执行器执行任务
     * @throws Exception
     */
    @Test
    public void test1() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            int i = 0;
            return i;
        }, Executors.newCachedThreadPool());
        System.out.println(completableFuture.get());
    }

    /**
     * anyOf(stage1, stage2), 取最快执行完任务的结果
     * @throws Exception
     */
    @Test
    public void test3() throws Exception{
        CompletableFuture completableFuture1 = CompletableFuture.supplyAsync(() -> {
            //模拟执行耗时任务
            System.out.println("task1 doing...");
            try {
                Thread.sleep(7000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            return "ok";
        });

        CompletableFuture completableFuture2 = CompletableFuture.supplyAsync(() -> {
            //模拟执行耗时任务
            System.out.println("task1 doing...");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "ok";
        });

        CompletableFuture<Object> completableFuture3 = CompletableFuture.anyOf(completableFuture1, completableFuture2);
        System.out.println(completableFuture3.get());
    }

    /**
     * CompletableFuture allof 实例，等待所有任务执行完成
     * @throws Exception
     */
    @Test
    public void test4() throws Exception{
        CompletableFuture completableFuture1 = CompletableFuture.supplyAsync(() -> {
            //模拟执行耗时任务
            System.out.println("task1 doing...");
            try {
                Thread.sleep(7000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            return "ok";
        });

        CompletableFuture completableFuture2 = CompletableFuture.supplyAsync(() -> {
            //模拟执行耗时任务
            System.out.println("task1 doing...");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "ok";
        });

        // 阻塞等待所有任务完成，必须配合join()
        CompletableFuture.allOf(completableFuture1, completableFuture2).join();
        System.out.println("1");
    }

    /**
     * thenCombine(), 执行完第一个任务后，把结果传递到第二个任务，在对两个任务的结果进行操作
     * @throws Exception
     */
    @Test
    public void test5() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            return "ok";
        }).thenCombine(CompletableFuture.supplyAsync(() -> {
            return "and";
        }), (s, s2) -> s + s2).thenCombine(CompletableFuture.supplyAsync(() -> {
            return "fail";
        }), (s, s2) -> s + s2);
        System.out.println(completableFuture.get());
    }

    /**
     * completedFuture(),创建一个CompletableFuture有结果的实例，并且返回一个结果
     * @throws Exception
     */
    @Test
    public void test6() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.completedFuture(1);
        System.out.println(completableFuture.get());
    }

    /**
     * runAsync(),使用ForkJoinPoll.commonPool() 作为它的线程池异步执行任务，无返回结果
     * @throws Exception
     */
    public void test7() throws Exception{
        CompletableFuture.runAsync(() -> {
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
    }

    /**
     * runAsync(),指定线程池异步执行任务，无返回结果
     * @throws Exception
     */
    public void test8() throws Exception{
        CompletableFuture.runAsync(() -> {
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }, Executors.newCachedThreadPool());
    }
    /**
     * acceptEither(),两个CompletionStage, 谁执行快，就取执行快的一个CompletionStage进行结果消耗，无返回值
     * @throws Exception
     */
    @Test
    public void test9() throws Exception{
        CompletableFuture.supplyAsync(() -> {
            for (int i = 0; i < 1000; i++) {
                System.out.println(i);
            }
            return "ok";
        }).acceptEither(CompletableFuture.supplyAsync(() -> {
            for (int i = 0; i < 10; i++) {
                System.out.println(i);
            }
            return "ok1";
        }), s -> {
            System.out.println(s);
        });
        // 不用这个的话会打印打印不出结果
        while(true){}

    }

    /**
     * complete() 设置异步结果值，future.get()在等待执行结果时，程序会一直block，如果此时调用complete(T t)会立即执行。
     * @throws Exception
     */
    @Test
    public void test10() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "ok";
        });
        completableFuture.complete("ok1");
        System.out.println(completableFuture.get());
    }

    /**
     * applyToEither() ,两个CompletionStage, 谁执行快，就取执行快的一个CompletionStage结果应用于一个函数中，有返回值（T，任意类型）。
     * @throws Exception
     */
    @Test
    public void test11() throws Exception{
        System.out.println(CompletableFuture.supplyAsync(() -> {
            return "ok";
        }).applyToEither(CompletableFuture.supplyAsync(() -> {
            return "fail";
        }), s -> {
            return 1;
        }).get());
    }

    /**
     * cancel(), 取消异步任务
     * @throws Exception
     */
    @Test
    public void test12() throws Exception{
        CompletableFuture.supplyAsync(() -> {
            return "ok";
        }).cancel(false);
    }

    /**
     * completeExceptionally(), 异步任务异常
     * exceptionally(), 对异常进行处理，有返回值
     * @throws Exception
     */
    @Test
    public void test13() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
                //System.out.println(1/0);
                return 1;
        });
        completableFuture = completableFuture.exceptionally(o -> {
            System.out.println(o);
            return "ok";
        });
        System.out.println(completableFuture.get());
    }

    /**
     * thenRun(), 然后运行，第一个任务执行后，执行第二个任务，没有结果传递
     * @throws Exception
     */
    @Test
    public void test14() throws Exception{
        CompletableFuture.supplyAsync(() -> {
            for(int i = 0; i < 1000; i++) {
                System.out.println(i);
            }
            return "ok";
        }).exceptionally(throwable -> {
            System.out.println(1);
            return "fail";
        }).thenRun(() -> {
            System.out.println("ok");
        });
    }

    /**
     * runAfterBoth(), 全部运行完，当两个异步任务多运行完后执行一个线程
     * @throws Exception
     */
    @Test
    public void test15() throws Exception{
        CompletableFuture.supplyAsync(() -> {
            return "ok";
        }).runAfterBoth(CompletableFuture.supplyAsync(() -> {
            return "fail";
        }), () -> {
            System.out.println(1);
        });
    }

    /**
     * runAfterEither（），两个任务，任意一个运行完后，执行一个线程，
     * 跟acceptEidther()区别， runAfterEither() 无传递结果，acceptEither() 有传递结果
     * @throws Exception
     */
    @Test
    public void test16() throws Exception{
        CompletableFuture.supplyAsync(() -> {
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "ok";
        }).runAfterEither(CompletableFuture.supplyAsync(() -> {
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "fail";
        }), () -> {
            System.out.println("hello");
        });
        Thread.sleep(3000);
    }

    /**
     * getNow（），如果异步任务执行完，那么getNow()返回异步结果，否则返回设置的结果值
     * @throws Exception
     */
    @Test
    public void test17() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            return "ok";
        });
        Thread.sleep(1000);
        System.out.println(completableFuture.getNow("test"));
    }

    /**
     * getNumberOfDependents() 监控系统异步，返回正在等待CompletableFuture完成的CompletableFutures的估计数量
     * @throws Exception
     */
    @Test
    public void test18() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return "ok";
        });
        System.out.println(completableFuture.getNumberOfDependents());
        System.out.println(completableFuture.get());
        Thread.sleep(2000);
    }

    /**
     * handle 异常处理
     * exceptionally() 区别
     * 1：exceptionally 会对结果产生影响，可以改变结果， handle 不可以
     * @throws Exception
     */
    @Test
    public void test19() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            return "ok";
        });
        completableFuture = completableFuture.handle(this :: test26);
        System.out.println(completableFuture.get());
    }

    private Object test26(Object o, Object o1) {
        return o;
    }

    /**
     * thenAccept(),对结果进行消耗
     * @throws Exception
     */
    @Test
    public void test20() throws Exception{
        CompletableFuture.supplyAsync(() -> {
            return "ok";
        }).thenAccept(this :: test24);
    }

    /**
     * thenAcceptBoth() ，进行全部结果消耗
     * @throws Exception
     */
    @Test
    public void test21() throws Exception{
        CompletableFuture.supplyAsync(() -> {
            return "ok";
        }).thenAcceptBoth(CompletableFuture.supplyAsync(() -> {
            return "fail";
        }), this :: test25);
    }

    private <U> void test25(String s, String u) {
        System.out.println(s + u);
    }

    /**
     * thenApply() ，转换结果
     * @throws Exception
     */
    @Test
    public void test22() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            return "ok";
        }).thenApply(this :: test24);
    }

    /**
     * thenCompose 执行完一个异步后，接着执行例外一个，并把结果传递进去，返回新的异步结果
     * @throws Exception
     */
    @Test
    public void test23() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            return "ok";
        }).thenCompose(this :: test24);
        System.out.println(completableFuture.get());
    }

    @Test
    public void test24() throws Exception{
        CompletableFuture completableFuture = CompletableFuture.supplyAsync(() -> {
            return "ok";
        }).thenCompose(this :: test24);
        System.out.println(completableFuture.get());
    }

    private CompletableFuture test24(String s) {
        return CompletableFuture.completedFuture(s);
    }

    private CompletableFuture test24(int s) {
        return CompletableFuture.completedFuture(s);
    }
}
