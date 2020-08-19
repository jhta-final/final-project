package com.sample.service;

import com.sample.vo.MoimAlram;

public interface AlramService {

	// 알림 5개 띄우기
	MoimAlram getAlrams(String userId);
	
	// 알림 등록하기
	void addAlram(MoimAlram moimAlram);
	
	// 알림 읽음표시
	void readAlram(long alramNo);
}
