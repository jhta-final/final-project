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

	.card {
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
				<li class="nav-item"><a class="nav-link active" href="#" id="mypage-info">소개</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#" id="mypage-mymoim">가입모임</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#" id="mypage-images">사진첩</a></li>
				<li class="nav-item"><a class="nav-link" href="#" id="mypage-board">내후기</a></li>
			</ul>
		</nav>
	</div>
</div>
<div class="row" style="background-color: rgba(211, 211, 211, 0.4); height: 500px;">
	<div class="col-9">
		<div id="mypage-body">

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
		
		var mypageInfo = "<div>";
		mypageInfo += "닉네임";
		mypageInfo += "<p>${LOGIN_USER.nickname }</p>"
			mypageInfo += "<div>이름</div>"
				mypageInfo += "<div>전화번호</div>"
					mypageInfo += "<div>생년월일</div>"
						mypageInfo += "<div>이메일</div>"
							mypageInfo += "<div>지역</div>";

		$mypageBody.append(mypageInfo);

		$("#mypage-nav .nav-link").click(function () {
			$("#mypage-nav .nav-link").removeClass('active');
			$(this).addClass('active');
			$mypageBody.empty();
		})
		
		$("#mypage-info").click(function() {
			$mypageBody.append(mypageInfo);
		})
		$("#mypage-mymoim").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/usermoim.do",
				dataType: "json",
				success: function (moims) {
					$.each(moims, function (index, moim) {
						var tr = "<div class='card'>";
						tr += "<a href='/moim/moim.do?moimNo="+moim.moimNo+"'>";
						tr +=
							"<img class='card-img-top' src='/resources/home_images/9.jpg' alt='Card image cap'>";
						tr += "<div class='card-body'>";
						tr += "<h5 class='card-title'>"+moim.title+"</h5>"
						tr += "<p class='card-text'>"+moim.content+"</p>";
						tr += "</div><div class='card-footer'>";
						tr += "<small class='text-muted'>"+moim.createdDate+"</small>";
						tr += "</div></a></div>";

						$mypageBody.append(tr);
					})
				}
			})
		})
		
		$("#mypage-images").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/photo.do",
				dataType: "json",
				success: function (images) {
					$.each(images, function (index, image) {
						if(images.length==0){
							var empty = "<div><p>내가쓴 글이 존재하지않습니다.</p></div>";
							$mypageBody.append(empty);
						} else{
						var tr = "<div class='card'>";
						tr += "<a href='/moim/moim.do?moimNo=${moim.moimNo}'>";
						tr +=
							"<img class='card-img-top' src='/resources/home_images/9.jpg' alt='Card image cap'>";
						tr += "<div class='card-body'>";
						tr += "<h5 class='card-title'><c:out value='${moim.title }'/></h5>"
						tr += "<p class='card-text'>${moim.content }</p>";
						tr += "</div><div class='card-footer'>";
						tr += "<small class='text-muted'>${moim.createdDate}</small>";
						tr += "</div></a></div>";

						$mypageBody.append(tr);
							
						}
					})
				}
			})
		})
		$("#mypage-board").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/board.do",
				dataType: "json",
				success: function (boards) {
					$.each(boards, function (index, board) {
						if(boards.length==0){
							var empty = "<div><table class='table'><tr><th>내가쓴 글이 존재하지않습니다.</th></tr></table></div>";
							$mypageBody.append(empty);
						} else{
						var tr = "<div class='card'>";
						tr += "<a href='/moim/moim.do?moimNo=${moim.moimNo}'>";
						tr +=
							"<img class='card-img-top' src='/resources/home_images/9.jpg' alt='Card image cap'>";
						tr += "<div class='card-body'>";
						tr += "<h5 class='card-title'><c:out value='${moim.title }'/></h5>"
						tr += "<p class='card-text'>${moim.content }</p>";
						tr += "</div><div class='card-footer'>";
						tr += "<small class='text-muted'>${moim.createdDate}</small>";
						tr += "</div></a></div>";

						$mypageBody.append(tr);
							
						}
					})
				}
			})
		})
	})
</script>