<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div>
	<div class="row mt-3" style="width: 95%">
		<div class="col-12">
			<img src="/resources/moim_images/longboard.jpg" width="100%" />
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-12">
			<h3>${moim.title}</h3>
		</div>
	</div>
	<div class="row mt-3" style="width: 95%">
		<div class="col-12">
			<nav class="navbar">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" href="moim.do?moimNo=${param.moimNo}">정보</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="board.do?moimNo=${param.moimNo}&pageNo=1">게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="photo.do?moimNo=${param.moimNo}">사진첩</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">채팅</a>
					</li>
					<li class="nav-item justify-content-right">
						<a class="nav-link" href="#">탈퇴</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>

	<div class="card mb-4 home-card"">
		<img class="card-img-top" src="/resources/home_images/9.jpg"
			 alt="Card image cap">
		<div class="card-body">
			<h5 class="card-title">
				<c:out value="${'타이틀 '}" />
				<p class="ml-5" style="float: right"><span class="mr-3">1/6</span> <i class="far fa-heart"></i></p>
			</h5>
			<div class="text-right">
				<small class="text-muted">2020.08.21</small>
			</div>
		</div>
	</div>
	<div class="card mb-4 home-card"">
		<img class="card-img-top" src="/resources/home_images/9.jpg"
			 alt="Card image cap">
		<div class="card-body">
			<h5 class="card-title">
				<c:out value="${'타이틀 '}" />
				<p class="ml-5" style="float: right"><span class="mr-3">1/6</span> <i class="far fa-heart"></i></p>
			</h5>
			<div class="text-right">
				<small class="text-muted">2020.08.21</small>
			</div>
		</div>
	</div>
	<div class="card mb-4 home-card"">
		<img class="card-img-top" src="/resources/home_images/9.jpg"
			 alt="Card image cap">
		<div class="card-body">
			<h5 class="card-title">
				<c:out value="${'타이틀 '}" />
				<p class="ml-5" style="float: right"><span class="mr-3">1/6</span> <i class="far fa-heart"></i></p>
			</h5>
			<div class="text-right">
				<small class="text-muted">2020.08.21</small>
			</div>
		</div>
	</div>
</div>