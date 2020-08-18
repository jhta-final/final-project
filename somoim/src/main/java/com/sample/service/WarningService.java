package com.sample.service;

import java.util.List;

import com.sample.vo.MoimWarning;

public interface WarningService {

	List<MoimWarning> allWarnings();
	void addWarning(MoimWarning warning);
	void deleteWarning(long warningNo);
}
