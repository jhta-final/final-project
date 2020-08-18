package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.WarningDao;
import com.sample.vo.MoimWarning;

@Service
@Transactional
public class WarningServiceImpl implements WarningService {

	@Autowired
	WarningDao warningDao;
	
	@Override
	public void addWarning(MoimWarning warning) {
		warningDao.insertWarning(warning);
		
	}
	@Override
	public List<MoimWarning> allWarnings() {
		return warningDao.getAllWarnings();
	}
	@Override
	public void deleteWarning(long warningNo) {
		warningDao.updateWarning(warningNo);
		
	}
	
}
