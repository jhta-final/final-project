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

	#mypage-body .card {
		width: 300px;
		border: 0;
		position: relative;
		margin-right: 35px;
	}

	#mypage-body .card-body {
		padding: 0;
	}

</style>
<div>
	<div class="ml-5 mt-3">
		<img src="/resources/profileImage/${LOGIN_USER.profileImage }" class="rounded-circle myimage mr-3"
			alt="Cinque Terre">
		<span style="font-size: large; font-weight: bold;">${LOGIN_USER.nickname }</span>
	</div>
	<div class="row mt-3" style="width: 95%">
		<div class="col-12">
			<nav class="navbar">
				<ul class="nav nav-tabs" id="mypage-nav">
					<li class="nav-item"><a class="nav-link active" href="#" id="mypage-info">정보</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#" id="mypage-mymoim">가입모임</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#" id="mypage-images">사진첩</a></li>
					<li class="nav-item"><a class="nav-link" href="#" id="mypage-board">내후기</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="row" style="padding: 30px 35px;">
		<div class="col-9">
			<div id="mypage-body">

			</div>
		</div>
		<div class="col-3">
			<div class="text-center mb-3"><strong>내 친구</strong></div>
			<c:forEach items="${followers }" var="follower">
				<div class="mb-3 pl-5">
					<a href="/other/info.do?userId=${follower.folUserId }">
						<img src="/resources/profileImage/${follower.image }" class="rounded-circle smallimage mr-3"
							alt="Cinque Terre">
						<span style="font-size: 15px; font-weight: bold;">${follower.nickname }</span>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<!-- 회원정보 수정 모달창 -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<script>
	//가입모임 데이터 가져오는 AJAX
	$(function () {
		var $mypageBody = $("#mypage-body");

		// 정보탭 JS
		var mypageInfo =
			"<div><div class='row'><div class='col-9'><div class='pb-4' style='border-bottom: 1px solid darkgray'>";
		mypageInfo += "<p>Profile</p><div class='mx-auto'><table class='table-borderless' style='width:700px'>";
		mypageInfo += "<colgroup><col width='20%'><col width='40%'><col width='20%'><col width='40%'></colgroup>";
		mypageInfo +=
			"<tr><th class='text-center'>아이디</th><td>${LOGIN_USER.id}</td><th class='text-center'>전화번호</th><td>${LOGIN_USER.tel}</td></tr>";
		mypageInfo +=
			"<tr><th class='text-center'>이름</th><td>${LOGIN_USER.name}</td><th class='text-center'>이메일</th><td>${LOGIN_USER.email}</td></>";
		mypageInfo += "<tr><th class='text-center'>생일</th><td>${LOGIN_USER.birthDate}</td></tr></table></div></div>";
		mypageInfo += "<div class='mt-3 pb-4' style='border-bottom: 1px solid darkgray'><p>Comment</p>";
		mypageInfo += "<p>${LOGIN_USER.content}</p></div></div>";
		mypageInfo +=
			"<div class='col-3'><p>통계</p>	<div class='mx-auto'><table class='table-borderless' style='width:255px'>";
		mypageInfo += "<colgroup><col width='50%'><col width='50%'></colgroup>";
		mypageInfo +=
			"<tr><th class='text-center'>가   입   일 </th><td><fmt:formatDate value='${LOGIN_USER.createdDate}'/></td></tr>";
		mypageInfo += "<tr><th class='text-center'>팔로워 수</th><td>${followersCnt}</td></tr>";
		mypageInfo += "</table></div>";
		mypageInfo += "<div class='text-right mt-5'><button type='button' class='btn btn-info' id='mypage-modify-button'><i class='fas fa-wrench mr-1'></i>수정</button></div></div></div>";
	
		$mypageBody.append(mypageInfo);

		$("#mypage-nav .nav-link").click(function () {
			$("#mypage-nav .nav-link").removeClass('active');
			$(this).addClass('active');
			$mypageBody.empty();
		})

		$("#mypage-info").click(function () {
			$mypageBody.append(mypageInfo);
		});
		
		$("#mypage-modify-button").on('click', function() {
			console.log(123);
		})
		
		// 가입모임 JS
		$("#mypage-mymoim").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/usermoim.do",
				dataType: "json",
				success: function (moims) {
					if (moims.length == 0) {
						var empty = "<div><p>내가 가입한 모임이 존재하지않습니다.</p></div>";
						$mypageBody.append(empty);
						return;
					}
					var moimPage = "<div class='clearfix'>";

					$.each(moims, function (index, moim) {
						moimPage +=
							"<div class='card float-left'><img class='card-img-top' src='/resources/index_images/10.jpg' alt='Card image'>";
						moimPage += "<div class='card-body mt-2'><div class='card-title'><div class='clearfix'>";
						moimPage +=
							"<span class='float-left'>"+moim.title+"</span><span class='float-right'>"+moim.joinCount+"/"+moim.headCount+"<i class='far fa-heart ml-4'></i></span>";
						moimPage +=
							"	</div></div><div class='text-right'><small class='text-muted'>2020.11.22</small>";
						moimPage += "</div></div>	</div>";

					})
					moimPage += "</div>";
					$mypageBody.append(moimPage);
				}
			})
		});

		$("#mypage-images").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/photo.do",
				dataType: "json",
				success: function (images) {
					if (images.length == 0) {
						var empty = "<div><p>내가올린 사진이 존재하지않습니다.</p></div>";
						$mypageBody.append(empty);
					} else {
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
		});
		
		$("#mypage-board").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/board.do",
				dataType: "json",
				success: function (boards) {
					if (boards.length == 0) {
						var empty = "<div>내가쓴 글이 존재하지않습니다.</div>";
						$mypageBody.append(empty);
					} else {
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
		$("#mypage-message").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/message.do",
				dataType: "json",
				success: function (message) {
					console.log(message);
				}
			})
		})
	})
</script>