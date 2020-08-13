package com.sample.dao;

import java.util.List;

import com.sample.dto.MoimJoinUserDto;
import com.sample.vo.MoimFollow;

public interface FollowerDao {

	void insertFollower(MoimFollow moimFollow);
	List<MoimFollow> getFollowersByUserId(String userId);
	List<MoimJoinUserDto> getUserMoims(String userId);
}
