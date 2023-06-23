package vn.com.vti.bus.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusStop;
import vn.com.vti.bus.entity.Reservation;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.BusStopMapper;
import vn.com.vti.bus.mapper.ReservationCustomMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeDelete")
public class RouteDeleteController {	
	
	@Autowired
	private RouteMapper routeMapper;
	
	@Autowired
	private BusMapper busMapper; 
	
	@Autowired 
	private BusStopMapper busStopMapper;
	
	@Autowired
	private ReservationCustomMapper reservationCustomMapper;
	
	@RequestMapping("/confirm")
	public String confirm(@RequestParam("routeId") Integer routeId, RouteForm routeForm, Model model) {
		Route route = routeMapper.selectByPrimaryKey(routeId);
		model.addAttribute("route", route);	
		
		routeForm.setArrivalBusStopId(route.getArrivalBusStopId());
		routeForm.setArrivalTime(route.getArrivalTime());
		routeForm.setBusId(route.getBusId());
		routeForm.setDepartureBusStopId(route.getDepartureBusStopId());
		routeForm.setDepartureTime(route.getDepartureTime());
		routeForm.setPrice(route.getPrice());
		routeForm.setRunStartDate(route.getRunStartDate());
		
		model.addAttribute("routeForm", routeForm);	
		
		if (routeForm.getBusId() != null) {
			Bus bus = busMapper.selectByPrimaryKey(route.getBusId());
			model.addAttribute("bus",bus);
		}
		
		if (routeForm.getDepartureBusStopId() != null) {
			BusStop departureBusStop = busStopMapper.selectByPrimaryKey(route.getDepartureBusStopId());
			model.addAttribute("departureBusStop",departureBusStop);
		}
		
		if (routeForm.getArrivalBusStopId() != null) {
			BusStop arrivalBusStop = busStopMapper.selectByPrimaryKey(route.getArrivalBusStopId());
			model.addAttribute("arrivalBusStop",arrivalBusStop);
		}	
		
		return "route/routeDeleteConfirm";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("routeId") Integer routeId, RedirectAttributes redirectAttributes) {
		
		List<Reservation> reservation = reservationCustomMapper.selectByRouteId(routeId);
		if (reservation.isEmpty()) {
			routeMapper.deleteByPrimaryKey(routeId);
			redirectAttributes.addFlashAttribute("message","ID(" + routeId + ")で削除しました。");
		} else {
			redirectAttributes.addFlashAttribute("message","ID(" + routeId + ")は既に予約されているため処理できません。");
		}
		
		return "redirect:../route/list";
	}
}
