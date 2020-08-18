package com.sample.dao;

import java.util.List;

import com.sample.dto.MoimMainDto;

public interface HomeDao {

	// 모든 카테고리 랜덤 모임 표시
	List<MoimMainDto> randomMoims();
	
	// 지역별 선호 모임 랜덤 표시
	List<MoimMainDto> locationMoims(long locationNo);
	
	// 좋아요순으로 모임 랜덤 표시
	List<MoimMainDto> favoliteMoims();
	
	// 메안카테고리 랜덤표시
	List<MoimMainDto> mainCategoryMoims(long mainCateNo);
	
	// 가입한 모임 표시
	List<MoimMainDto> joinedMoim(String userId);
	
	// 관심표시한 모임 표시
	List<MoimMainDto> attentionMoim(String userId);
}
