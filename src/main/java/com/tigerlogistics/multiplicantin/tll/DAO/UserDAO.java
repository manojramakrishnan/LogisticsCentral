package com.tigerlogistics.multiplicantin.tll.DAO;

import java.util.List;

import org.springframework.stereotype.Component;

import com.tigerlogistics.multiplicantin.tll.model.User;

@Component
public interface UserDAO {

	User checkLogin(String userName, String password);

	List<String> showStates();

	int insertUser(User user);

}
