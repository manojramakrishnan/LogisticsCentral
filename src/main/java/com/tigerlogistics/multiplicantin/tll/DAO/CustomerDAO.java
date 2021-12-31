package com.tigerlogistics.multiplicantin.tll.DAO;

import java.util.List;

import com.tigerlogistics.multiplicantin.tll.model.Customer;

public interface CustomerDAO {

	void insert(Customer customer);
	
	Customer selectByName(String customerName);

	void update(Customer customer);

	void deleteById(Integer customerId);

	Customer selectById(Integer customerId);

	List<Customer> selectApproximateByName(String customerName);

	List<Customer> selectAll(); 
	
	void insertBatch(List<Customer> customers);


}
