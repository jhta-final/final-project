package com.sample.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.UserDao;
import com.sample.vo.MoimUser;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	public MoimUser getUserDetail(String userId) {
		return userDao.getUserById(userId);
	}
}
