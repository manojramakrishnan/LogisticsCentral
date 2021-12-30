package com.tigerlogistics.multiplicantin.tll.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tigerlogistics.multiplicantin.tll.exception.CustomerManageServiceException;
import com.tigerlogistics.multiplicantin.tll.exception.GoodsManageServiceException;
import com.tigerlogistics.multiplicantin.tll.model.Customer;
import com.tigerlogistics.multiplicantin.tll.model.Goods;
import com.tigerlogistics.multiplicantin.tll.service.GoodsManageService;
import com.tigerlogistics.multiplicantin.tll.util.Response;
import com.tigerlogistics.multiplicantin.tll.util.ResponseFactory;

@RequestMapping("/**/goodsmanage")
@Controller
public class GoodsManageController {

	
	@Autowired
	private GoodsManageService goodsManageService;
	
	@RequestMapping(value ="addgoods", method= RequestMethod.POST)
	public @ResponseBody Map<String,Object> addGoods(@RequestParam Goods goods) throws GoodsManageServiceException{
		Response response = ResponseFactory.newInstance();
		String result = goodsManageService.addGoods(goods) ? Response.RESPONSE_RESULT_SUCCESS: Response.RESPONSE_RESULT_ERROR;
		response.setResponseResult(result);
		return response.generateResponse();
		
	}
	@RequestMapping(value="updategoods", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updateGoods(@RequestBody Goods goods) throws GoodsManageServiceException{
		
		Response response = ResponseFactory.newInstance();
		String result = goodsManageService.updateGoods(goods) ? Response.RESPONSE_RESULT_SUCCESS:Response.RESPONSE_RESULT_ERROR;
		response.setResponseResult(result);
		return response.generateResponse();
	}

	@RequestMapping(value="deletegoods", method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> deleteGoods(@RequestParam String goodsIdstr) throws GoodsManageServiceException{
	
		Response response = ResponseFactory.newInstance();
		Integer goodsId = Integer.valueOf(goodsIdstr);
		String result = goodsManageService.deletegoods(goodsId) ? Response.RESPONSE_RESULT_SUCCESS:Response.RESPONSE_RESULT_ERROR;
		return response.generateResponse();
	}
}
