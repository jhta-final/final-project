package com.sample.dto;

import java.util.List;

public class DetailViewMoimsDto {

	private MoimMainDto moimMainDto;
	private List<JoinUsers> joinUsers;
	
	public DetailViewMoimsDto(MoimMainDto moimMainDto, List<JoinUsers> joinUsers) {
		this.moimMainDto = moimMainDto;
		this.joinUsers = joinUsers;
	}
	public MoimMainDto getMoimMainDto() {
		return moimMainDto;
	}
	public void setMoimMainDto(MoimMainDto moimMainDto) {
		this.moimMainDto = moimMainDto;
	}
	public List<JoinUsers> getJoinUsers() {
		return joinUsers;
	}
	public void setJoinUsers(List<JoinUsers> joinUsers) {
		this.joinUsers = joinUsers;
	}	
}
