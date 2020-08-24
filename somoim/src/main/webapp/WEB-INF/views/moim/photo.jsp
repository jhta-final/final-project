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
		<c:forEach var="photo" items="${photos }">
			<div class="card mb-4 photo-card">
				<img class="card-img-top" src="/resources/moim_photo/${photo.photo }"
					 alt="Card image cap">
				<div class="card-body">
					<div class="row">
						<p class="ml-2">
						<c:set var="heart" value="emp"/>
							<c:forEach var="like" items="${photolikes }">
								<c:if test="${like.photoNo eq photo.photoNo }">
									<c:set var="heart" value="full"/>
								</c:if>
							</c:forEach>
							<c:choose>
								<c:when test="${heart eq 'emp' }">
									<i id="photo-like" class="far fa-heart"></i>
								</c:when>
								<c:otherwise>
									<i id="photo-like" class="fas fa-heart"></i>
								</c:otherwise>
							</c:choose>
							<span class="ml-3">${photo.likes }개</span>						
						</p>
					</div>
					<div class="row text-right">
						<div class="col-12">
							<span>${photo.userId }</span><span class="ml-4"><fmt:formatDate value="${photo.createdDate }"/> </span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>

	<div class="modal" id="photo-add">
		<div class="modal-dialog">
	    	<div class="modal-content">
	
		        <!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">사진 업로드</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form:form action="photoAdd.do" method="post" enctype="multipart/form-data" modelAttribute="photoForm">
					<!-- Modal body -->
					<div class="modal-body">
						<img id="temp-img" width="300px" />
						<form:input id="img-file" type="file" path="upfile" />
					</div>
					<form:input type="text" hidden="hidden" value="${param.moimNo}" path="moimNo" />
					<form:input type="text" hidden="hidden" value="${LOGIN_USER.id}" path="userId" />
					<!-- Modal footer -->
					<div class="modal-footer">
						<div class="text-right">
							<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">업로드</button>
						</div>

					</div>
				</form:form>
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
		$("#photo-add").modal("show");

	})
	
	function addLike() {

	}
	
	function delLike() {

	}
</script>










