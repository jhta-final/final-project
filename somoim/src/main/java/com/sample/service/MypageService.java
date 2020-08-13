package com.sample.service;

import java.util.List;

import com.sample.dto.JoinUsers;
import com.sample.dto.MoimJoinUserDto;
import com.sample.vo.MoimFollow;

public interface MypageService {

	void addFollower(MoimFollow moimFollow);
	
	List<MoimFollow> getAllFollower(String userId);
	
	List<MoimJoinUserDto> getAllJoinMoims(String userId);
}
