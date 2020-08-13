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
	
}
