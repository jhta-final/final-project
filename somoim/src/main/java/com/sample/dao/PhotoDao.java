package com.sample.dao;

import java.util.List;

import com.sample.vo.MoimPhoto;
import com.sample.vo.MoimPhotoLikes;

public interface PhotoDao {

	void insertPhoto(MoimPhoto moimPhoto);
	List<MoimPhoto> selectPhotos(long moimNo);
	MoimPhoto selectPhoto(long photoNo);
	void updatePhoto(MoimPhoto moimPhoto);
	List<MoimPhoto> getPhotosByUserId(String userId);
	
	List<MoimPhotoLikes> getPhotoLikesByUserId(MoimPhotoLikes moimPhotoLikes);
	void insertLike(MoimPhotoLikes moimPhotoLikes);
	void deleteLike(MoimPhotoLikes moimPhotoLikes);
}
