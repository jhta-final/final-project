package com.sample.dao;

import com.sample.vo.MoimUser;

public interface UserDao {
	
	MoimUser getUserById (String userId);
	void insertUser (MoimUser moimUser);
	void updateUser (MoimUser moimUser);
	void deleteUser (String userId);
	
}
