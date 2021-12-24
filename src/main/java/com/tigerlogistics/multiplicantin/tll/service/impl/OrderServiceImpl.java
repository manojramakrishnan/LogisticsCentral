package com.tigerlogistics.multiplicantin.tll.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerlogistics.multiplicantin.tll.DAO.OrderDAO;
import com.tigerlogistics.multiplicantin.tll.model.Orders;
import com.tigerlogistics.multiplicantin.tll.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public int insertOrder(Orders order) {
		// TODO Auto-generated method stub
		return this.orderDAO.insertOrder(order);
	}

}
