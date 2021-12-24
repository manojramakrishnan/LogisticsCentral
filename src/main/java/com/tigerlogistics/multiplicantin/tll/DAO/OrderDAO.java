package com.tigerlogistics.multiplicantin.tll.DAO;

import org.springframework.stereotype.Component;

import com.tigerlogistics.multiplicantin.tll.model.Orders;

@Component
public interface OrderDAO {

	int insertOrder(Orders order);

}
