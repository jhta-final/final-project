package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sample.dao.MoimDao;
import com.sample.dto.MoimMainDto;

public class HomeServiceImpl implements HomeService{

	@Autowired
	private MoimDao moimDao; 

	@Override
	public List<MoimMainDto> getAllMoimMainCategoryService() {
		
		
		return moimDao.selectMoims();
	}
}
