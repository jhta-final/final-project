package com.sample.service;

import java.util.List;

import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimFollow;
import com.sample.vo.MoimPhoto;

public interface MypageService {

	void addFollower(MoimFollow moimFollow);
	
	List<MoimFollow> allFollower(String userId);
	
	List<MoimJoinUserMoimDto> allJoinMoims(String userId);
	
	List<MoimBoard> boardsByUser(String userId);
	
	List<MoimPhoto> photosByUser(String userId);
}
