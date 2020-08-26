<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
p {
	margin: 0;
}

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

#mypage-modify-modal .input-group-text, #mypage-exit-modal .input-group-text
	{
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding: 0px 10px;
	margin-bottom: 0px;
	font-size: 18px;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	text-align: center;
	white-space: nowrap;
	background-color: #FFF;
	border: none;
	border-radius: 0.25rem;
}

#mypage-modify-modal .form-control, #mypage-exit-modal .form-control {
	width: 100%;
	padding: 3px;
	font-size: 16px;
	border: 1px solid rgba(0, 0, 0, .5);
	border-radius: 5px;
	outline: none;
	box-sizing: border-box;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, .075); /* .75 아니고 .075 주의 */
	margin-bottom: 4px;
}

.preview-image {
	position: absolute;
	top: -84px;
	left: 482px;
	/*  background: rgba(255,255,255,.8); */
	border: 1px solid #f5f5f5;
	box-sizing: border-box;
	display: none;
	box-shadow: 0 0 5px rgba(0, 0, 0, .75);
}

#mypage-temp-img {
	width: 150px;
	height: 150px;
	background-color: #fff;
}

#mypage-content-counter {
	color: #aaa;
	font-size: 14px;
}
</style>
<div>
	<div class="ml-5 mt-3">
		<img src="/resources/profileImage/${LOGIN_USER.profileImage }"
			class="rounded-circle myimage mr-3" alt="Cinque Terre"> <span
			style="font-size: large; font-weight: bold;">${LOGIN_USER.nickname }</span>
	</div>
	<div class="row mt-3" style="width: 95%">
		<div class="col-12">
			<nav class="navbar">
				<ul class="nav nav-tabs" id="mypage-nav">
					<li class="nav-item"><a class="nav-link"
						href="/mypage/mypage.do">정보</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/mypage/usermoim.do">가입모임</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/mypage/photo.do">사진첩</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="/mypage/board.do">내후기</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="row" style="padding: 30px 35px;">
		<div class="col-9">
			<c:choose>
				<c:when test="">
					<div>내가쓴 글이 존재하지않습니다.</div>
				</c:when>
				<c:otherwise>
					<div class='row justify-content-center'>
						<table class='table table-hover'>
							<thead>
								<tr>
									<th></th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boards }" var="board">
									<c:if test="${board.boardCateNo eq 1 }">
										<tr class='table-danger'>
											<td class='text-center'><span class='badge badge-danger'>공지</span>
											</td>
									</c:if>
									<c:if test="${board.boardCateNo eq 2 }">
										<tr>
											<td class='text-center'>후기</td>
									</c:if>
									<c:if test="${board.boardCateNo eq 3 }">
										<tr>
											<td class='text-center'>일반</td>
									</c:if>
											<td>
												<a href="/moim/boardDetail.do?boardNo=${board.boardNo }"><c:out value="${board.title }" /></a>
											</td>
											<td>${board.userId }</td>
											<td><fmt:formatDate value="${board.createdDate }" /></td>
											<td>${board.views }</td>
										</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-3">
			<div class="text-center mb-3">
				<strong>내 친구</strong>
			</div>
			<c:forEach items="${followers }" var="follower">
				<div class="mb-3 pl-5">
					<a href="/other/info.do?userId=${follower.folUserId }"> <img
						src="/resources/profileImage/${follower.image }"
						class="rounded-circle smallimage mr-3" alt="Cinque Terre"> <span
						style="font-size: 15px; font-weight: bold;">${follower.nickname }</span>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	//가입모임 데이터 가져오는 AJAX
	$(function() {

	})
</script>