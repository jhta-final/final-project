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
						<a class="nav-link active" href="#">게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">사진첩</a>
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
	<div class="row mt-5 justify-content-center">
		<table class="table table-hover" style="width: 80%">
			<thead>
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="board" items="${boards }">
				<c:choose>
                	<c:when test="${board.boardCateNo eq 1 }">
                		<tr class="table-danger">
                			<td class="text-center"><span class="badge badge-danger">공지</span></td>
                	</c:when>
                	<c:when test="${board.boardCateNo eq 2 }">
                		<tr>
							<td class="text-center">후기</td>
                	</c:when>
                	<c:otherwise>
                		<tr>
							<td class="text-center">일반</td>
                	</c:otherwise>
              	</c:choose>
	              			<td>${board.title }</td>
							<td>${board.userId }</td>
							<td><fmt:formatDate value="${board.createdDate }"/> </td>
							<td>${board.views }</td>
						</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row mt-4">		
		<div class="text-right" style="width: 90%">
			<a href="boardAdd.do?moimNo=${param.moimNo}" class="btn btn-primary">글 쓰기</a>
		</div>
	</div>
	<div class="row justify-content-center">
		<ul class="pagination">
		
			<li class="page-item"><a class="page-link" href="#"><</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">></a></li>
		</ul>
	</div>


</div>