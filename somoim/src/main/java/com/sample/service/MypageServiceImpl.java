package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.FollowerDao;
import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimFollow;

@Service
@Transactional
public class MypageServiceImpl implements MypageService {

	
	@Autowired
	FollowerDao followerDao;
	
	@Override
	public void addFollower(MoimFollow moimFollow) {
		followerDao.insertFollower(moimFollow);
		
	}
	
	@Override
	public List<MoimFollow> getAllFollower(String userId) {
		return followerDao.getFollowersByUserId(userId);
	}
	@Override
	public List<MoimJoinUserMoimDto> getAllJoinMoims(String userId) {
		return followerDao.getUserMoims(userId);
	}
	@Override
	public List<MoimBoard> getBoardsByUser(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
}
