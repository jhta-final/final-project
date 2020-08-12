package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimSubJoinUser;
import com.sample.vo.MoimSubMoim;

public interface SubMoimDao {

	void insertSubMoim(MoimSubMoim moimSubMoim);
	List<MoimSubMoim> selectSubMoims(long moimNo);
	MoimSubMoim selectSubMoim(long subMoimNo);
	void updateSubMoim(MoimSubMoim moimSubMoim);
	
	void insertSubJoinUser(MoimSubJoinUser moimSubJoinUser);
	List<MoimSubJoinUser>selectSubJoinUsers(long subMoimNo);
	void deleteSubJoinUser(MoimSubJoinUser moimSubJoinUser);
}
