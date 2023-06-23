package vn.com.vti.bus.mapper;

import java.util.List;

import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.RouteCustom;

public interface RouteCustomMapper {
    List<Route> selectByBusId(Integer busId);
    
    List<RouteCustom> selectAll();
    
    List<RouteCustom> search(String date, String dBusStopName , String aBusStopName );
    
    RouteCustom selectByRouteId (Integer routeId);
}
