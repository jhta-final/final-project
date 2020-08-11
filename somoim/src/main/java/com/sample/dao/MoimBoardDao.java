package com.sample.dao;

import java.util.List;

public interface MoimBoardDao {

	void insertMoimBoard(MoimBoardDao moimBoard);
	void updateMoimBoard(MoimBoardDao moimBoard);
	void deleteMoimBoard(long no);
	List<MoimBoardDao> getAllMoimBoards();
	MoimBoardDao getMoimBoardByNo(long no);
}
