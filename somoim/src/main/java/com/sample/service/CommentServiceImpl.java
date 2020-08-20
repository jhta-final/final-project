package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.CommentDao;
import com.sample.vo.MoimComment;

@Service
@Transactional
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDao commentDao;
	
	@Override
	public List<MoimComment> getCommentsByNo(long boardNo) {		
		return commentDao.getCommentsByNo(boardNo);
	}

	@Override
	public void insertComment(MoimComment moimComment) {
		System.out.println(moimComment.toString());
		commentDao.insertComment(moimComment);
	}

}
