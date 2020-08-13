<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!--Navbar -->

<div class="pos-f-t my-nav">
	<nav class="navbar navbar-dark fixed-top" style="background-color: #0F4C81; position: top">
		<div style="width: 20%;">
			<button class="navbar-toggler mr-3 nav-black">
				<span class="navbar-toggler-icon" id="sideMenu"></span>
			</button>
			<a class="navbar-brand" href="#"> <img
				src="https://mdbootstrap.com/img/logo/mdb-transparent.png"
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
					<div class="dropdown-menu dropdown-menu-right" style="width: 590px;">
						<span>
							<label>지역구</label>
							<input type="checkbox"> 강서구
							<input type="checkbox"> 양천구
							<input type="checkbox"> 구로구
							<input type="checkbox"> 금천구
							<input type="checkbox"> 영등포구
							<input type="checkbox"> 동작구
							<input type="checkbox"> 관악구
							<input type="checkbox"> 서초구
							<input type="checkbox"> 강남구
							<input type="checkbox"> 송파구
							<input type="checkbox"> 강동구
							<input type="checkbox"> 마포구
							<input type="checkbox"> 용산구
							<input type="checkbox"> 서대문구
							<input type="checkbox"> 은평구
							<input type="checkbox"> 종로구
							<input type="checkbox"> 중구
							<input type="checkbox"> 서초구
							<input type="checkbox"> 성동구
							<input type="checkbox"> 광진구
							<input type="checkbox"> 동대문구
							<input type="checkbox"> 성북구
							<input type="checkbox"> 강북구
							<input type="checkbox"> 도봉구
							<input type="checkbox"> 노원구
							<input type="checkbox"> 중랑구
						</span>
						<hr/>
						<span>
							<label>카테고리</label>
							<input type="checkbox"> 리그오브레전드
							<input type="checkbox"> 배틀그라운드
							<input type="checkbox"> 피파온라인4
							<input type="checkbox"> 싱글/연애
							<input type="checkbox"> 술/커피/차
							<input type="checkbox"> 맛집/미식회
							<input type="checkbox"> 축구/풋살
							<input type="checkbox"> 농구
							<input type="checkbox"> 스케이트/인라인
							<input type="checkbox"> 강아지
							<input type="checkbox"> 고양이
							<input type="checkbox"> 파충류
							<input type="checkbox"> 공연/연극
							<input type="checkbox"> 영화
							<input type="checkbox"> 파티/페스티벌
						</span>
						<hr/>
						<div class="text-right mr-3">
							<button class="btn btn-primary btn-sm" type="submit">상세검색</button>
							<button class="btn btn-outline-primary btn-sm" type="reset">리셋</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div>
			<a class="nav-link" id="navbarDropdownMenuLink-22" data-toggle="dropdown"
	          aria-haspopup="true" aria-expanded="false">
	          <img src="/resources/bootstrap/nav_images/bell.png" class=""
	            alt="" height="35">
	        </a>
	        <div class="dropdown-menu dropdown-menu">
	          <a class="dropdown-item" href="#">프로필 수정</a>
	          <a class="dropdown-item" href="#">쪽지함</a>
	          <a class="dropdown-item" href="#">로그아웃</a>
			</div>
		</div>
		<div class="dropdown">
	        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-55" data-toggle="dropdown"
	          aria-haspopup="true" aria-expanded="false">
	          <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-2.jpg" class="rounded-circle z-depth-0"
	            alt="avatar image" height="35">
	        </a>
			<div class="dropdown-menu dropdown-menu-right">
	          <a class="dropdown-item" href="#">프로필 수정</a>
	          <a class="dropdown-item" href="#">쪽지함</a>
	          <a class="dropdown-item" href="#">로그아웃</a>
			</div>
		</div>
	</nav>
</div>
<!--/.Navbar -->
