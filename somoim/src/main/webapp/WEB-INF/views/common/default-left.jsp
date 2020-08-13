<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style>
/* The side navigation menu */
.sidenav {
	height: 100%; /* 100% Full-height */
	width: 250px; /* 0 width - change this with JavaScript */
	position: fixed; /* Stay in place */
	z-index: 1; /* Stay on top */
	top: 0;
	left: 0px;
	background-color: #FFFFF0; /* Black*/
	overflow-x: hidden; /* Disable horizontal scroll */
	padding-top: 60px; /* Place content 60px from the top */
	transition: 0.2s;
	/* 0.5 second transition effect to slide in the sidenav */
	margin-top: 55px;
}

/* The navigation menu links */
.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 20px;
	color: aqua;
	display: block;
	transition: 0.2s;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
	color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#content {
	transition: margin-left .1s;
	padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>

<div id="mySidenav" class="sidenav">
	<a class="active" href="javascript:void(0)">home</a>
	<a href="#">인기</a>
	<a href="#">카테고리</a>
	<hr />
	<a href="#">가입 모임</a>
	<a href="#"><i class="far fa-heart"></i>모임</a>
	<a href="#">내 친구</a>
	<a href="#">
		<span class="nav-item avatar"> <img
				src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
				class="rounded-circle z-depth-0" alt="avatar image" height="35">
		박재형</span>
	</a>
	<a href="#">
		<span class="nav-item avatar"> <img
				src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
				class="rounded-circle z-depth-0" alt="avatar image" height="35">
		장주리</span>
	</a>
	<a href="#">
		<span class="nav-item avatar"> <img
				src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
				class="rounded-circle z-depth-0" alt="avatar image" height="35">
		김민수</span>
	</a>
	<hr />
	<div class="" id="footer">
	자주하는 질문
	help@friendscube.com
	홈서비스
	 소개언론/미디어블로그
	 고객센터
	 웹사이트소통공간서비스
	  이용약관개인정보
	   취급방침
	   ⓒ Friendscube
	</div>
</div>

