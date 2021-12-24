package com.tigerlogistics.multiplicantin.tll.controller;

import java.lang.reflect.Method;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tigerlogistics.multiplicantin.tll.exception.CustomerManageServiceException;
import com.tigerlogistics.multiplicantin.tll.model.Customer;
import com.tigerlogistics.multiplicantin.tll.service.CustomerManageService;
import com.tigerlogistics.multiplicantin.tll.util.Response;
import com.tigerlogistics.multiplicantin.tll.util.ResponseFactory;

@RequestMapping (value="/**/customerManage")
@Controller
public class CustomerManageController {

	@Autowired
	private CustomerManageService customerManageService;

	@RequestMapping(value="addcustomer",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> addCustomer(@RequestBody Customer customer) throws CustomerManageServiceException{
		
		Response response = ResponseFactory.newInstance();
		String result = customerManageService.addCustomer(customer) ? Response.RESPONSE_RESULT_SUCCESS:Response.RESPONSE_RESULT_ERROR;
		response.setResponseResult(result);
		return response.generateResponse();
	}
	@RequestMapping(value="updatecustomer", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updateCustomer(@RequestBody Customer customer) throws CustomerManageServiceException{
		
		Response response = ResponseFactory.newInstance();
		String result = customerManageService.updateCustomer(customer) ? Response.RESPONSE_RESULT_SUCCESS:Response.RESPONSE_RESULT_ERROR;
		response.setResponseResult(result);
		return response.generateResponse();
	}

	@RequestMapping(value="deletecustomer", method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> deleteCustomer(@RequestParam String customerIdstr) throws CustomerManageServiceException{
	
		Response response = ResponseFactory.newInstance();
		Integer customerId = Integer.valueOf(customerIdstr);
		String result = customerManageService.deleteCustomer(customerId) ? Response.RESPONSE_RESULT_SUCCESS:Response.RESPONSE_RESULT_ERROR;
		return response.generateResponse();
	}
}
