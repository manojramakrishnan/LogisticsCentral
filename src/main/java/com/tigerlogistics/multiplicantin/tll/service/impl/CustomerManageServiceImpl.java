package com.tigerlogistics.multiplicantin.tll.service.impl;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerlogistics.multiplicantin.tll.DAO.CustomerDAO;
import com.tigerlogistics.multiplicantin.tll.DAO.StockOutDAO;
import com.tigerlogistics.multiplicantin.tll.exception.CustomerManageServiceException;
import com.tigerlogistics.multiplicantin.tll.model.Customer;
import com.tigerlogistics.multiplicantin.tll.model.StockOut;
import com.tigerlogistics.multiplicantin.tll.service.CustomerManageService;

@Service("customerManageService")
public class CustomerManageServiceImpl implements CustomerManageService{

	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private StockOutDAO stockOutDAO;
	
	@Override
	public boolean addCustomer(Customer customer)  {
		// TODO Auto-generated method stub
		if(customer != null) {
			if(customerCheck(customer)) {
				try {
					if(null == customerDAO.selectByName(customer.getName())) {
						customerDAO.insert(customer);
						return true;
					}
				}
				catch(PersistenceException e) {
					
				}
			}
		}
		
		return false;
	}

	private boolean customerCheck(Customer customer) {
		// TODO Auto-generated method stub
		return customer.getName() != null && customer.getPersonIncharge() != null && customer.getTel() != null && customer.getEmail() != null && customer.getAddress() != null;
	}

	@Override
	public boolean updateCustomer(Customer customer) throws CustomerManageServiceException {
		// TODO Auto-generated method stub
		if(customer != null) {
			if(customerCheck(customer)) {
				try {
					if(null == customerDAO.selectByName(customer.getName())) {
						customerDAO.update(customer);
						return true;
					}
				}
				catch(PersistenceException e) {
					
				}
			}
		}
		return false;
	}

	@Override
	public boolean deleteCustomer(Integer customerId) throws CustomerManageServiceException {
		// TODO Auto-generated method stub
		try {
			List<StockOut> records = stockOutDAO.selectByCustomerId(customerId); 
			if(records != null && records.size()>0) {
				return false;
			}
			else {
				customerDAO.deleteById(customerId);
			}
		}
		catch(PersistenceException e) {
			
		}
		return true;
	}

}
