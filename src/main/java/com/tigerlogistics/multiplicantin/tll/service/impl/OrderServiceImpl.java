package com.tigerlogistics.multiplicantin.tll.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.tigerlogistics.multiplicantin.tll.DAO.OrderDAO;
import com.tigerlogistics.multiplicantin.tll.model.Orders;
import com.tigerlogistics.multiplicantin.tll.service.OrderService;

public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public int insertOrder(Orders order) {
		// TODO Auto-generated method stub
		return this.orderDAO.insertOrder(order);
	}

}
