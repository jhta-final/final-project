package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimJoinUser;
import com.sample.vo.MoimMain;

public interface MoimDao {

	void insertMoim(MoimMain moimMain);
	List<MoimMain> getAllMoims();
	MoimMain getMoimsByNo(long moimNo);
	void updateMoim(MoimMain moimMain);
	void deleteMoim(long moimNo);
	
	void insertJoinUser(MoimJoinUser moimJoinUser);
	List<MoimJoinUser> getAllJoinUserByMoimNo(long moimNo);
	void deleteJoinUser(MoimJoinUser moimJoinUser);
}
