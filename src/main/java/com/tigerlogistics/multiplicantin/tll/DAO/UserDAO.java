package com.tigerlogistics.multiplicantin.tll.DAO;

import org.springframework.stereotype.Component;

import com.tigerlogistics.multiplicantin.tll.model.User;

@Component
public interface UserDAO {

	User checkLogin(String userName, String password);

}
