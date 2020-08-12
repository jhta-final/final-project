package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.MoimDao;
import com.sample.vo.MoimMain;

@Service
@Transactional
public class MoimServiceImpl implements MoimService {

	@Autowired
	private MoimDao moimDao;
	
	@Override
	public void addNewMoim(MoimMain moimMain) {
		moimDao.insertMoim(moimMain);
	}

	@Override
	public List<MoimMain> getAllMoims() {
		return moimDao.selectMoims();
	}

	@Override
	public MoimMain getMoimByNo(long moimNo) {
		return moimDao.selectMoim(moimNo);
	}

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

	@Override
	public void increaseMoimLikes(long moimNo, String userId) {
		MoimMain savedMoim = moimDao.selectMoim(moimNo);
		if(savedMoim == null) {
			System.out.println("해당 게시글이 존재하지 않음");
			return;
		}
		
		savedMoim.setLikes(savedMoim.getLikes() + 1);
		
		moimDao.updateMoim(savedMoim);
	}

	@Override
	public void primiumMoim(long moimNo, String userId) {
		MoimMain savedMoim = moimDao.selectMoim(moimNo);
		if(savedMoim == null) {
			System.out.println("해당 게시글이 존재하지 않음");
			return;
		}
		
		savedMoim.setPrimiumYn("Y");
		
		moimDao.updateMoim(savedMoim);
	}

	
}
