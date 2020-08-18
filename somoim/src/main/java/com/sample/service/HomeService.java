package com.sample.service;

import java.util.List;

import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimMainDto;

public interface HomeService {

	// 모든 카테고리 랜덤 모임 표시
	List<MoimMainDto> getAllMoims();
	
	// 지역별 선호 모임 랜덤 표시
	List<MoimMainDto> getlocationMoims(long locationNo);
	
	// 좋아요순으로 모임 랜덤 표시
	List<MoimMainDto> getFavoliteMoims();
	
	// 메안카테고리 랜덤표시
	List<MoimMainDto> getMainCategoryMoims();
	
	// 가입한 모임 표시
	List<MoimMainDto> getjoinedMoim(String userId);
	
	// 내 친구 보기
	List<MoimFollowDto> getfollowUsers(String userId);
	
	// 좋아요 기능 구현
	void increaseLikesMoim(long moimNo, String userId);

	
	// 관심표시한 모임 표시
//	List<MoimMainDto> getattentionMoim(String userId);
}
