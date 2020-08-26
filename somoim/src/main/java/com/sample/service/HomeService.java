package com.sample.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sample.dto.DetailViewMoimsDto;
import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimMainDto;
import com.sample.vo.MoimFavoriteMoim;

public interface HomeService {

	// 모든 카테고리 랜덤 모임 표시
	List<MoimMainDto> getAllMoims();
	
	// 지역별 선호 모임 랜덤 표시
	List<MoimMainDto> getlocationMoims(long beginIndex, long endIndex, long locationNo);
	
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
	
	// 좋아요 유무 확인
	MoimFavoriteMoim getFavorite(long moimNo, String userId);

	// 좋아요 표시한 모임들 보기
	List<MoimMainDto> getselectMoim(String userId);
	
	// 상세정보 보기
	DetailViewMoimsDto detailViewMoims(long moimNo);
	
	// 검색조건
	List<MoimMainDto> getsearchFunction(String keyword);
	
	// 셀렉트박스 검색
	List<MoimMainDto> getselectSearchFunction(Map<String, Object> keyword);
	
}
