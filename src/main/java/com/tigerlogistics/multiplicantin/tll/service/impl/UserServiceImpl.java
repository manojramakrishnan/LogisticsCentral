package com.tigerlogistics.multiplicantin.tll.service.impl;

import java.util.List;

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

	@Override
	public List<String> showStates() {
		// TODO Auto-generated method stub
		return this.userDAO.showStates();
	}

	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return this.userDAO.insertUser(user);
	}

	@Override
	public List<String> showCities(String state) {
		// TODO Auto-generated method stub
		return this.userDAO.showCities(state);
	}

	@Override
	public List<String> showAreas(String city) {
		// TODO Auto-generated method stub
		return this.userDAO.showAreas(city);
	}

}
