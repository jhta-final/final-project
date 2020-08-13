package com.sample.service;

import java.util.List;

import com.sample.vo.MoimSubMoim;

public interface SubMoimService {

	// 새 번개모임 등록
	void addNewSubMoim(MoimSubMoim moimSubMoim);
	// 모임 내의 모든 번개모임 조회
	List<MoimSubMoim> getAllSubMoims(long moimNo);
	// 번개모임 상세 조회
	MoimSubMoim getSubMoimByNo(long subMoimNo);
	// 번개모임 정보 수정
	void modifySubMoim(MoimSubMoim moimSubMoim);
	// 번개모임 삭제
	void deleteSubMoim(long subMoimNo);
	
	// 번개모임 가입
	void joinSubMoim(long subMoimNo, String userId);
	void outSubMoim(long subMoimNo, String userId);
}