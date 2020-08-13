<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.myimage {
	width: 100px;
	height: 100px;
}

.smallimage {
	width: 50px;
	height: 50px;
}
</style>
<div class="ml-5 mt-3">
	<img src="/resources/home_images/2.jpg"
		class="rounded-circle myimage mr-3" alt="Cinque Terre"> <span
		style="font-size: large; font-weight: bold;">권영준</span>
</div>
<div class="row mt-3" style="width: 95%">
	<div class="col-12">
		<nav class="navbar">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active" href="#">소개</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#" id="a">가입모임</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">사진첩</a></li>
				<li class="nav-item"><a class="nav-link" href="#">내후기</a></li>
			</ul>
		</nav>
	</div>
</div>
<div class="row"
	style="background-color: rgba(211, 211, 211, 0.4); height: 500px;">
	<div class="col-9">
		<div id="mypage-body">
			<div>
				닉네임
				<p>${LOGIN_USER.nickname }</p>
			</div>
			<div>이름</div>
			<div>전화번호</div>
			<div>생년월일</div>
			<div>이메일</div>
			<div>지역</div>
			<div>자기소개</div>
			<div>가입일</div>
			<div>팔로워수</div>
			<div>관심지역</div>
			<div>
				<button type="button" class="btn btn-info">수정</button>
			</div>
		</div>
	</div>
	<div class="col-3">
		<div style="padding: 30px;">
			<div class="text-center">내 친구</div>
			<c:forEach items="${followers }" var="follower">
				<div class="mb-3">
					<img src="/resources/home_images/3.png"
						class="rounded-circle smallimage mr-3" alt="Cinque Terre"> <span
						style="font-size: 15px; font-weight: bold;">${follower.folUserId }</span>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	$(function() {
		$("#a").click(function() {
			$.ajax({
				type : "GET",
				url : "/mypage/usermoim.do",
				dataType : "json",
				success : function(status) {
					console.log(status);
				}
			})
		})
	})
</script>