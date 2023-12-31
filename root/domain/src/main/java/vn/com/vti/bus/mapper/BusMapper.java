package vn.com.vti.bus.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusExample;

public interface BusMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    long countByExample(BusExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    int deleteByExample(BusExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    int deleteByPrimaryKey(Integer busId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    int insert(Bus row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    int insertSelective(Bus row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    List<Bus> selectByExample(BusExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    Bus selectByPrimaryKey(Integer busId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    int updateByExampleSelective(@Param("row") Bus row, @Param("example") BusExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    int updateByExample(@Param("row") Bus row, @Param("example") BusExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    int updateByPrimaryKeySelective(Bus row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table public.bus
     *
     * @mbg.generated Thu Jun 15 17:24:45 JST 2023
     */
    int updateByPrimaryKey(Bus row);
}