package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimPhoto;

public interface PhotoDao {

	void insertPhoto(MoimPhoto moimPhoto);
	List<MoimPhoto> getAllPhotos();
	MoimPhoto getPhotoByNo(long photoNo);
	void updatePhoto(MoimPhoto moimPhoto);
	void deletePhoto(long photoNo);
}
