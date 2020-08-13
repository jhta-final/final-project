package com.sample.web.form;

import java.util.Date;

import javax.validation.constraints.NotBlank;

public class MoimForm {

	private long moimNo;
	
	@NotBlank(message = "제목을 입력해주세요.")
	private String title;
	
	@NotBlank(message = "인원을 입력해주세요.")
	private long headCount;
	
	@NotBlank(message = "내용을 입력해주세요.")
	private String content;
	
	@NotBlank(message = "사진을 등록해주세요.")
	private String image;
	
	private long fee;
	
	@NotBlank(message = "모임 날짜를 등록해주세요.")
	private Date joinDate;
	
	@NotBlank(message = "카테고리를 선택해주세요.")
	private long subCateNo;
	
	@NotBlank(message = "지역을 선택해주세요.")
	private long locationNo;

	public long getMoimNo() {
		return moimNo;
	}

	public void setMoimNo(long moimNo) {
		this.moimNo = moimNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public long getHeadCount() {
		return headCount;
	}

	public void setHeadCount(long headCount) {
		this.headCount = headCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public long getSubCateNo() {
		return subCateNo;
	}

	public void setSubCateNo(long subCateNo) {
		this.subCateNo = subCateNo;
	}

	public long getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(long locationNo) {
		this.locationNo = locationNo;
	}
	
	
	
}
