package com.tigerlogistics.multiplicantin.tll.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tigerlogistics.multiplicantin.tll.model.User;
import com.tigerlogistics.multiplicantin.tll.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value= {"/home" }, method=RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/index");
		return modelAndView;
		
	}
	
	@RequestMapping(value= {"/login" }, method=RequestMethod.GET)
	public ModelAndView login() {
		List<String> states = userService.showStates();
		ModelAndView modelAndView= new ModelAndView();
		modelAndView.addObject("states",states);
		modelAndView.setViewName("/user_login");
		return modelAndView;
	}
			
	@RequestMapping(value= {"/checkLogin" }, method=RequestMethod.GET)
	public ModelAndView checkLogin(@RequestParam String userName,@RequestParam String password) {
		ModelAndView modelAndView= new ModelAndView();
		User user = userService.checkLogin(userName,password);
		if(user==null) {
			modelAndView.setViewName("/login");
			return modelAndView;
		}
		modelAndView.addObject("user", user);
		modelAndView.setViewName("/index");
		return modelAndView;
	}
	@RequestMapping(value= {"/register" }, method=RequestMethod.POST)
	public ModelAndView register(User user, BindingResult bresult) {
		ModelAndView modelAndView = new ModelAndView();
		int result= userService.insertUser(user);
		if(result <1 ) {
			modelAndView.addObject("result",result);
				}
			else {
					modelAndView.addObject("result",result);
				}
		
		modelAndView.setViewName("redirect:/login");
		return modelAndView;
	}
	@RequestMapping(value= {"/logout" }, method=RequestMethod.GET)
	public ModelAndView logout() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/index");
		return modelAndView;
	}
	


}
