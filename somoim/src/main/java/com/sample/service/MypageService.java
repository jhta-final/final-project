package com.sample.service;

import java.util.List;

import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimFollow;

public interface MypageService {

	void addFollower(MoimFollow moimFollow);
	
	List<MoimFollow> getAllFollower(String userId);
	
	List<MoimJoinUserMoimDto> getAllJoinMoims(String userId);
	
	List<MoimBoard> getBoardsByUser(String userId);
}
