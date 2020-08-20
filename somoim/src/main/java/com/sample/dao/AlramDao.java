package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimAlram;

public interface AlramDao {

	List<MoimAlram> selectAlrams(String userId);
	
	void insertAlram(MoimAlram alram);
	
	void insertMessage(MoimAlram alram);
	
	void updateAlram(long alramNo);
	
	// 보낸쪽지함
	List<MoimAlram> getAllSendMessages(String userId);
	// 받은쪽지함
	List<MoimAlram> getAllReceiveMessages(String userId);
}
