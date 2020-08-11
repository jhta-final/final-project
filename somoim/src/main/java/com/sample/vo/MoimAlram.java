package com.sample.vo;

public class MoimAlram {

	private long alramNo;
	private String message;
	private String type;
	private String readYn;
	private String userId;
	
	public MoimAlram() {}

	public long getAlramNo() {
		return alramNo;
	}
	
	public void setAlramNo(long alramNo) {
		this.alramNo = alramNo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReadYn() {
		return readYn;
	}

	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
