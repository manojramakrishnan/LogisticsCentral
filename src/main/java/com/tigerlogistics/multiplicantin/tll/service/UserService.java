package com.tigerlogistics.multiplicantin.tll.service;

import com.tigerlogistics.multiplicantin.tll.model.User;

public interface UserService {

	User checkLogin(String userName, String password);

	
}
