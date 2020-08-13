<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="jeong justify-content-center">
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
                        <a class="nav-link active" href="#">정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">게시판</a>
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
    <div class="row mt-4">
        <div class="col-12 ml-3">
            <p>${moim.content}</p>
        </div>
    </div>
    <div class="row mt-4 ml-3">
        <div class="col-12">
            <i class="far fa-calendar-plus fa-2x mr-3" style="color: #ff6b6b;"></i>
            <button class="btn btn-outline-primary">벙개 추가</button>
            <hr>
        </div>
    </div>
    <c:foreach var="subMoim" items="${submoims}">
        <div class="row ml-3">
            <div class="col-12 ml-2">
                <h3 class="mb-3">${subMoim.title}</h3>
                <div class="row">
                    <div class="col-1">
                        <i class="far fa-calendar-check fa-2x mt-3" style="color: #ff6b6b;"></i><span></span>
                    </div>
                    <div class="col-9">
                        <div class="row"><i class="far fa-clock mr-3" style="color: #f06595;"></i><span>2020.08.11 오전 0시 0분</span></div>
                        <div class="row"><i class="fas fa-map-marker mr-3" style="color: #f06595;"></i><span>${subMoim.location}</span></div>
                        <div class="row"><i class="fas fa-won-sign mr-2" style="color: #f06595;"></i><span>${subMoim.fee}</span></div>
                    </div>
                    <div>
                        <button class="btn btn-success">참석</button>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </c:foreach>

    <div class="row mt-2 ml-3">
        <div class="col-12">
            <h5><strong>모임멤버</strong></h5>
            <hr>
    </div>
</div>
<div class="row ml-4 mb-1">
        <span>
            <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
                 class="rounded-circle" alt="avatar image" height="55px">
            <strong style="font-size: large">고정원</strong>
        </span>
        <span style=" margin-top: 14px; margin-left: 10%">
                <strong style="font-size: large;" id="leader">방장</strong>
        </span>
</div>
<div class="row ml-4 mb-1">
    <span>
        <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
             class="rounded-circle" alt="avatar image" height="55px">
        <strong style="font-size: large">김민수</strong>
    </span>
</div>
<div class="row ml-4 mb-1">
    <span>
        <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
             class="rounded-circle" alt="avatar image" height="55px">
        <strong style="font-size: large">권영준</strong>
    </span>
</div>

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

</script>