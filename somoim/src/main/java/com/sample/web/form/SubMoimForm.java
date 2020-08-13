package com.sample.web.form;

import java.util.Date;

import javax.validation.constraints.NotBlank;

public class SubMoimForm {

	@NotBlank(message = "제목을 입력해주세요.")
	private String title;
	
	@NotBlank(message = "지역을 선택해주세요.")
	private String location;
	
	@NotBlank(message = "인원을 입력해주세요.")
	private long headCount;
	
	private long fee;
	
	private Date joinDate;
	
	private String userId;
	
	private long moimNo;
}
