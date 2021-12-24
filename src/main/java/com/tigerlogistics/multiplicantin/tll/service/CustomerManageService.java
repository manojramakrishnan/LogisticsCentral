package com.tigerlogistics.multiplicantin.tll.service;

import com.tigerlogistics.multiplicantin.tll.exception.CustomerManageServiceException;
import com.tigerlogistics.multiplicantin.tll.model.Customer;

public interface CustomerManageService {

	boolean addCustomer(Customer customer) throws CustomerManageServiceException;

	boolean updateCustomer(Customer customer) throws CustomerManageServiceException;

	boolean deleteCustomer(Integer customerId) throws CustomerManageServiceException;

}
