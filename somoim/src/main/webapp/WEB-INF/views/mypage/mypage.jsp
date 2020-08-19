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
	<img src="/resources/profileImage/${LOGIN_USER.profileImage }" class="rounded-circle myimage mr-3" alt="Cinque Terre"> <span
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
				<li class="nav-item"><a class="nav-link" href="#" id="mypage-message">쪽지함</a></li>
			</ul>
		</nav>
	</div>
</div>
<div class="row pt-5" style="background-color: rgba(211, 211, 211, 0.4); height: 500px;">
	<div class="col-9">
		<div id="mypage-body">
			<div class="row">
              <div class="col-9">
                <p>소개</p>
                <div class="row">
                  <div class="col-5">
                    <div><span>이름 </span><span>홍길동</span></div>
                    <div><span>이름 </span><span>홍길동</span></div>
                    <div><span>이름 </span><span>홍길동</span></div>
                    <div><span>이름 </span><span>홍길동</span></div>
                  </div>
                  <div class="col-5">
                    <div><span>이름 </span><span>홍길동</span></div>
                    <div><span>이름 </span><span>홍길동</span></div>
                    <div><span>이름 </span><span>홍길동</span></div>
                    <div><span>이름 </span><span>홍길동</span></div>
                  </div>
                </div>
              </div>
              <div class="col-3" style="background-color: gray;">
                asdf
              </div>
            </div>
		</div>
	</div>
	<div class="col-3">
			<div class="text-center"><strong>내 친구</strong></div>
			<c:forEach items="${followers }" var="follower">
				<div class="mb-3 pl-4">
					<a href="/friend/info.do?userId=${follower.folUserId }">
						<img src="/resources/profileImage/${follower.image }" class="rounded-circle smallimage mr-3" alt="Cinque Terre">
						<span style="font-size: 15px; font-weight: bold;">${follower.nickname }</span>
					</a>
				</div>
			</c:forEach>
	</div>
</div>
<script>
	// 가입모임 데이터 가져오는 AJAX
	$(function () {
		var $mypageBody = $("#mypage-body");
		
		/* var mypageInfo = "<div>";
		mypageInfo += "닉네임";
		mypageInfo += "<p>${LOGIN_USER.nickname }</p>"
		mypageInfo += "<div>이름</div>"
		mypageInfo += "<div>전화번호</div>"
		mypageInfo += "<div>생년월일</div>"
		mypageInfo += "<div>이메일</div>"
		mypageInfo += "<div>지역</div>"; */

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
						if(images.length==0){
							var empty = "<div><p>내가올린 사진이 존재하지않습니다.</p></div>";
							$mypageBody.append(empty);
						} else{
					$.each(images, function (index, image) {
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
							
						})
					}
				}
			})
		})
		$("#mypage-board").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/board.do",
				dataType: "json",
				success: function (boards) {
						if(boards.length==0){
							var empty = "<div>내가쓴 글이 존재하지않습니다.</div>";
							$mypageBody.append(empty);
						} else{
					$.each(boards, function (index, board) {
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
							
						})
					}
				}
			})
		})
	})
</script>