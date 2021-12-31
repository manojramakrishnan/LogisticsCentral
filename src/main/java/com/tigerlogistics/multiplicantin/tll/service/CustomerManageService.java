package com.tigerlogistics.multiplicantin.tll.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.tigerlogistics.multiplicantin.tll.exception.CustomerManageServiceException;
import com.tigerlogistics.multiplicantin.tll.model.Customer;

public interface CustomerManageService {

	boolean addCustomer(Customer customer) throws CustomerManageServiceException;

	boolean updateCustomer(Customer customer) throws CustomerManageServiceException;

	boolean deleteCustomer(Integer customerId) throws CustomerManageServiceException;

	Map<String, Object> selectById(Integer valueOf);

	Map<String, Object> selectByName(int offset, int limit, String keyword);

	Map<String, Object> selectAll(int offset, int limit);

	Map<String, Object> importCustomer(MultipartFile file);
	
	File exportCustomer(List<Customer> customers);

}
