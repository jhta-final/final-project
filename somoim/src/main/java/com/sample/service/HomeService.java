package com.sample.service;

import java.util.List;

import com.sample.dto.MoimMainDto;

public interface HomeService {

	// 모든 모임 조회
	List<MoimMainDto> getAllMoims();
	
	
}
