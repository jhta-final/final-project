package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimSubJoinUser;
import com.sample.vo.MoimSubMoim;

public interface SubMoimDao {

	void insertSubMoim(MoimSubMoim moimSubMoim);
	List<MoimSubMoim> getAllSubMoims(long moimNo);
	MoimSubMoim getSubMoimByNo(long subMoimNo);
	void updateSubMoim(MoimSubMoim moimSubMoim);
	void deleteSubMoim(long subMoimNo);
	
	void insertSubJoinUser(MoimSubJoinUser moimSubJoinUser);
	List<MoimSubJoinUser> getSubMoimJoinUsersBySubMoimNo(long subMoimNo);
	void deleteSubJoinUser(MoimSubJoinUser moimSubJoinUser);
}
