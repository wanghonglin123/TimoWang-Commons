package com.timowang.dao.mapper.member;
/**
 * @Title: MemberMapper
 * @Package: com.timowang.dao.mapper.member
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-18 下午 10:01
 * @Version: V2.0.0
 */

import com.timowang.pojo.member.Member;

import java.util.Map;

/**
 * @ClassName: MemberMapper
 * @Description:
 * @Author: WangHongLin
 * @Date: 2017-11-18 下午 10:01
 */
public interface MemberMapper {

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
