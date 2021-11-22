package com.tigerlogistics.multiplicantin.tll.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tigerlogistics.multiplicantin.tll.DAO.UserDAO;
import com.tigerlogistics.multiplicantin.tll.model.User;
import com.tigerlogistics.multiplicantin.tll.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public User checkLogin(String userName, String password) {
		// TODO Auto-generated method stub
		return this.userDAO.checkLogin(userName,password);
	}

}
