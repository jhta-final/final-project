package com.sample.dao;

import java.util.List;

import com.sample.dto.MoimMainDto;
import com.sample.vo.MoimDates;

public interface CategoryDao {

	// 메인카테고리별 모임 조회
	List<MoimMainDto> selectMoimsByMainCategory(long mainCateNo);
	
	// 서브카테고리별 모임 조회
	List<MoimMainDto> selectMoimsBySubCategory(long subCateNo);
	
	// 지역별 모임 조회
	List<MoimMainDto> selectMoimsByLocation(long locationNo);
	
	// 날짜별 모임 조회
	List<MoimMainDto> selectMoimsByDate(MoimDates moimDates);
	
	// 좋아요순 모임 조회
	List<MoimMainDto> selectMoimsByLikes();
}