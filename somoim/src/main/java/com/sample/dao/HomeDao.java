package com.sample.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sample.dto.DetailViewMoimsDto;
import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimMainDto;
import com.sample.vo.MoimFavoriteMoim;

public interface HomeDao {

	// 모든 카테고리 랜덤 모임 표시
	List<MoimMainDto> randomMoims();
	
	// 지역별 선호 모임 랜덤 표시
	List<MoimMainDto> locationMoims(HashMap<String, Object> map);
	
	// 좋아요순으로 모임 랜덤 표시
	List<MoimMainDto> favoliteMoims();
	
	// 메안카테고리 랜덤표시
	List<MoimMainDto> mainCategoryMoims(long mainCateNo);
	
	// 가입한 모임 표시
	List<MoimMainDto> joinedMoim(String userId);
	
	// 내 친구 보기
	List<MoimFollowDto> followUsers(String userId);
	
	// 좋아요 기능 및 유무 구현
	MoimFavoriteMoim likesMoim(MoimFavoriteMoim moimFavoriteMoim);
	
	// 좋아요한 모임 추가
	void addLikesMoim(MoimFavoriteMoim moimFavoriteMoim);
	
	// 좋아요한 모임 삭제
	void deleteLikesMoim(MoimFavoriteMoim moimFavoriteMoim);
	
	// 좋아요 표시
	List<MoimMainDto> selectMoim(String userId);
	
	// 상세보기
	List<DetailViewMoimsDto> detailViewMoims(long moimNo);
	
	// 키워드검색조건
	List<MoimMainDto> searchFunction(String keyword);
	
	// 셀렉트박스 검색
	List<MoimMainDto> selectSearchFunction(Map<String, Object> keyword);
	
	// 지역 이름 받아오기
	String LocationName(long locationNo);
	String mainCategory(long mainCateNo);
	String subCategory(long subCateNo);

	// 지역 검색 총 개수
	long getAllLocationCount(long locationNo);
 
}
