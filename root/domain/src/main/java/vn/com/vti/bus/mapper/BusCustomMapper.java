package vn.com.vti.bus.mapper;

import java.util.List;

import vn.com.vti.bus.entity.BusCustomized;

public interface BusCustomMapper {
    
    BusCustomized selectByRouteId(Integer routeId);
    BusCustomized selectByBusId(Integer busId);
    List<BusCustomized> selectAll();
    


}