package com.tigerlogistics.multiplicantin.tll.service;

import java.util.List;

import com.tigerlogistics.multiplicantin.tll.model.User;

public interface UserService {

	User checkLogin(String userName, String password);

	List<String> showStates();

	int insertUser(User user);

	
}
