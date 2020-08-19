package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimAlram;

public interface AlramDao {

	List<MoimAlram> selectAlrams(String userId);
	
	void insertAlram(MoimAlram alram);
	
	void insertMessage(MoimAlram alram);
	
	void updateAlram(long alramNo);
}
