package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimComment;

public interface CommentDao {

	// 코멘트 전체 가져오기
	List<MoimComment> getCommentsByNo(long boardNo);
	
	// 코멘트 등록
	void insertComment(MoimComment moimComment);
}