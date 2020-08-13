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
            <button data-toggle="modal"
                    class="btn btn-outline-primary" data-target="#sub-moim-create">벙개 추가</button>
            <hr>
        </div>
    </div>
    <c:forEach var="subMoim" items="${submoims}">
        <div class="row ml-3">
            <div class="col-12 ml-2">
                <h3 class="mb-3">${subMoim.title}</h3>
                <div class="row" id="sub-moim-join">
                    <div class="col-1">
                        <i class="far fa-calendar-check fa-2x mt-3" style="color: #ff6b6b;"></i><span></span>
                    </div>
                    <div class="col-9">
                        <div class="row">
                            <i class="far fa-clock mr-3" style="color: #f06595;"></i>
                            <span><fmt:formatDate value="${subMoim.joinDate}"
                                                  type="both" dateStyle="short" timeStyle="short"/></span>
                        </div>
                        <div class="row"><i class="fas fa-map-marker mr-3" style="color: #f06595;"></i><span>${subMoim.location}</span></div>
                        <div class="row"><i class="fas fa-won-sign mr-2" style="color: #f06595;"></i><span>${subMoim.fee}</span></div>
                    </div>
                    <div>
                        <button data-toggle="modal"
                                class="btn btn-success" data-no="${subMoim.subMoimNo}" data-target="#sub-moim-participant">참가</button>
                        <hr>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </c:forEach>
    <div class="row mt-2 ml-3">
        <div class="col-12">
            <h5><strong>모임멤버</strong></h5>
            <hr>
    </div>
    </div>
    <c:forEach var="user" items="${users}">
        <div class="row ml-4 mb-1">
            <span>
                <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
                     class="rounded-circle" alt="avatar image" height="55px">
                <strong style="font-size: large">${user.userId}</strong>
            </span>
            <c:if test="${user.userRole eq 'ADMIN'}">
                <span style=" margin-top: 14px; margin-left: 15%">
                    <strong style="font-size: large;" id="leader">방장</strong>
                </span>
            </c:if>
        </div>
    </c:forEach>
    <div class="modal" id="sub-moim-create">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">벙개 추가</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form:form method="post" action="/moim/subadd.do" modelAttribute="subMoimForm">
                    <div class="modal-body">
                     
                            <input hidden="hidden" type="number" name="moimNo" value="${param.moimNo}" />
                            
                            유저 아이디 나중에 추가해야됨
                            
                            <input hidden="hidden" type="text" value="ko" name="userId"/>
                            <div class="form-group">
                                <label>벙개 이름</label>
                                <form:input type="text" class="form-control" path="title"/>
                            </div>
                            <div class="form-group">
                                <label>정모 일시</label>
                                <form:input type="datetime-local" class="form-control" path="joinDate"/>
                            </div>
                            <div class="form-group">
                                <label>정모 장소</label>
                                <form:input type="text" class="form-control" path="location"/>
                            </div>
                            <div class="form-group">
                                <label>참가비</label>
                                <form:input type="number" class="form-control" path="fee"/>
                            </div>
                            <div class="form-group">
                                <label>참가인원 (2 ~ 20명)</label>
                                <form:input type="number" min="2" max="20" class="form-control" path="headCount"/>
                            </div>
					    
      			    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                        <button type="submit" class="btn btn-primary" id="btn-add-submoim">등록</button>
                    </div>
				    </form:form>

            </div>
        </div>
    </div>

    <div class="modal" id="sub-moim-participant">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h2 class="modal-title" id="sub-moim-title"></h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="border border-light">
                        <i class="far fa-clock" style="color: #f06595;"></i>
                        <p id="sub-moim-time"><fmt:formatDate value=""
                        		type="both" dateStyle="short" timeStyle="short" /> </p>
                        
                        <i class="fas fa-map-marker" style="color: #f06595;"></i>
                        <p id="sub-moim-location"></p>
                        
                        <i class="fas fa-won-sign" style="color: #f06595;"></i>
                        <p id="sub-moim-fee"> </p>
                        <h5><strong>모임멤버</strong></h5>
                        <hr>
                        <c:forEach var="user" items="${users}">
                            <div class="row ml-4 mb-1">
	                            <span>
	                                <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
	                                     class="rounded-circle" alt="avatar image" height="55px">
	                                <strong style="font-size: large">${user.userId}</strong>
	                            </span>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary" id="btn-add-product">1/20</button>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    $("#sub-moim-join").on("click", "button", function() {
        let subMoimNo = $(this).data("no");

        $.ajax({
            type:"GET",
            url:"/moim/submoim.do",
            data: {subMoimNo:subMoimNo},
            dataType:"json",
            success:function (subMoim) {
                $("#sub-moim-title").text(subMoim.moimSubMoim.title);
                $("#sub-moim-time").text(subMoim.moimSubMoim.joinDate);
                $("#sub-moim-location").text(subMoim.moimSubMoim.location);
                $("#sub-moim-fee").text(subMoim.moimSubMoim.fee);
            }
        })
    })
</script>