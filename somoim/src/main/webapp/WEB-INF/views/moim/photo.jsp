<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
	.card{
		border: none;
	}
	.photo-card {
	 	width: 345px;
	 	height: 330px;
	 	margin: 8px;
	}	
	#photo-like:hover {
		cursor: pointer;
	}
	
	.fa-plus:hover {
		cursor: pointer;
	}
	.fa-plus {
		color: #007BFF;
	}
	
	.card-img-top {
		width: 343px;
		height: 250px;
	}	
	.card-body{
		padding: 8px;
	}
	.card-body p{
		display: inline-block;
		margin-bottom: 0px;
	}
	
</style>



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

	<div class="row">
		<div class="card mb-4 photo-card"">
			<img class="card-img-top" src="/resources/home_images/9.jpg"
				 alt="Card image cap">
			<div class="card-body">
				<div class="row">
					<p class="ml-2"><i id="photo-like" class="far fa-heart"></i>
						<span class="ml-3">55개</span>						
					</p>
				</div>
				<div class="row text-right">
					<div class="col-12">
						<span>고정원</span><span class="ml-4">2020.08.20</span>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4 photo-card"">
			<img class="card-img-top" src="/resources/home_images/9.jpg"
				 alt="Card image cap">
			<div class="card-body">
				<div class="row">
					<p class="ml-2"><i id="photo-like" class="far fa-heart"></i>
						<span class="ml-3">55개</span>						
					</p>
				</div>
				<div class="row text-right">
					<div class="col-12">
						<span>고정원</span><span class="ml-4">2020.08.20</span>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4 photo-card"">
			<img class="card-img-top" src="/resources/home_images/9.jpg"
				 alt="Card image cap">
			<div class="card-body">
				<div class="row">
					<p class="ml-2"><i id="photo-like" class="far fa-heart"></i>
						<span class="ml-3">55개</span>						
					</p>
				</div>
				<div class="row text-right">
					<div class="col-12">
						<span>고정원</span><span class="ml-4">2020.08.20</span>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4 photo-card"">
			<img class="card-img-top" src="/resources/home_images/9.jpg"
				 alt="Card image cap">
			<div class="card-body">
				<div class="row">
					<p class="ml-2"><i id="photo-like" class="far fa-heart"></i>
						<span class="ml-3">55개</span>						
					</p>
				</div>
				<div class="row text-right">
					<div class="col-12">
						<span>고정원</span><span class="ml-4">2020.08.20</span>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4 photo-card"">
			<img class="card-img-top" src="/resources/home_images/9.jpg"
				 alt="Card image cap">
			<div class="card-body">
				<div class="row">
					<p class="ml-2"><i id="photo-like" class="far fa-heart"></i>
						<span class="ml-3">55개</span>						
					</p>
				</div>
				<div class="row text-right">
					<div class="col-12">
						<span>고정원</span><span class="ml-4">2020.08.20</span>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4 photo-card"">
			<img class="card-img-top" src="/resources/home_images/9.jpg"
				 alt="Card image cap">
			<div class="card-body">
				<div class="row">
					<p class="ml-2"><i id="photo-like" class="far fa-heart"></i>
						<span class="ml-3">55개</span>						
					</p>
				</div>
				<div class="row text-right">
					<div class="col-12">
						<span>고정원</span><span class="ml-4">2020.08.20</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="photo-add">
		<div class="modal-dialog">
	    	<div class="modal-content">
	
		        <!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">사진 업로드</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="" method="post" enctype="multipart/form-data">
					<!-- Modal body -->
					<div class="modal-body">
						<img id="temp-img" width="300px" />
						<input id="img-file" type="file" name="imgFile" />
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<div class="text-right">
							<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">업로드</button>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 바로가기 키 -->
	<div style="position: fixed;bottom: 30px; right: 30px;">
		<i class="fas fa-2x fa-plus"></i>
		<a href="#"><i class="fas fa-2x fa-arrow-up"></i></a>
	</div>
	
</div>

<script>
	$(function () {
		$("#img-file").change(function (e) {
			readURL(this);
		});
	});

	function readURL(input) {
		
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$("#temp-img").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(".fa-plus").click(function () {
		console.log("show")
		$("#photo-add").modal("show");

	})
</script>










