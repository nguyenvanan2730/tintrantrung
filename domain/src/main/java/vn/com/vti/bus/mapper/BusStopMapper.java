package vn.com.vti.bus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vn.com.vti.bus.entity.BusStop;
import vn.com.vti.bus.entity.BusStopExample;

public interface BusStopMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    long countByExample(BusStopExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int deleteByExample(BusStopExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int insert(BusStop record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int insertSelective(BusStop record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    List<BusStop> selectByExample(BusStopExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    BusStop selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int updateByExampleSelective(@Param("record") BusStop record, @Param("example") BusStopExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int updateByExample(@Param("record") BusStop record, @Param("example") BusStopExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int updateByPrimaryKeySelective(BusStop record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus_stop
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    int updateByPrimaryKey(BusStop record);
}