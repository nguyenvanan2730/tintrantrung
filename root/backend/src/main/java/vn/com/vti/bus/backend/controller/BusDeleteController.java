package vn.com.vti.bus.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.backend.form.BusForm;
import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.RouteCustomMapper;

@Controller
@RequestMapping("/busDelete")
public class BusDeleteController {	
	
	@Autowired
	private BusMapper busMapper;
	
	@Autowired
	private RouteCustomMapper routeCustomMapper;
	
	@RequestMapping("/confirm")
	public String confirm(@RequestParam("busId") Integer busId, BusForm busForm, Model model) {
		Bus bus = busMapper.selectByPrimaryKey(busId);
		
		busForm.setRowNum(bus.getRowNum());
		busForm.setColumnNum(bus.getColumnNum());
		busForm.setNumberPlace(bus.getNumberPlace());
		busForm.setNumberDivision(bus.getNumberDivision());
		busForm.setNumberKana(bus.getNumberKana());
		busForm.setNumberFirstHalf(bus.getNumberFirstHalf());
		busForm.setNumberLatterHalf(bus.getNumberLatterHalf());
		
		model.addAttribute("busForm", busForm);
		
		return "bus/busDeleteConfirm";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("busId") Integer busId, RedirectAttributes redirectAttributes) {
		
		List<Route> routes = routeCustomMapper.selectByBusId(busId);
		if (routes.isEmpty()) {
			busMapper.deleteByPrimaryKey(busId);
			redirectAttributes.addFlashAttribute("message","バス" + busId + "を削除しました。");
		} else {
			redirectAttributes.addFlashAttribute("message","バス" + busId + "は既に路線で利用されているため処理できません。");
		}
		
		return "redirect:../busList/index";
	}
}
