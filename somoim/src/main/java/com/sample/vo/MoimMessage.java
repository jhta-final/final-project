package com.sample.vo;

import java.util.Date;

public class MoimMessage {

	private long messageNo;
	private String toUser;
	private String fromUser;
	private String title;
	private String content;
	private Date createdDate;
	
	public long getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(long messageNo) {
		this.messageNo = messageNo;
	}

	public String getToUser() {
		return toUser;
	}
	
	public void setToUser(String toUser) {
		this.toUser = toUser;
	}
	public String getFromUser() {
		return fromUser;
	}
	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	
	
	
}
