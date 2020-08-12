package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimBoard;

public interface MoimBoardDao {

	void insertMoimBoard(MoimBoardDao moimBoard);
	void updateMoimBoard(MoimBoardDao moimBoard);
	void deleteMoimBoard(long no);
	List<MoimBoard> getAllMoimBoards(long moimNo);
	MoimBoard getMoimBoardByNo(long no);
}
