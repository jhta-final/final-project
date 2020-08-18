package com.sample.dto;

public class MoimFriends {

	private long moimNo;
	private String userId;
	
	public MoimFriends() {}
	
	public MoimFriends(long moimNo, String userId) {
		this.moimNo = moimNo;
		this.userId = userId;
	}

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
