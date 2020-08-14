package com.sample.service;

import java.util.List;

import com.sample.dto.MoimMainDto;
import com.sample.vo.MoimDates;

public interface CategoryService {

	// 메인카테고리별 모임 조회
	List<MoimMainDto> getMoimsByMainCategory(long mainCateNo);
	
	// 서브카테고리별 모임 조회
	List<MoimMainDto> getMoimsBySubCategory(long subCateNo);
	
	// 지역별 모임 조회
	List<MoimMainDto> getMoimsByLocation(long locationNo);
	
	// 날짜별 모임 조회
	List<MoimMainDto> getMoimsByDate(MoimDates moimDates);
	
	// 좋아요순 모임 조회
	List<MoimMainDto> getMoimsByLikes();
}
