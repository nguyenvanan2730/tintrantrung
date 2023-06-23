package vn.com.vti.bus.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.RouteCustomized;
import vn.com.vti.bus.mapper.RouteListCustom;

@Controller
@RequestMapping("/route")
public class RouteController {

	@Autowired
	private RouteListCustom routeListCustom;

	@RequestMapping("/list")
	public String list(Model model) {
		List<RouteCustomized> routeList = routeListCustom.selectAll();
		model.addAttribute("routeList", routeList);
		return "route/routeList";

	}

	@RequestMapping("/search")
	public String search(@RequestParam("date") String date, Model model) {
	List<RouteCustomized> routeList = routeListCustom.selectByDate(date);
		model.addAttribute("routeList", routeList);
		return "route/routeList";
	}
}