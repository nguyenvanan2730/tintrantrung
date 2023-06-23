package vn.com.vti.bus.mapper;

import java.util.List;

import vn.com.vti.bus.entity.RouteCustomized;

public interface RouteListCustom {
    List<RouteCustomized> selectAll();

    RouteListCustom selectByPrimaryKey(Integer routeId);
    
    List<RouteCustomized> selectByDate(String date);
    
    List<RouteCustomized> getReservedRoute();
   

}