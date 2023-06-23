package vn.com.vti.bus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.RouteExample;

public interface RouteMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    long countByExample(RouteExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int deleteByExample(RouteExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int insert(Route record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int insertSelective(Route record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    List<Route> selectByExample(RouteExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    Route selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int updateByExampleSelective(@Param("record") Route record, @Param("example") RouteExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int updateByExample(@Param("record") Route record, @Param("example") RouteExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int updateByPrimaryKeySelective(Route record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.route
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int updateByPrimaryKey(Route record);
}