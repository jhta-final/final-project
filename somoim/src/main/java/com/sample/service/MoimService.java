package com.sample.service;

import java.util.List;

import com.sample.vo.MoimMain;

public interface MoimService {

	// 새 모임 등록
	void addNewMoim(MoimMain moimMain);
	// 모든 모임 조회
	List<MoimMain> getAllMoims();
	// 모임 상세정보 조회
	MoimMain getMoimByNo(long moimNo);
	// 모임 정보 수정
	void modifyMoim(MoimMain moimMain);
	// 모임 삭제
	void deleteMoim(long moimNo);
	// 모임 좋아요 증가
	void increaseMoimLikes(long moimNo, String userId);
	// 모임 프리미엄 변경
	void primiumMoim(long moimNo, String userId);
}
