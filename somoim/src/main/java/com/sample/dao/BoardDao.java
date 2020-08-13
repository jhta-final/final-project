package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimBoard;

public interface BoardDao {

	void insertMoimBoard(MoimBoard moimBoard);
	void updateMoimBoard(MoimBoard moimBoard);
	List<MoimBoard> selectMoimBoards(long moimNo);
	MoimBoard selectMoimBoard(long moimNo);
	List<MoimBoard> getBoardsByUserId(String userId);
}
