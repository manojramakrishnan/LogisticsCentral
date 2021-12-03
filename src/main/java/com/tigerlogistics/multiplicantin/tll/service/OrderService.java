package com.tigerlogistics.multiplicantin.tll.service;

import org.springframework.stereotype.Service;

import com.tigerlogistics.multiplicantin.tll.model.Orders;

@Service("orderService")
public interface OrderService {

	int insertOrder(Orders order);

}
