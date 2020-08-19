package com.sample.vo;

import java.util.Date;

public class MoimFavoriteMoim {

	private long moimNo;
	private String userId;
	private Date likedDate;
	
	
	
	public Date getLikedDate() {
		return likedDate;
	}

	public void setLikedDate(Date likedDate) {
		this.likedDate = likedDate;
	}

	public MoimFavoriteMoim() {}

	public long getMoimNo() {
		return moimNo;
	}

	public void setMoimNo(long moimNo) {
		this.moimNo = moimNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
