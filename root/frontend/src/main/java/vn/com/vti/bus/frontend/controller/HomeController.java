package vn.com.vti.bus.frontend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.entity.BusStop;
import vn.com.vti.bus.entity.BusStopExample;
import vn.com.vti.bus.frontend.form.RouteSearchForm;
import vn.com.vti.bus.mapper.BusStopMapper;
import vn.com.vti.bus.mapper.RouteCustomMapper;

@Controller
public class HomeController {

    @Autowired
    private RouteCustomMapper routeCustomMapper;

    @Autowired
    private BusStopMapper busStopMapper;

    @RequestMapping("/")
    public String index(RouteSearchForm routeSearchForm, Model model) {
        BusStopExample busStopExample = new BusStopExample();
        busStopExample.setOrderByClause("bus_stop_id");

        List<BusStop> busStopList = busStopMapper.selectByExample(busStopExample);
        model.addAttribute("busStopList", busStopList);

        return "homePage";
    }
}

