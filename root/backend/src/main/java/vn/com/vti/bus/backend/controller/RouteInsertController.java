package vn.com.vti.bus.backend.controller;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.backend.validator.DifferentBusStopsValidator;
import vn.com.vti.bus.backend.validator.RunDateReverseValidator;
import vn.com.vti.bus.entity.BusCustomized;
import vn.com.vti.bus.entity.BusStop;
import vn.com.vti.bus.entity.BusStopExample;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.BusCustomMapper;
import vn.com.vti.bus.mapper.BusStopMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeInsert")
public class RouteInsertController {
	@Autowired
	private RouteMapper routeMapper;
	
	@Autowired
	private BusStopMapper busStopMapper;
	
	@Autowired
	private BusCustomMapper busCustomMapper;
	
	@Autowired
	private DifferentBusStopsValidator routeFormValidator;
	
	@InitBinder
	public void validatorBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(routeFormValidator);
		webDataBinder.addValidators(runDateReverseValidator);
	}
	
	@Autowired
	private RunDateReverseValidator runDateReverseValidator;


	@ModelAttribute
	public RouteForm createForm() {
		return new RouteForm();
	}

	@RequestMapping("input")
	public String input(RouteForm routeForm, Model model) {
		
		BusStopExample busStopExample = new BusStopExample();
		busStopExample.setOrderByClause("bus_stop_id");
		List<BusStop> busStopList = busStopMapper.selectByExample(busStopExample);
		model.addAttribute("busStopList",busStopList);
		
		List<BusCustomized> busList = busCustomMapper.selectAll();
		model.addAttribute("busList",busList);

		return "route/routeInsertInput";
	}
	@RequestMapping("confirm")
	public String confirm(@Valid RouteForm routeForm, BindingResult bindingResult, Model model) {
	    
		Date currentDate = new Date();
    	Date currentDay = new Date(currentDate.getYear(), currentDate.getMonth(), currentDate.getDate());
	    
	    if (routeForm.getRunStartDate().before(currentDay)) {
	        bindingResult.rejectValue("runStartDate", "error.runStartDate", "運航開始日は今日以降を入力してください。");
		
	    };
	      if(bindingResult.hasErrors()) {
			return input(routeForm, model);
		}
				
		if (routeForm.getArrivalBusStopId()!=null) {
		BusStop arrivalBusStop = busStopMapper.selectByPrimaryKey(routeForm.getArrivalBusStopId());
		model.addAttribute("arrivalBusStop",arrivalBusStop);
		}
		
		if (routeForm.getDepartureBusStopId()!=null) {
		BusStop departureBusStop = busStopMapper.selectByPrimaryKey(routeForm.getDepartureBusStopId());
		model.addAttribute("departureBusStop",departureBusStop);
		}
		
		if (routeForm.getBusId()!=null) {
			BusCustomized bus = busCustomMapper.selectByBusId(routeForm.getBusId());
			model.addAttribute("bus",bus);
		}
		
		return "route/routeInsertConfirm";
	}
	
	@RequestMapping("insert")
	public String insert (RouteForm routeForm, RedirectAttributes redirectAttributes, Model model) {
		Route route = new Route();
		
		route.setDepartureBusStopId(routeForm.getDepartureBusStopId());
		route.setDepartureTime(routeForm.getDepartureTime());
		route.setArrivalBusStopId(routeForm.getArrivalBusStopId());
		route.setArrivalTime(routeForm.getArrivalTime());
		route.setRunStartDate(routeForm.getRunStartDate());
		route.setRunEndDate(routeForm.getRunEndDate());
		route.setBusId(routeForm.getBusId());
		route.setPrice(routeForm.getPrice());
		
		routeMapper.insertSelective(route);
		
		redirectAttributes.addFlashAttribute("message","路線"+ route.getRouteId() + "で登録しました。");
		
		return "redirect:/route/list";
	}
}
