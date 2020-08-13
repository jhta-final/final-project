package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.SubMoimDao;
import com.sample.vo.MoimSubJoinUser;
import com.sample.vo.MoimSubMoim;

@Service
@Transactional
public class SubMoimServiceImpl implements SubMoimService {

	@Autowired
	private SubMoimDao subMoimDao;
	
	// 새 번개모임 등록
	@Override
	public void addNewSubMoim(MoimSubMoim moimSubMoim) {
		subMoimDao.insertSubMoim(moimSubMoim);
		
		MoimSubJoinUser joinUser = new MoimSubJoinUser();
		joinUser.setMoimNo(moimSubMoim.getMoimNo());
		joinUser.setUserId(moimSubMoim.getUserId());
		
		subMoimDao.insertSubJoinUser(joinUser);
	}

	// 모임 내의 모든 번개모임 조회
	@Override
	public List<MoimSubMoim> getAllSubMoims(long moimNo) {
		return subMoimDao.selectSubMoims(moimNo);
	}

	// 번개모임 상세정보 조회
	@Override
	public MoimSubMoim getSubMoimByNo(long subMoimNo) {
		return subMoimDao.selectSubMoim(subMoimNo);
	}

	// 번개모임 정보 수정
	@Override
	public void modifySubMoim(MoimSubMoim moimSubMoim) {
		MoimSubMoim savedMoim = subMoimDao.selectSubMoim(moimSubMoim.getSubMoimNo());
		if(savedMoim == null) {
			System.out.println("해당 모임이 존재하지 않음");
			return;
		}
		
		savedMoim.setTitle(moimSubMoim.getTitle());
		savedMoim.setLocation(moimSubMoim.getLocation());
		savedMoim.setHeadCount(moimSubMoim.getHeadCount());
		savedMoim.setFee(moimSubMoim.getFee());
		savedMoim.setJoinDate(moimSubMoim.getJoinDate());
		
		subMoimDao.updateSubMoim(savedMoim);
	}

	// 번개모임 삭제
	@Override
	public void deleteSubMoim(long subMoimNo) {
		MoimSubMoim savedMoim = subMoimDao.selectSubMoim(subMoimNo);
		if(savedMoim == null) {
			System.out.println("해당 모임이 존재하지 않음");
			return;
		}
		
		savedMoim.setDeleteYN("Y");
		
		subMoimDao.updateSubMoim(savedMoim);
	}

	
	/* 유저 */
	
	// 번개모임 가입
	@Override
	public void joinSubMoim(long subMoimNo, String userId) {
		MoimSubJoinUser savedUser = subMoimDao.selectSubJoinUser(new MoimSubJoinUser(subMoimNo, userId));
		if(savedUser != null) {
			System.out.println("이미 가입된 모임입니다.");
		}
		
		subMoimDao.insertSubJoinUser(savedUser);
	}

	// 번개모임 탈퇴
	@Override
	public void outSubMoim(long subMoimNo, String userId) {
		subMoimDao.deleteSubJoinUser(new MoimSubJoinUser(subMoimNo, userId));
	}

}