package com.tigerlogistics.multiplicantin.tll.controller;

import java.lang.reflect.Method;
import java.util.List;
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
import com.tigerlogistics.multiplicantin.tll.model.Supplier;
import com.tigerlogistics.multiplicantin.tll.service.CustomerManageService;
import com.tigerlogistics.multiplicantin.tll.util.Response;
import com.tigerlogistics.multiplicantin.tll.util.ResponseFactory;

@RequestMapping (value="/**/customerManage")
@Controller
public class CustomerManageController {

	@Autowired
	private CustomerManageService customerManageService;

	private static final String SEARCH_BY_ID = "searchById";
	
	private static final String SEARCH_BY_NAME = "searchByName";
	
	private static final String SEARCH_ALL = "searchAll";
	
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

	@RequestMapping(value="getcustomerlist", method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> getCustomerList(@RequestParam("searchtype") String searchType, @RequestParam("offset") int offset, @RequestParam("limit") int limit, @RequestParam("keyword") String keyword ){
		Response response = ResponseFactory.newInstance();
		List<Supplier> roles = null;
		long total=0;
		Map<String,Object> queryResult = Query(searchType,offset,limit,keyword);
		if(queryResult != null) {
			roles= (List<Supplier>) queryResult.get("data");
			total= (long) queryResult.get("total");
		}
		response.setCustomerInfo("roles", roles);
		response.setResponseTotal(total);
		response.setResponseResult(response.RESPONSE_RESULT_SUCCESS);
		return response.generateResponse();
	
	}
	private Map<String, Object> Query(String searchType, int offset, int limit, String keyword) {
		// TODO Auto-generated method stub
		Map<String,Object> queryResult= null;
		switch(searchType) {
		
		case SEARCH_BY_ID:
			queryResult= customerManageService.selectById(Integer.valueOf(keyword));
			break;
		case SEARCH_BY_NAME:
			queryResult= customerManageService.selectByName(offset,limit,keyword);
			break;
		case SEARCH_ALL:
			queryResult= customerManageService.selectAll(offset,keyword,limit);
			break;
		default:
			break;
			
		}
		
		return queryResult;
	}

}

