package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.MoimDao;
import com.sample.dto.MoimJoinUserDto;
import com.sample.dto.MoimMainDto;
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
		// 모임 방장 저장하기
		MoimJoinUser moimJoinUser = new MoimJoinUser();
		moimJoinUser.setMoimNo(moimMain.getMoimNo());
		moimJoinUser.setUserId(userId);
		moimJoinUser.setUserRole("ADMIN");
		
		moimDao.insertMoim(moimMain);
		moimDao.insertJoinUser(moimJoinUser);
	}

	// 모든 모임 조회
	@Override
	public List<MoimMainDto> getAllMoims() {
		return moimDao.selectMoims();
	}

	// 모임 상세정보 조회
	@Override
	public MoimMainDto getMoimByNo(long moimNo) {
		return moimDao.selectMoim(moimNo);
	}

	// 모임 정보 수정
	@Override
	public void modifyMoim(MoimMainDto moimMainDto) {
		MoimMainDto savedMoim = moimDao.selectMoim(moimMainDto.getMoimNo());
		if(savedMoim == null) {
			System.out.println("해당 모임이 존재하지 않음");
			return;
		}
		
		// 모임 작성자 비교??
		
		savedMoim.setTitle(moimMainDto.getTitle());
		savedMoim.setHeadCount(moimMainDto.getHeadCount());
		savedMoim.setContent(moimMainDto.getContent());
		savedMoim.setImage(moimMainDto.getImage());
		savedMoim.setFee(moimMainDto.getFee());
		savedMoim.setJoinDate(moimMainDto.getJoinDate());
		savedMoim.setSubCateNo(moimMainDto.getSubCateNo());
		savedMoim.setLocationNo(moimMainDto.getLocationNo());
		
		moimDao.updateMoim(savedMoim);
	}

	// 모임 삭제
	@Override
	public void deleteMoim(long moimNo) {
		MoimMainDto savedMoim = moimDao.selectMoim(moimNo);
		if(savedMoim == null) {
			System.out.println("해당 모임이 존재하지 않음");
			return;
		}
		
		savedMoim.setDeleteYn("Y");
		
		moimDao.updateMoim(savedMoim);
	}

	// 모임 좋아요 증가
	@Override
	public void increaseMoimLikes(long moimNo, String userId) {
		MoimMainDto savedMoim = moimDao.selectMoim(moimNo);
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
		MoimMainDto savedMoim = moimDao.selectMoim(moimNo);
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
		MoimJoinUser savedUser = moimDao.selectJoinUser(new MoimJoinUser(moimNo, userId));
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

	// 모임 내의 유저들 조회하기
	@Override
	public List<MoimJoinUserDto> getAllJoinUsers(long moimNo) {
		
		return moimDao.selectJoinUsers(moimNo);
	}
}
