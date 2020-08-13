package com.sample.dao;

import java.util.List;

import com.sample.dto.MoimMainDto;

public interface HomeDao {

	// 랜덤 모임 표시하기
	List<MoimMainDto> randomMoims();
	
	// 지역별 선호 모임 랜덤 표시
	List<MoimMainDto> locationMoims(long locationNo);
}
