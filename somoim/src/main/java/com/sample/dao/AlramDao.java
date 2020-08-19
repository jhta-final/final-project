package com.sample.dao;

import com.sample.vo.MoimAlram;

public interface AlramDao {

	MoimAlram selectAlrams(String userId);
	
	void insertAlram(MoimAlram alram);
	
	void insertMessage(MoimAlram alram);
	
	void updateAlram(long alramNo);
}
