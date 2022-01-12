package com.tigerlogistics.multiplicantin.tll.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tigerlogistics.multiplicantin.tll.DAO.CustomerDAO;
import com.tigerlogistics.multiplicantin.tll.DAO.StockOutDAO;
import com.tigerlogistics.multiplicantin.tll.exception.CustomerManageServiceException;
import com.tigerlogistics.multiplicantin.tll.model.Customer;
import com.tigerlogistics.multiplicantin.tll.model.StockOut;
import com.tigerlogistics.multiplicantin.tll.service.CustomerManageService;
import com.tigerlogistics.multiplicantin.tll.util.EJConverter;
import com.tigerlogistics.multiplicantin.tll.util.EJConvertor;
import com.tigerlogistics.multiplicantin.tll.util.FileUtil;

@Service("customerManageService")
public class CustomerManageServiceImpl implements CustomerManageService{

	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private StockOutDAO stockOutDAO;

	@Autowired
	private EJConverter ejConvertor;
	
	
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

	@Override
	public Map<String, Object> selectById(Integer customerId) {
		// TODO Auto-generated method stub
		Map<String,Object> resultSet= new HashMap<>();
		List<Customer> customers= new ArrayList<>();
		long total=0;
		Customer customer = new Customer();
		try {
			customer= customerDAO.selectById(customerId);
		}
		catch(PersistenceException e) {
			System.out.println("exception catch");
			e.printStackTrace();
		}
		if(customer != null) {
			customers.add(customer);
			total=1;
		}
		resultSet.put("data", customers);
		resultSet.put("total", total);
		
		return resultSet;
	}

	@Override
	public Map<String, Object> selectByName(int offset, int limit, String customerName) {
		// TODO Auto-generated method stub
		Map<String,Object> resultSet= new HashMap<>();
		List<Customer> customers= new ArrayList<>();
		long total=0;
		boolean isPagination= true;
		if(offset <0 || limit<0)
			isPagination= false;
		
		try {
			if(isPagination) {
				PageHelper.offsetPage(offset,limit);
				customers = customerDAO.selectApproximateByName(customerName);
				if(customers != null) {
					PageInfo <Customer> pageInfo = new PageInfo<>(customers);
					total= pageInfo.getTotal();
								
				}
				else {
					customers = new ArrayList<>();
				}
			}
			else {
				customers = customerDAO.selectApproximateByName(customerName);
				if(customers !=null) {
					total = customers.size();
				}
				else {
					customers = new ArrayList();
				}
			}
		}
		catch(PersistenceException e) {
			
		}
		resultSet.put("data", customers);
		resultSet.put("total", total);
		
		return resultSet;
	}

	@Override
	public Map<String, Object> selectAll(int offset,int limit) {
		// TODO Auto-generated method stub
		Map<String,Object> resultSet = new HashMap();
		List<Customer> customers = new ArrayList<Customer>();
		long total =0;
		boolean isPagination= true;
		if (offset <0 || limit<0) {
			isPagination =false;
			
		}
		try {
			if(isPagination) {
				PageHelper.offsetPage(offset, limit);
				customers=customerDAO.selectAll();
				if(customers != null) {
					PageInfo<Customer> pageInfo = new PageInfo<>(customers);
					total = pageInfo.getTotal();
				}
				else {
					customers = new ArrayList<>();
				}
			}
			else {
				customers= customerDAO.selectAll();
				if(customers != null) {
					total = customers.size();
				}
				else {
					customers = new ArrayList<>();
					
				}
			}
		}
		catch(PersistenceException e) {
			
		}
		resultSet.put("data", customers);
		resultSet.put("total", total);
		return resultSet;
	}

	@Override
    public Map<String, Object> importCustomer(MultipartFile file)  {
        
        Map<String, Object> result = new HashMap<>();
        int total = 0;
        int available = 0;

        
        try {
            List<Customer> customers = ejConvertor.excelReader(Customer.class, FileUtil.convertMultipartFileToFile(file));
            if (customers != null) {
                total = customers.size();

                
                List<Customer> availableList = new ArrayList<>();
                for (Customer customer : customers) {
                    if (customerCheck(customer)) {
                        if (customerDAO.selectByName(customer.getName()) == null)
                            availableList.add(customer);
                    }
                }

                
                available = availableList.size();
                if (available > 0) {
                    customerDAO.insertBatch(availableList);
                }
            }
        } catch (PersistenceException | IOException e) {
            
        }

        result.put("total", total);
        result.put("available", available);
        return result;
    }
	
	@Override
    public File exportCustomer(List<Customer> customers) {
        if (customers == null)
            return null;

        return ejConvertor.excelWriter(Customer.class, customers);
    }
	
}
