package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.HomeDao;
import com.sample.dao.MoimDao;
import com.sample.dto.MoimMainDto;

@Service
@Transactional
public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeDao homeDao;

	// 전체 랜덤모임 조회
	@Override
	public List<MoimMainDto> getAllMoims() {
		return homeDao.randomMoims();
	}

	// 전체 회원 지역선호별 모임
	@Override
	public List<MoimMainDto> getlocationMoims(long locationNo) {
		return homeDao.locationMoims(locationNo);
	}
}
