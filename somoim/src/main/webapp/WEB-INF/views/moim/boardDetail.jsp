<%@ page language="java" contentType="text/html; charset=UTF-8" %>

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
                        <span>${board.createdDate}</span><span class="ml-3">조회 ${board.views}</span>
                    </div>
                </div>
                <div style="float: right">
                    <div class="dropdown" style="float: right;text-align: right">
                        <a data-toggle="dropdown">
                            <i class="fas fa-ellipsis-v" style="color: gray"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">수정</a>
                            <a class="dropdown-item bg-danger" href="#">삭제</a>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <p>${board.content}</p>
            <hr>
            <h4>댓글</h4>
            <div class="row mt-3">
                <div class="ml-3">
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
                         class="rounded-circle" alt="avatar image" height="55px">
                </div>
                <div class="ml-4">
                    <div class="row">
                        <span>고정원</span>
                    </div>
                    <div class="row">
                        댓글내용댓글내용댓글내용댓글내용댓글내용
                    </div>
                    <div class="row">
                        <span>2020.08.20 18:30</span>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="ml-3">
                    <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
                         class="rounded-circle" alt="avatar image" height="55px">
                </div>
                <div class="ml-4">
                    <div class="row">
                        <span>고정원</span>
                    </div>
                    <div class="row">
                        댓글내용댓글내용댓글내용댓글내용댓글내용
                    </div>
                    <div class="row">
                        <span>2020.08.20 18:30</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>