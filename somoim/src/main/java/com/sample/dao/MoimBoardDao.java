package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimBoard;

public interface MoimBoardDao {

	void insertMoimBoard(MoimBoardDao moimBoard);
	void updateMoimBoard(MoimBoardDao moimBoard);
	List<MoimBoard> selectMoimBoards(long moimNo);
	MoimBoard selectMoimBoard(long no);
}
