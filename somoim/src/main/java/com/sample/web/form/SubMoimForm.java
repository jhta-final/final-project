package com.sample.web.form;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

public class SubMoimForm {

	@NotBlank(message = "제목을 입력해주세요.")
	private String title;
	
	@NotBlank(message = "지역을 선택해주세요.")
	private String location;
	
	@Min(message = "인원은 2~20명 까지입니다.", value = 2)
	@Max(message = "인원은 2~20명 까지입니다.", value = 20)
	private long headCount;
	
	private long fee;
	
	private Date joinDate;
	
	private String userId;
	
	private long moimNo;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public long getHeadCount() {
		return headCount;
	}

	public void setHeadCount(long headCount) {
		this.headCount = headCount;
	}

	public long getFee() {
		return fee;
	}

	public void setFee(long fee) {
		this.fee = fee;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getMoimNo() {
		return moimNo;
	}

	public void setMoimNo(long moimNo) {
		this.moimNo = moimNo;
	}
	
	
}
