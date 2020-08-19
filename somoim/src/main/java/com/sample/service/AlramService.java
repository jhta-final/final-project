package com.sample.service;

import java.util.List;

import com.sample.vo.MoimAlram;

public interface AlramService {

	// 알림 띄우기
	List<MoimAlram> getAlrams(String userId);
	
	// 알림 등록하기
	void addAlram(MoimAlram moimAlram);
	
	// 알림 읽음표시
	void readAlram(long alramNo);
}
