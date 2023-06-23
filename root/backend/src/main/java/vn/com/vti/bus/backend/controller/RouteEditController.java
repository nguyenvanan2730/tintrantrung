package vn.com.vti.bus.backend.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.backend.validator.CantChangeRouteValidator;
import vn.com.vti.bus.backend.validator.DifferentBusStopsValidator;
import vn.com.vti.bus.backend.validator.ExistReserveOutsideValidator;
import vn.com.vti.bus.backend.validator.RunDateReverseValidator;
import vn.com.vti.bus.entity.BusCustomized;
import vn.com.vti.bus.entity.BusStop;
import vn.com.vti.bus.entity.BusStopExample;
import vn.com.vti.bus.entity.Reservation;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.BusCustomMapper;
import vn.com.vti.bus.mapper.BusStopMapper;
import vn.com.vti.bus.mapper.ReservationCustomMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeEdit")
public class RouteEditController {
	@Autowired
	private RouteMapper routeMapper;

	@Autowired
	private BusStopMapper busStopMapper;
	
	@Autowired
	private BusCustomMapper busCustomMapper;
	
	@Autowired
	private ReservationCustomMapper reservationCustomMapper;

	@Autowired
	private DifferentBusStopsValidator differentBusStopsValidator;
	
	@Autowired
	private RunDateReverseValidator runDateReverseValidator;
	
	@Autowired
	private CantChangeRouteValidator cantChangeRouteValidator;
	
	@Autowired
	private ExistReserveOutsideValidator existReserveOutsideValidator;
	
	@InitBinder
	public void validatorBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(differentBusStopsValidator);
		webDataBinder.addValidators(runDateReverseValidator);
		webDataBinder.addValidators(cantChangeRouteValidator);
		webDataBinder.addValidators(existReserveOutsideValidator);
	}

	@RequestMapping("input")
	public String input(@RequestParam("routeId") Integer routeId, RouteForm routeForm, Model model) {
		Route route = routeMapper.selectByPrimaryKey(routeId);
		model.addAttribute("route", route);	
		
		routeForm.setRouteId(route.getRouteId());
		routeForm.setArrivalBusStopId(route.getArrivalBusStopId());
		routeForm.setArrivalTime(route.getArrivalTime());
		routeForm.setBusId(route.getBusId());
		routeForm.setDepartureBusStopId(route.getDepartureBusStopId());
		routeForm.setDepartureTime(route.getDepartureTime());
		routeForm.setPrice(route.getPrice());
		routeForm.setRunStartDate(route.getRunStartDate());
		routeForm.setRunEndDate(route.getRunEndDate());
		
		model.addAttribute("routeForm", routeForm);	
		
		BusStopExample busStopExample = new BusStopExample();
		busStopExample.setOrderByClause("bus_stop_id");
		List<BusStop> busStopList = busStopMapper.selectByExample(busStopExample);
		model.addAttribute("busStopList",busStopList);
		
		List<BusCustomized> busList = busCustomMapper.selectAll();
		model.addAttribute("busList",busList);
		
		return "route/routeEditInput";
	}

	@RequestMapping("confirm")
	public String confirm(@RequestParam("routeId") Integer routeId,@Valid RouteForm routeForm, BindingResult bindingResult, Model model) {
			
		if(bindingResult.hasErrors()) {
			return input(routeId, routeForm, model);
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
		
		Route route = routeMapper.selectByPrimaryKey(routeId);
		model.addAttribute("route", route);	
		
		return "route/routeEditConfirm";
	}

	@RequestMapping("update")
	public String insert (@RequestParam("routeId") Integer routeId, RouteForm routeForm, RedirectAttributes redirectAttributes, Model model) {
		List<Reservation> reservations = reservationCustomMapper.selectByRouteId(routeId);
		Route route = new Route();	
			route.setRouteId(routeId);
			route.setDepartureBusStopId(routeForm.getDepartureBusStopId());
			route.setDepartureTime(routeForm.getDepartureTime());
			route.setArrivalBusStopId(routeForm.getArrivalBusStopId());
			route.setArrivalTime(routeForm.getArrivalTime());
			route.setRunStartDate(routeForm.getRunStartDate());
			route.setRunEndDate(routeForm.getRunEndDate());
			route.setBusId(routeForm.getBusId());
			route.setPrice(routeForm.getPrice());

			routeMapper.updateByPrimaryKeySelective(route);
			redirectAttributes.addFlashAttribute("message","路線" + routeId + "を更新しました。");
		return "redirect:../route/list";

	}
}
