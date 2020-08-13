package com.sample.dto;

import java.util.Date;

public class MoimJoinUserDto {

<<<<<<< HEAD
	// moim_join_user
=======
>>>>>>> 0bc5109f14b322cd95e95a5e2e83ea72be45b4f8
	private long moimNo;
	private String userId;
	private String userRole;
	private Date createdDate;
<<<<<<< HEAD
	
	// moim_main
	private String title;
	private String image;
	
=======
	private String userName;
	private String nickname;
>>>>>>> 0bc5109f14b322cd95e95a5e2e83ea72be45b4f8
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
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
<<<<<<< HEAD
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
=======
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
>>>>>>> 0bc5109f14b322cd95e95a5e2e83ea72be45b4f8
	}
	
	
}
