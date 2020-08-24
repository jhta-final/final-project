package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.PhotoDao;
import com.sample.vo.MoimPhoto;

@Service
@Transactional
public class PhotoServiceImpl implements PhotoService {

	@Autowired
	PhotoDao photoDao;
	
	@Override
	public void addNewPhoto(MoimPhoto moimPhoto) {
		photoDao.insertPhoto(moimPhoto);
	}

	@Override
	public List<MoimPhoto> getPhotosByNo(long moimNo) {
		return photoDao.selectPhotos(moimNo);
	}

}
