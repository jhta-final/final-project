package com.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.PhotoDao;
import com.sample.vo.MoimPhoto;
import com.sample.vo.MoimPhotoLikes;

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

	@Override
	public List<MoimPhotoLikes> getLikes(MoimPhotoLikes photoLikes) {
		return photoDao.getPhotoLikesByUserId(photoLikes);
	}

	@Override
	public void addLike(MoimPhotoLikes photoLikes) {
		MoimPhoto photo = photoDao.selectPhoto(photoLikes.getPhotoNo());
		photo.setLikes(photo.getLikes() + 1);
		photoDao.updatePhoto(photo);
		
		photoDao.insertLike(photoLikes);
	}

	@Override
	public void delLike(MoimPhotoLikes photoLikes) {
		MoimPhoto photo = photoDao.selectPhoto(photoLikes.getPhotoNo());
		photo.setLikes(photo.getLikes() - 1);
		photoDao.updatePhoto(photo);
		
		photoDao.deleteLike(photoLikes);
	}
	

}
