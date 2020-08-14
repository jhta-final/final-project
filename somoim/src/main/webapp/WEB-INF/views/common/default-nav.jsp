<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!--Navbar -->
<div class="my-nav">
	<nav class="navbar navbar-dark" style="background-color: #FFFFF0;">
		<div style="width: 20%;">
			<button class="navbar-toggler mr-3 nav-white">
				<span class="navbar-toggler-icon" style="color: lightgray ;background-color: lightgray;" id="sideMenu"></span>
			</button>
			<a class="navbar-brand" href="/home.do" style="color: black"> <img
				src="/resources/home_images/logo_1.png"
				height="30" class="d-inline-block align-top" alt="mdb logo">
				somoim
			</a>
		</div>
		<div style="width: 40%;">
			<form class="form-inline my-1">
				<div class="md-form form-sm my-0">
					<input class="form-control form-control-sm" style="width: 500px;"
						type="text" placeholder="Search" aria-label="Search">
				</div>
				<button class="btn btn-outline-primary btn-sm ml-1 my-0"
					type="submit">Search</button>
				<div class="dropdown">
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle"
						data-toggle="dropdown"></button>
					<div class="dropdown-menu dropdown-menu-right" style="width: 595px;">
						<select name="location" style="width: 500px;">
						    <option value=""selected="selected" disabled="disabled" class="text-center">지역</option>
						    <option value="종로구">종로구</option>
						    <option value="성동구">성동구</option>
						    <option value="강남구">강남구</option>
						    <option value="송파구">송파구</option>
						</select>
						<select name="location" style="width: 500px;" class="text-center">
						    <option value=""selected="selected" disabled="disabled">카테고리</option>
							<optgroup label="게임">
							<option value="종로구"> 리그오브레전드</option>
							<option value="종로구"> 배틀그라운드</option>
							<option value="종로구"> 피파온라인4</option>
							</optgroup>
							<optgroup label="스포츠">
							<option value="종로구"> 축구/풋살</option>
							<option value="종로구"> 농구</option>
							<option value="종로구"> 스케이트/인라인</option>
							</optgroup>
						</select>

						<div class="text-right mr-3">
							<button class="btn btn-primary btn-sm" type="submit">상세검색</button>
							<button class="btn btn-outline-primary btn-sm" type="reset">리셋</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="dropdown">
		
			<a class="nav-link" id="navbarDropdownMenuLink-33" data-toggle="dropdown"
	          aria-haspopup="true" aria-expanded="false">
	          <i class="fas fa-bell fa-2x" style="color: lightgray;"></i>
	        </a>
	        <div class="dropdown-menu dropdown-menu-right">
	          <a class="dropdown-item" href="#">알람</a>
	          <a class="dropdown-item" href="#">경고:어쩌고 저쩌고</a>
	          <a class="dropdown-item" href="#">친구:홍길동님이 팔로우 하셧습니다.</a>
			</div>
		</div>
		<div class="dropdown">
	        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-55" data-toggle="dropdown"
	          aria-haspopup="true" aria-expanded="false">
	          <img src="/resources/home_images/11.png" class="rounded-circle z-depth-0"
	            alt="avatar image" height="35" width="35">
	        </a>
			<div class="dropdown-menu dropdown-menu-right">
	          <a class="dropdown-item" href="/mypage/mypage.do">my page</a>
	          <a class="dropdown-item" href="#">프로필 수정</a>
	          <a class="dropdown-item" href="#">쪽지함</a>
	          <a class="dropdown-item" href="/signout.do">로그아웃</a>
			</div>
		</div>
	</nav>
</div>
<!--/.Navbar -->
