package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.BoardDao;
import com.sample.vo.MoimBoard;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	// 새 게시글 추가
	@Override
	public void addNewBoard(MoimBoard moimBoard) {
		boardDao.insertMoimBoard(moimBoard);
	}

	// 모임 내의 전체 게시글 조회
	@Override
	public List<MoimBoard> getAllBoards(long moimNo) {
		return boardDao.selectMoimBoards(moimNo);
	}

	// 게시글 상세 조회
	@Override
	public MoimBoard getBoardByNo(long boardNo) {
		increaseBoardLikes(boardNo);
		return boardDao.selectMoimBoard(boardNo);
	}

	// 게시글 수정
	@Override
	public void modifyBoard(MoimBoard moimBoard) {
		MoimBoard savedBoard = boardDao.selectMoimBoard(moimBoard.getBoardNo());
		if(savedBoard == null) {
			System.out.println("해당 게시글이 존재하지 않습니다.");
			return;
		}
		
		savedBoard.setTitle(moimBoard.getTitle());
		savedBoard.setContent(moimBoard.getContent());
		savedBoard.setBoardCateNo(moimBoard.getBoardCateNo());
		
		boardDao.updateMoimBoard(savedBoard);
	}

	// 게시글 삭제
	@Override
	public void deleteBoard(long boardNo) {
		MoimBoard savedBoard = boardDao.selectMoimBoard(boardNo);
		if(savedBoard == null) {
			System.out.println("해당 게시글이 존재하지 않습니다.");
			return;
		}
		
		savedBoard.setDeleteYn("Y");
		
		boardDao.updateMoimBoard(savedBoard);
	}

	// 게시글 조회수 증가
	@Override
	public void increaseBoardLikes(long boardNo) {
		MoimBoard savedBoard = boardDao.selectMoimBoard(boardNo);
		if(savedBoard == null) {
			System.out.println("해당 게시글이 존재하지 않습니다.");
			return;
		}
		
		savedBoard.setViews(savedBoard.getViews() + 1);
		
		boardDao.updateMoimBoard(savedBoard);
	}

	@Override
	public List<MoimBoard> getBoardsByCategory(MoimBoard moimBoard) {
		return boardDao.getBoardsByCategory(moimBoard);
	}

	@Override
	public List<MoimBoard> getRecentBoardsByNotice(long moimNo) {
		return boardDao.getRecentBoardsByNotice(moimNo);
	}

}
