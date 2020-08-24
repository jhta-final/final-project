package com.sample.service;

import java.util.List;

import com.sample.vo.MoimPhoto;

public interface PhotoService {

	void addNewPhoto(MoimPhoto moimPhoto);
	List<MoimPhoto> getPhotosByNo(long moimNo);
}
