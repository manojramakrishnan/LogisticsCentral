package com.tigerlogistics.multiplicantin.tll.service;

import java.util.Map;

import com.tigerlogistics.multiplicantin.tll.exception.CustomerManageServiceException;
import com.tigerlogistics.multiplicantin.tll.model.Customer;

public interface CustomerManageService {

	boolean addCustomer(Customer customer) throws CustomerManageServiceException;

	boolean updateCustomer(Customer customer) throws CustomerManageServiceException;

	boolean deleteCustomer(Integer customerId) throws CustomerManageServiceException;

	Map<String, Object> selectById(Integer valueOf);

	Map<String, Object> selectByName(int offset, int limit, String keyword);

	Map<String, Object> selectAll(int offset, String keyword, int limit);

}
