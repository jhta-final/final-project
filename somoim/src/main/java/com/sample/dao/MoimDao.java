package com.sample.dao;

import java.util.List;

import com.sample.dto.MoimJoinUserDto;
import com.sample.dto.MoimMainDto;
import com.sample.vo.MoimJoinUser;
import com.sample.vo.MoimMain;

public interface MoimDao {

	void insertMoim(MoimMain moimMain);
	List<MoimMainDto> selectMoims();
	MoimMainDto selectMoim(long moimNo);
	void updateMoim(MoimMainDto moimMainDto);
	
	void insertJoinUser(MoimJoinUser moimJoinUser);
	List<MoimJoinUserDto> selectJoinUsers(long moimNo);
	MoimJoinUser selectJoinUser(MoimJoinUser moimJoinUser);
	void deleteJoinUser(MoimJoinUser moimJoinUser);
	
}
