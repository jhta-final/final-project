package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimWarning;

public interface WarningDao {

	List<MoimWarning> getAllWarnings();
	void insertWarning(MoimWarning warning);
	void updateWarning(long warningNo);
}
