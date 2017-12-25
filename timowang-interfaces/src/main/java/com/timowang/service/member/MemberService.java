package com.timowang.service.member;
/**
 * @Title: MemberService
 * @Package: com.timowang.interfaces.member
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-19 下午 3:31
 * @Version: V2.0.0
 */

import com.timowang.pojo.member.Member;

import java.util.Map;

/**
 * @ClassName: MemberService
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-19 下午 3:31
 */
public interface MemberService {
    /**
     * 新增
     * @member member
     */
    void add(Member member);

    /**
     * 修改
     * @member member
     */
    void edit(Member member);

    /**
     * 查询
     * @member member
     */
    Member query(Member member);

    /**
     * 删除
     * @member member
     */
    void del(Member member);
}
