package com.sample.dto;

import java.util.Date;

public class MoimJoinUserMoimDto {

		// moim_join_user
		private long moimNo;
		private String userId;
		private String userRole;
		private Date createdDate;
		
		// moim_main
		private String title;
		private String image;
		private String content;
		
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
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		
}
