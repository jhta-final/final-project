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

#otherpage-body .card {
	width: 300px;
	border: 0;
	position: relative;
	margin-right: 35px;
}

#otherpage-body .card-body {
	padding: 0;
}
</style>
<div class="ml-5 mt-3">
	<img src="/resources/profileImage/${otherUser.profileImage }"
		class="rounded-circle myimage mr-3" alt="Cinque Terre"> <span
		style="font-size: large; font-weight: bold;">${otherUser.nickname }</span>
	<div class="text-center">
		<button class="btn btn-outline-danger btn-sm">
			신고하기
			<svg width="2em" height="2em" viewBox="0 0 16 16"
				class="bi bi-brightness-alt-high" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
	  			<path fill-rule="evenodd"
					d="M5.041 10.5h5.918a3 3 0 0 0-5.918 0zM4 11a4 4 0 1 1 8 0 .5.5 0 0 1-.5.5h-7A.5.5 0 0 1 4 11zm4-8a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 3zm8 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 11a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.414a.5.5 0 1 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zM4.464 7.464a.5.5 0 0 1-.707 0L2.343 6.05a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707z" />
			</svg>
		</button>
		<button class="btn btn-outline-primary btn-sm">
			쪽지 보내기
			<svg width="2em" height="2em" viewBox="0 0 16 16"
				class="bi bi-mailbox2" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
				<path fill-rule="evenodd"
					d="M12 3H4a4 4 0 0 0-4 4v6a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V7a4 4 0 0 0-4-4zM8 7a3.99 3.99 0 0 0-1.354-3H12a3 3 0 0 1 3 3v6H8V7zm1 1.5h2.793l.853.854A.5.5 0 0 0 13 9.5h1a.5.5 0 0 0 .5-.5V8a.5.5 0 0 0-.5-.5H9v1zM4.585 7.157C4.836 7.264 5 7.334 5 7a1 1 0 0 0-2 0c0 .334.164.264.415.157C3.58 7.087 3.782 7 4 7c.218 0 .42.086.585.157z" />
			</svg>
		</button>
		<button class="btn btn-outline-light text-dark btn-sm">
			팔로우하기
			<svg width="2em" height="2em" viewBox="0 0 16 16"
				class="bi bi-person-plus" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd"
					d="M11 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM1.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM6 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm4.5 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
			  <path fill-rule="evenodd"
					d="M13 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z" />
			</svg>
		</button>
		<button class="btn btn-outline-light text-dark btn-sm">
			취소
			<svg width="2em" height="2em" viewBox="0 0 16 16"
				class="bi bi-person-dash-fill" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
  				<path fill-rule="evenodd"
					d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm5-.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z" />
			</svg>
		</button>
	</div>
</div>
<div class="row mt-3" style="width: 95%">
	<div class="col-12">
		<nav class="navbar">
			<ul class="nav nav-tabs" id="otherpage-nav">
				<li class="nav-item"><a class="nav-link active" href="#"
					id="otherpage-info">정보</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					id="otherpage-mymoim">가입모임</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					id="otherpage-images">사진첩</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					id="otherpage-board">작성후기</a></li>
			</ul>
		</nav>
	</div>
</div>
<div class="row" style="padding: 30px 35px;">
	<div class="col-12">
		<div id="otherpage-body"></div>
	</div>
</div>
<script>
	// 가입모임 데이터 가져오는 AJAX
	$(function() {
		var $otherpageBody = $("#otherpage-body");

		$("#otherpage-nav .nav-link").click(function() {
			$("#otherpage-nav .nav-link").removeClass('active');
			$(this).addClass('active');
			$otherpageBody.empty();
		})

		// 사용자 정보 저장
		var otherpageInfo = "<div><div class='row'><div class='col-9'><div class='pb-4' style='border-bottom: 1px solid darkgray'>";
		otherpageInfo += "<p>Profile</p><div class='mx-auto'><table class='table-borderless' style='width:700px'>";
		otherpageInfo += "<colgroup><col width='20%'><col width='40%'><col width='20%'><col width='40%'></colgroup>";
		otherpageInfo += "<tr><th class='text-center'>아이디</th><td>${otherUser.id}</td><th class='text-center'>전화번호</th><td>${otherUser.tel}</td></tr>";
		otherpageInfo += "<tr><th class='text-center'>이름</th><td>${otherUser.name}</td><th class='text-center'>이메일</th><td>${otherUser.email}</td></>";
		otherpageInfo += "<tr><th class='text-center'>생일</th><td>${otherUser.birthDate}</td></tr></table></div></div>";
		otherpageInfo += "<div class='mt-3 pb-4' style='border-bottom: 1px solid darkgray'><p>Comment</p>";
		otherpageInfo += "<p>${otherUser.content}</p></div></div>";
		otherpageInfo += "<div class='col-3'><p>통계</p>	<div class='mx-auto'><table class='table-borderless' style='width:255px'>";
		otherpageInfo += "<colgroup><col width='50%'><col width='50%'></colgroup>";
		otherpageInfo += "<tr><th class='text-center'>가   입   일 </th><td><fmt:formatDate value='${otherUser.createdDate}'/></td></tr>";
		otherpageInfo += "<tr><th class='text-center'>팔로워 수</th><td>${followerCnt}</td></tr>";
		otherpageInfo += "</table></div></div></div>";
		$otherpageBody.append(otherpageInfo);

		$("#otherpage-info").click(function() {
			$otherpageBody.append(otherpageInfo);
		})

		$("#otherpage-mymoim")
				.click(
						function() {
							$
									.ajax({
										type : "GET",
										url : "/other/usermoim.do",
										dataType : "json",
										success : function(joinmoims) {
											if (joinmoims.status == 'false') {
												var empty = "<div>비공개입니다. 내용을 보실려면 팔로우하세요</div>"
												$otherpageBody.append(empty);
												return;
											}

											if (joinmoims.joinmoim.length == 0) {
												var empty = "<div><p>내가 가입한 모임이 존재하지않습니다.</p></div>";
												$otherpageBody.append(empty);
												return;
											}

											var moimPage = "<div class='clearfix'>";

											$
													.each(
															joinmoims.joinmoim,
															function(index,
																	moim) {
																moimPage += "<div class='card float-left'><img class='card-img-top' src='/resources/index_images/10.jpg' alt='Card image'>";
																moimPage += "<div class='card-body mt-2'><div class='card-title'><div class='clearfix'>";
																moimPage += "<span class='float-left'>"
																		+ moim.title
																		+ "</span><span class='float-right'>"
																		+ moim.joinCount
																		+ "/"
																		+ moim.headCount
																		+ "<i class='far fa-heart ml-4'></i></span>";
																moimPage += "	</div></div><div class='text-right'><small class='text-muted'>2020.11.22</small>";
																moimPage += "</div></div>	</div>";

															})
											moimPage += "</div>";
											$otherpageBody.append(moimPage);
										}
									})
						})

		$("#otherpage-images")
				.click(
						function() {
							$
									.ajax({
										type : "GET",
										url : "/other/photo.do",
										dataType : "json",
										success : function(images) {
											if (images.status == 'false') {
												var empty = "<div>비공개입니다. 내용을 보실려면 팔로우하세요</div>"
												$otherpageBody.append(empty);
											} else {
												if (images.photos.length == 0) {
													var empty = "<div>올린사진이 없습니다.</div>"
													$otherpageBody
															.append(empty);
												} else {
													$
															.each(
																	images.photos,
																	function(
																			index,
																			image) {
																		var tr = "<div class='card'>";
																		tr += "<a href='/moim/moim.do?moimNo=${moim.moimNo}'>";
																		tr += "<img class='card-img-top' src='/resources/home_images/9.jpg' alt='Card image cap'>";
																		tr += "<div class='card-body'>";
																		tr += "<h5 class='card-title'><c:out value='${moim.title }'/></h5>"
																		tr += "<p class='card-text'>${moim.content }</p>";
																		tr += "</div><div class='card-footer'>";
																		tr += "<small class='text-muted'>${moim.createdDate}</small>";
																		tr += "</div></a></div>";

																		$otherpageBody
																				.append(tr);

																	})

												}
											}
										}
									})
						})
		$("#otherpage-board")
				.click(
						function() {
							$
									.ajax({
										type : "GET",
										url : "/other/board.do",
										dataType : "json",
										success : function(boards) {
											console.log(boards);
											if (boards.status == 'false') {
												var empty = "<div>비공개입니다. 내용을 보실려면 팔로우하세요</div>"
												$otherpageBody.append(empty);
											} else {
												if (boards.boards.length == 0) {
													var empty = "<div>작성한글이 없습니다.</div>"
													$otherpageBody
															.append(empty);
												} else {
													$
															.each(
																	boards.boards,
																	function(
																			index,
																			board) {
																		var tr = "<div class='card'>";
																		tr += "<a href='/moim/boardDetail.do?boardNo="
																				+ board.boardNo
																				+ "'>";
																		tr += "<img class='card-img-top' src='/resources/home_images/9.jpg' alt='Card image cap'>";
																		tr += "<div class='card-body'>";
																		tr += "<h5 class='card-title'>"
																				+ board.title
																				+ "</h5>"
																		tr += "<p class='card-text'>"
																				+ board.content
																				+ "</p>";
																		tr += "</div><div class='card-footer'>";
																		tr += "<small class='text-muted'>"
																				+ board.createdDate
																				+ "</small>";
																		tr += "</div></a></div>";

																		$otherpageBody
																				.append(tr);

																	})

												}
											}
										}
									})
						})
	})
</script>