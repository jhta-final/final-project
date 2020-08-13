package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimPhoto;

public interface PhotoDao {

	void insertPhoto(MoimPhoto moimPhoto);
	List<MoimPhoto> selectPhotos(long moimNo);
	MoimPhoto selectPhoto(long photoNo);
	void updatePhoto(MoimPhoto moimPhoto);
	List<MoimPhoto> getPhotosByUserId(String userId);
}
