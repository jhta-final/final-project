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

.card{
	width: 200px;
	height: 200px;
}

</style>
<div class="ml-5 mt-3">
	<img src="/resources/home_images/2.jpg" class="rounded-circle myimage mr-3" alt="Cinque Terre"> <span
		style="font-size: large; font-weight: bold;">${LOGIN_USER.nickname }</span>
</div>
<div class="row mt-3" style="width: 95%">
	<div class="col-12">
		<nav class="navbar">
			<ul class="nav nav-tabs" id="mypage-nav">
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
<div class="row" style="background-color: rgba(211, 211, 211, 0.4); height: 500px;">
	<div class="col-9">
		<div id="mypage-body">
			<div id="mypage-body-info">
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
	</div>
	<div class="col-3">
		<div style="padding: 30px;">
			<div class="text-center">내 친구</div>
			<c:forEach items="${followers }" var="follower">
				<div class="mb-3">
					<img src="/resources/home_images/3.png" class="rounded-circle smallimage mr-3" alt="Cinque Terre"> <span
						style="font-size: 15px; font-weight: bold;">${follower.nickname }</span>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	// 가입모임 데이터 가져오는 AJAX
	$(function () {
		var $mypageBody = $("#mypage-body");
		$("#a").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/usermoim.do",
				dataType: "json",
				success: function (moims) {
					$.each(moims, function (index, moim) {
						var tr = "<div class='card'>";
						tr += "<a href='/moim/moim.do?moimNo=${moim.moimNo}'>";
						tr += "<img class='card-img-top' src='/resources/home_images/9.jpg' alt='Card image cap'>";
						tr += "<div class='card-body'>";
						tr += "<h5 class='card-title'><c:out value='${moim.title }'/></h5>"
						tr += "<p class='card-text'>${moim.content }</p>";
						tr += "</div><div class='card-footer'>";
						tr += "<small class='text-muted'>${moim.createdDate}</small>";
						tr += "</div></a></div>";

						$mypageBody.append(tr);
					})
				}
			})
		})
		$("#mypage-nav .nav-link").click(function () {
			$("#mypage-nav .nav-link").removeClass('active');
			$(this).addClass('active');
		})
	})
</script>