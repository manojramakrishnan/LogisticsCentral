package com.tigerlogistics.multiplicantin.tll.DAO;

import com.tigerlogistics.multiplicantin.tll.model.Customer;

public interface CustomerDAO {

	void insert(Customer customer);
	
	Customer selectByName(String customerName);

	void update(Customer customer);

	void deleteById(Integer customerId); 

}
