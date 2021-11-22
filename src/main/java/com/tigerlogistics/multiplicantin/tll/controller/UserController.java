package com.tigerlogistics.multiplicantin.tll.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value= {"/login" }, method=RequestMethod.GET)
	public String login(@RequestParam String userName,@RequestParam String password) {
		
		User user = userService.checkLogin(userName,password);
//		modelAndView.setViewName("/login.html");
		return "index";
		
	}
	
}
