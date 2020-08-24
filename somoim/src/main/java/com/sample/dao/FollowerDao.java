package com.sample.dao;

import java.util.List;

import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.vo.MoimFollow;

public interface FollowerDao {

	void insertFollower(MoimFollow moimFollow);
	List<MoimFollowDto> getFollowersByUserId(String userId);
	List<MoimJoinUserMoimDto> getUserMoims(String userId);
	// 팔로우돼있는지 찾기 1 == 팔로우 0 == 안돼있음
	long findFollower(MoimFollow moimFollow);
	
	void deleteFollower(MoimFollow moimFollow);
}
