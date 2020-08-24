package com.sample.service;

import java.util.List;

import com.sample.vo.MoimPhoto;
import com.sample.vo.MoimPhotoLikes;

public interface PhotoService {

	void addNewPhoto(MoimPhoto moimPhoto);
	List<MoimPhoto> getPhotosByNo(long moimNo);
	List<MoimPhotoLikes> getLikes(MoimPhotoLikes photoLikes);
	
	void addLike(MoimPhotoLikes photoLikes);
	void delLike(MoimPhotoLikes photoLikes);
}
