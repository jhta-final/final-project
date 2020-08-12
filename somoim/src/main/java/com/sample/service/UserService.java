package com.sample.service;


import com.sample.vo.MoimUser;

public interface UserService {

	MoimUser getUserDetail(String userId);
	
	MoimUser login(String userId, String userPwd);
}
