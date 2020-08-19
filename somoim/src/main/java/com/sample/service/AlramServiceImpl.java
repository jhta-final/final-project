package com.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.AlramDao;
import com.sample.vo.MoimAlram;

@Service
@Transactional
public class AlramServiceImpl implements AlramService {

	@Autowired
	private AlramDao alramDao;
	
	// 알림 조회하기
	@Override
	public MoimAlram getAlrams(String userId) {
		return alramDao.selectAlrams(userId);
	}
	
	// 알림 등록하기
	@Override
	public void addAlram(MoimAlram moimAlram) {
		alramDao.insertAlram(moimAlram);
	}

	// 알림 읽음표시
	@Override
	public void readAlram(long alramNo) {
		alramDao.updateAlram(alramNo);
	}

}
