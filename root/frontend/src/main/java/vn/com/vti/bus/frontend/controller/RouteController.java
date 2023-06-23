package vn.com.vti.bus.frontend.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.BusStop;
import vn.com.vti.bus.entity.BusStopExample;
import vn.com.vti.bus.entity.RouteCustom;
import vn.com.vti.bus.frontend.form.RouteSearchForm;
import vn.com.vti.bus.mapper.BusStopMapper;
import vn.com.vti.bus.mapper.RouteCustomMapper;

/**
 * @author HP
 *
 */
@Controller
@RequestMapping("route")
public class RouteController {

    @Autowired
    private RouteCustomMapper routeCustomMapper;

    @Autowired
    private BusStopMapper busStopMapper;

	@RequestMapping("/search")
	public String search( Model model){
        BusStopExample busStopExample = new BusStopExample();
        busStopExample.setOrderByClause("bus_stop_id");

        List<BusStop> busStopList = busStopMapper.selectByExample(busStopExample);
        model.addAttribute("busStopList", busStopList);
		
		return "route/searchInput";
	}
    
    @RequestMapping("/result")
    public String result(
            @RequestParam(value = "date", required = true) @DateTimeFormat(pattern = "yyyy年MM月dd日") Date date,
            @RequestParam(value = "departureBusStopName", required = false) String departureBusStopName,
            @RequestParam(value = "arrivalBusStopName", required = false) String arrivalBusStopName,
            @Valid RouteSearchForm routeSearchForm,
            BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return search(model);
        }
        
        SimpleDateFormat dateSql = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = dateSql.format(date);
        
        SimpleDateFormat dateShow = new SimpleDateFormat("yyyy年MM月dd日");
        String dateJapan = dateShow.format(date);

        List<RouteCustom> routeList = routeCustomMapper.search(
        		dateString, "%" + departureBusStopName + "%", "%" + arrivalBusStopName + "%");

        model.addAttribute("routeList", routeList);
        
		if (routeSearchForm.getDepartureBusStopName()!=null) {
		BusStop departureBusStop = busStopMapper.selectByPrimaryKey(routeSearchForm.getDepartureBusStopId());
		model.addAttribute("departureBusStop",departureBusStop);
		}
		
		if (routeSearchForm.getArrivalBusStopName()!=null) {
		BusStop arrivalBusStop = busStopMapper.selectByPrimaryKey(routeSearchForm.getArrivalBusStopId());
		model.addAttribute("arrivalBusStop",arrivalBusStop);
		}
		
        BusStopExample busStopExample = new BusStopExample();
        busStopExample.setOrderByClause("bus_stop_id");

        List<BusStop> busStopList = busStopMapper.selectByExample(busStopExample);
        model.addAttribute("busStopList", busStopList);
        
        model.addAttribute("date", dateJapan);
        model.addAttribute("dateStr", dateString);
        return "route/searchResult";
    }
}

