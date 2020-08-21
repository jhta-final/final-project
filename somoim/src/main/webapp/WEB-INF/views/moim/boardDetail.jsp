<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #comment-form:hover {
        font-weight: bold;
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
                        <a class="nav-link" href="moim.do?moimNo=${board.moimNo}">정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="board.do?moimNo=${board.moimNo}&pageNo=1">게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="photo.do?moimNo=${param.moimNo}">사진첩</a>
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

    <div class="container" style="margin-bottom: 20px; padding-top: 10px;">
        <div class="container border" style="margin-bottom: 20px; padding-top: 10px;">
            <h3 class="mt-4">${board.title}</h3>
            <div class="row">
                <div class="ml-3" style="width: 10%">
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
                         class="rounded-circle" alt="avatar image" height="55px">
                </div>
                <div class="ml-4" style="width: 80%">
                    <div class="row">
                        <span>${board.userId}</span>
                    </div>
                    <div class="row">
                        <span><fmt:formatDate value="${board.createdDate }" type="both" dateStyle="short" timeStyle="short" /></span><span class="ml-3">조회 ${board.views}</span>
                    </div>
                </div>
                <c:if test="${board.userId eq loginedUser }">
	                <div style="float: right">
	                    <div class="dropdown" style="float: right;text-align: right">
	                        <a data-toggle="dropdown">
	                            <i class="fas fa-ellipsis-v" style="color: gray"></i>
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-right">
	                            <a class="dropdown-item" href="boardModify.do?boardNo=${board.boardNo}&moimNo=${board.moimNo}" >수정</a>
	                            <a class="dropdown-item bg-danger" data-toggle="modal" data-target="#confirm">삭제</a>
	                        </div>
	                    </div>
	                </div>
                </c:if>
            </div>
            <hr>
            <p>${board.content}</p>
            <hr>
            <h4>댓글</h4>
            
            <c:forEach var="comment" items="${comments }">            
	            <div class="row mt-3">
	                <div class="ml-3">
	                    <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
	                         class="rounded-circle" alt="avatar image" height="55px">
	                </div>
	                <div class="ml-4">
	                    <div class="row">
	                        <span>${comment.userId }</span>
	                    </div>
	                    <div class="row">
	                        ${comment.title }
	                    </div>
	                    <div class="row">
	                        <span><fmt:formatDate value="${comment.createdDate }" type="both" dateStyle="short" timeStyle="short" /></span>
	                    </div>
	                </div>
	            </div>
	            <hr>
            </c:forEach>
            
            <div class="row d-flex justify-content-center mb-5 mt-5">
                <form action="comment.do" method="post" id="form-comment">
                    <div>
                        <textarea name="title" cols="90" rows="5" style="resize: none;"></textarea>
                        <div class="text-right">
                            <span id="comment-form">댓글달기</span>
                        </div>
                    </div>
                    <input type="text" hidden="hidden" name="userId" value="${loginedUser}" />
                    <input type="text" hidden="hidden" name="boardNo" value="${param.boardNo}" />
                </form>
            </div>
        </div>
    </div>

    <!-- 모달 -->
    <div class="modal" id="confirm">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body text-center">
                    정말 삭제 하시겠습니까?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
                    <button type="button" onclick="deleteBoard(${board.boardNo})" class="btn btn-danger" data-dismiss="modal">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#comment-form").on("click", function () {
        $("#form-comment").submit();
    })
    
    function deleteBoard(boardNo) {
        location.href = "boardDelete.do?boardNo=" + boardNo;
    }
</script>