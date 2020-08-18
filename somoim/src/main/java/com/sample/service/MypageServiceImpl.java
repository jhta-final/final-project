package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.AlramDao;
import com.sample.dao.BoardDao;
import com.sample.dao.FollowerDao;
import com.sample.dao.PhotoDao;
import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.vo.MoimAlram;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimFollow;
import com.sample.vo.MoimPhoto;

@Service
@Transactional
public class MypageServiceImpl implements MypageService {

	
	@Autowired
	FollowerDao followerDao;
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	PhotoDao photoDao;
	
	@Autowired
	AlramDao alramDao;
	
	@Override
	public void addFollower(MoimFollow moimFollow) {
		followerDao.insertFollower(moimFollow);
		
	}
	
	@Override
	public List<MoimFollowDto> allFollower(String userId) {
		return followerDao.getFollowersByUserId(userId);
	}
	@Override
	public List<MoimJoinUserMoimDto> allJoinMoims(String userId) {
		return followerDao.getUserMoims(userId);
	}
	@Override
	public List<MoimBoard> boardsByUser(String userId) {
		return boardDao.getBoardsByUserId(userId);
	}
	
	@Override
	public List<MoimPhoto> photosByUser(String userId) {
		return photoDao.getPhotosByUserId(userId);
	}
	
	@Override
	public void AddAlram(MoimAlram moimAlram) {
		alramDao.insertAlram(moimAlram);
		
	}
	@Override
	public void AddMessage(MoimAlram moimAlram) {
		alramDao.insertMessage(moimAlram);
		
	}
}
