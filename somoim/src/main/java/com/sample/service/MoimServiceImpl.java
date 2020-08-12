package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.MoimDao;
import com.sample.vo.MoimJoinUser;
import com.sample.vo.MoimMain;

@Service
@Transactional
public class MoimServiceImpl implements MoimService {

	@Autowired
	private MoimDao moimDao;
	
	// 새로운 모임 생성
	@Override
	public void addNewMoim(MoimMain moimMain, String userId) {
		MoimJoinUser moimJoinUser = new MoimJoinUser();
		moimJoinUser.setMoimNo(moimMain.getMoimNo());
		moimJoinUser.setUserId(userId);
		moimJoinUser.setUserRole("ADMIN");
		
		moimDao.insertMoim(moimMain);
		moimDao.insertJoinUser(moimJoinUser);
	}

	// 모든 모임 조회
	@Override
	public List<MoimMain> getAllMoims() {
		return moimDao.selectMoims();
	}

	// 모임 상세정보 조회
	@Override
	public MoimMain getMoimByNo(long moimNo) {
		return moimDao.selectMoim(moimNo);
	}

	// 모임 정보 수정
	@Override
	public void modifyMoim(MoimMain moimMain) {
		MoimMain savedMoim = moimDao.selectMoim(moimMain.getMoimNo());
		if(savedMoim == null) {
			System.out.println("해당 게시글이 존재하지 않음");
			return;
		}
		
		// 모임 작성자 비교??
		
		savedMoim.setTitle(moimMain.getTitle());
		savedMoim.setHeadCount(moimMain.getHeadCount());
		savedMoim.setContent(moimMain.getContent());
		savedMoim.setImage(moimMain.getImage());
		savedMoim.setFee(moimMain.getFee());
		savedMoim.setJoinDate(moimMain.getJoinDate());
		savedMoim.setSubCateNo(moimMain.getSubCateNo());
		savedMoim.setLocationNo(moimMain.getLocationNo());
		
		moimDao.updateMoim(savedMoim);
	}

	// 모임 삭제
	@Override
	public void deleteMoim(long moimNo) {
		MoimMain savedMoim = moimDao.selectMoim(moimNo);
		if(savedMoim == null) {
			System.out.println("해당 게시글이 존재하지 않음");
			return;
		}
		
		savedMoim.setDeleteYn("Y");
		
		moimDao.updateMoim(savedMoim);
	}

	// 모임 좋아요 증가
	@Override
	public void increaseMoimLikes(long moimNo, String userId) {
		MoimMain savedMoim = moimDao.selectMoim(moimNo);
		if(savedMoim == null) {
			System.out.println("해당 게시글이 존재하지 않음");
			return;
		}
		
		// 유저 즐겨찾기모임 추가
		
		savedMoim.setLikes(savedMoim.getLikes() + 1);
		
		moimDao.updateMoim(savedMoim);
	}

	// 모임 프리미엄 변경
	@Override
	public void primiumMoim(long moimNo, String userId) {
		MoimMain savedMoim = moimDao.selectMoim(moimNo);
		if(savedMoim == null) {
			System.out.println("해당 게시글이 존재하지 않음");
			return;
		}
		
		// 유저 프리미엄 결제??
		
		savedMoim.setPrimiumYn("Y");
		
		moimDao.updateMoim(savedMoim);
	}

	
	/* 유저 */
	
	// 모임 가입하기
	@Override
	public void joinMoim(long moimNo, String userId) {
		MoimJoinUser savedUser = moimDao.selectMoimDupUser(new MoimJoinUser(moimNo, userId));
		if(savedUser != null) {
			System.out.println("이미 가입된 모임입니다");
		}
		
		moimDao.insertJoinUser(savedUser);
	}
	
	// 모임 탈퇴하기
	@Override
	public void outMoim(long moimNo, String userId) {
		
		moimDao.deleteJoinUser(new MoimJoinUser(moimNo, userId));
	}
}
