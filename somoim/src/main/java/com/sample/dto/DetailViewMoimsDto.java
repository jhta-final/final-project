package com.sample.dto;

import java.util.Date;

public class DetailViewMoimsDto {

	// moim_main
	private long moimNo;
	private String title;
	private String userId;
	private long joinCount;
	private long headCount;
	private String content;
	private String image;
	private long fee;
	private long likes;
	private String premiumYn;
	private String deleteYn; 
	private Date joinDate;
	private Date createdDate;
	private long subCateNo;
	private String subCateName;
	private long locationNo;
	private String locationName;
	private long mainCateNo;
	private String mainCateName;
	
	// moim_user
	private	String nickName;
	
	// moim_join_user
	private String joinedUserId;
	private String userRole;
	private Date joinedDate;
	
	
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getJoinCount() {
		return joinCount;
	}
	public void setJoinCount(long joinCount) {
		this.joinCount = joinCount;
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
	public long getLikes() {
		return likes;
	}
	public void setLikes(long likes) {
		this.likes = likes;
	}
	public String getPremiumYn() {
		return premiumYn;
	}
	public void setPremiumYn(String premiumYn) {
		this.premiumYn = premiumYn;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public long getSubCateNo() {
		return subCateNo;
	}
	public void setSubCateNo(long subCateNo) {
		this.subCateNo = subCateNo;
	}
	public String getSubCateName() {
		return subCateName;
	}
	public void setSubCateName(String subCateName) {
		this.subCateName = subCateName;
	}
	public long getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(long locationNo) {
		this.locationNo = locationNo;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public long getMainCateNo() {
		return mainCateNo;
	}
	public void setMainCateNo(long mainCateNo) {
		this.mainCateNo = mainCateNo;
	}
	public String getMainCateName() {
		return mainCateName;
	}
	public void setMainCateName(String mainCateName) {
		this.mainCateName = mainCateName;
	}
	public String getJoinedUserId() {
		return joinedUserId;
	}
	public void setJoinedUserId(String joinedUserId) {
		this.joinedUserId = joinedUserId;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public Date getJoinedDate() {
		return joinedDate;
	}
	public void setJoinedDate(Date joinedDate) {
		this.joinedDate = joinedDate;
	}


}
