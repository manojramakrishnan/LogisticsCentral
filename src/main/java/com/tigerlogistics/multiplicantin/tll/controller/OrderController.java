package com.tigerlogistics.multiplicantin.tll.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tigerlogistics.multiplicantin.tll.model.Orders;
import com.tigerlogistics.multiplicantin.tll.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value= {"/orderGeneration" }, method=RequestMethod.POST)
		public ModelAndView orderGeneration(Orders order) {
		ModelAndView modelAndView= new ModelAndView();
		
		int insertResult= orderService.insertOrder(order);
		if(insertResult<1) {
			modelAndView.setViewName("/generateorder");
			return modelAndView;
		}
		
		modelAndView.setViewName("/index");
		return modelAndView;
	}
}
