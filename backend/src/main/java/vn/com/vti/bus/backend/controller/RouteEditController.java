package vn.com.vti.bus.backend.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusExample;
import vn.com.vti.bus.entity.BusStop;
import vn.com.vti.bus.entity.BusStopExample;
import vn.com.vti.bus.entity.Reservation;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.BusMapper;
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
	private BusMapper busMapper;
	
	@Autowired
	private ReservationCustomMapper reservationCustomMapper;

	@ModelAttribute
	public RouteForm createForm() {
		return new RouteForm();
	}

	@RequestMapping("input")
	public String input(@RequestParam("routeId") Integer routeId, RouteForm routeForm, Model model) {
		Route route = routeMapper.selectByPrimaryKey(routeId);
		model.addAttribute("route", route);	
		
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
		
		BusExample busExample = new BusExample();
		busExample.setOrderByClause("bus_id");
		List<Bus> busList = busMapper.selectByExample(busExample);
		model.addAttribute("busList",busList);
		
		
		return "route/routeEditInput";
	}

	@RequestMapping("confirm")
	public String confirm(@Valid RouteForm routeForm,@RequestParam("routeId") Integer routeId, BindingResult bindingResult, Model model) {
		Route route = routeMapper.selectByPrimaryKey(routeId);
		model.addAttribute("route", route);	
		
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
			Bus bus = busMapper.selectByPrimaryKey(routeForm.getBusId());
			model.addAttribute("bus",bus);
		}
		return "route/routeEditConfirm";
	}

	@RequestMapping("update")
	public String insert (@RequestParam("routeId") Integer routeId, RouteForm routeForm, RedirectAttributes redirectAttributes, Model model) {
		List<Reservation> reservation = reservationCustomMapper.selectByRouteId(routeId);
		Route route = new Route();
		
		if (reservation.isEmpty()) {
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
			redirectAttributes.addFlashAttribute("message","ID(" + routeId + ")で更新しました。");
		} else {
			redirectAttributes.addFlashAttribute("message","ID(" + routeId + ")は既に予約されているため処理できません。");
		}
			
		return "redirect:../route/list";

	}
}
