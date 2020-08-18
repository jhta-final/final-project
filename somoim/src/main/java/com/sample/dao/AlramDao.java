package com.sample.dao;

import com.sample.vo.MoimAlram;

public interface AlramDao {

	void insertAlram(MoimAlram alram);
	
	void updateAlram(long alramNo);
}
