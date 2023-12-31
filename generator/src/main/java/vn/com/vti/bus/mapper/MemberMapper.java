package vn.com.vti.bus.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.MemberExample;

public interface MemberMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    long countByExample(MemberExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    int deleteByExample(MemberExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    int deleteByPrimaryKey(Integer memberId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    int insert(Member record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    int insertSelective(Member record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    List<Member> selectByExample(MemberExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    Member selectByPrimaryKey(Integer memberId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    int updateByExampleSelective(@Param("record") Member record, @Param("example") MemberExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    int updateByExample(@Param("record") Member record, @Param("example") MemberExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    int updateByPrimaryKeySelective(Member record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.member
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    int updateByPrimaryKey(Member record);
}