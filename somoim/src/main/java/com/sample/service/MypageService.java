package com.sample.service;

import java.util.List;

import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.dto.PhotoWIthLikeDto;
import com.sample.vo.MoimAlram;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimFollow;
import com.sample.vo.MoimPhoto;

public interface MypageService {

	void addFollower(MoimFollow moimFollow);
	
	List<MoimFollowDto> allFollower(String userId);
	List<MoimFollowDto> allFollowing(String userId);
	
	List<MoimJoinUserMoimDto> allJoinMoims(String userId);
	
	List<MoimBoard> boardsByUser(String userId);
	
	List<PhotoWIthLikeDto> photosByUser(String userId);
	
	
	void AddAlram(MoimAlram moimAlram);
	
	// 쪽지 인서트
	void AddMessage(MoimAlram moimAlram);
	
	int followYn(MoimFollow moimFollow);
	
	
	void deleteFollower(MoimFollow follow);
}
