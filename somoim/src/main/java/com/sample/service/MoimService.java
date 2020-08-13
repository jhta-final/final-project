package com.sample.service;

import java.util.List;

import com.sample.dto.JoinUsers;
import com.sample.dto.MoimMainDto;
import com.sample.vo.MoimMain;

public interface MoimService {

	// 새 모임 등록
	void addNewMoim(MoimMainDto moimMainDto);
	// 모든 모임 조회
	List<MoimMainDto> getAllMoims();
	// 모임 상세정보 조회
	MoimMainDto getMoimByNo(long moimNo);
	// 모임 정보 수정
	void modifyMoim(MoimMainDto moimMainDto);
	// 모임 삭제
	void deleteMoim(long moimNo);
	// 모임 좋아요 증가
	void increaseMoimLikes(long moimNo, String userId);
	// 모임 프리미엄 변경
	void primiumMoim(long moimNo, String userId);
	
	
	// 모임에 가입한 유저들 조회
	List<JoinUsers> getAllJoinUsers(long moimNo);
	// 모임 가입
	void joinMoim(long moimNo, String userId);
	// 모임 탈퇴
	void outMoim(long moimNo, String userId);
}
