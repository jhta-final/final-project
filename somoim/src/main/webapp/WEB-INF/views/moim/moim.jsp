<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="justify-content-center">
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
                        <a class="nav-link" href="board.do?moimNo=${param.moimNo}&pageNo=1">게시판</a>
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
    <div class="row mt-4">
        <div class="col-12 ml-3 pr-5">
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
                    	<c:choose>
                    		<c:when test="${loginedUser eq subMoim.userId}">
                    			<button data-toggle="modal" onclick="subMoimModify(${subMoim.subMoimNo})"
		                                class="btn btn-primary" data-target="#sub-moim-modify">수정</button>
                    		</c:when>
                    		<c:otherwise>
		                        <button data-toggle="modal" onclick="getSubMoimDetail(${subMoim.subMoimNo}, '${loginedUser}')"
		                                class="btn btn-success"  data-target="#sub-moim-participant">참가</button>
                    		</c:otherwise>
                    	</c:choose>
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
                <img src="/resources/profileImage/${user.profileImage }"
                     class="rounded-circle" height="55px">
                <strong style="font-size: large">${user.userId}</strong>
            </span>
            <c:if test="${user.userRole eq 'ADMIN'}">
                <span style=" margin-top: 14px; margin-left: 15%">
                    <strong style="font-size: large;" id="leader">방장</strong>
                </span>
            </c:if>
        </div>
    </c:forEach>
    
    <c:if test="${'ADMIN' eq role}">
	    <div class="row mr-5 mb-5">
	        <div class="col-12 text-right">
	        	<a href="modify.do?moimNo=${param.moimNo}" class="btn btn-success">수정</a>
	        	<a href="delete.do?moimNo=${param.moimNo}" class="btn btn-danger">삭제</a>
	        </div>
	    </div>
    </c:if>
    
    <!--  벙개추가 모달 -->
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
                            <input hidden="hidden" type="text" value="${LOGIN_USER.id}" name="userId"/>
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

    <div class="modal" id="sub-moim-modify">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">벙개 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form:form method="post" action="/moim/submodify.do" modelAttribute="subMoimForm">
                    <div class="modal-body">
                        <input id="sub-modify-no" hidden="hidden" type="number" name="subMoimNo" value="0">
                        <input hidden="hidden" type="number" name="moimNo" value="${param.moimNo}" />
                        <input hidden="hidden" type="text" value="${LOGIN_USER.id}" name="userId"/>
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
                        <button type="submit" class="btn btn-primary">수정</button>
                        <button type="button" onclick="deleteSubMoim(${param.moimNo})" class="btn btn-danger">삭제</button>
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
                        <p id="sub-moim-time"></p>
                        
                        <i class="fas fa-map-marker" style="color: #f06595;"></i>
                        <p id="sub-moim-location"></p>
                        
                        <i class="fas fa-won-sign" style="color: #f06595;"></i>
                        <p id="sub-moim-fee"> </p>
                        <h5><strong>모임멤버</strong></h5>
                        <hr>
                        <div id="sub-moim-join-users"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button class="btn btn-primary" id="btn-participant"></button>
                </div>

            </div>
        </div>
    </div>
</div>
<script>

    let joinCount = 0;
    let headCount = 0;
    let subNo = 0;
    let tempUser = null;
    let loginUser = $("#userId").val();

    $("#btn-participant").on("click", subMoimfx(subNo, loginUser));

   	$(function () {


   	 //    console.log(joinCount, headCount, subNo, tempUser, loginUser);
        // if(tempUser == null) {
        //     if(joinCount != headCount) {
        //         $("#btn-participant").on("click", joinSub(subNo, loginUser));
        //     }
        // } else {
        //     $("#btn-participant").on("click", exitSub(subNo, loginUser));
        // }

        


    })

    function subMoimModify(subMoimNo) {
        $("#sub-modify-no").val(subMoimNo);
    }

    function deleteSubMoim(moimNo) {
        subMoimNo = $("#sub-modify-no").val();
        $.ajax({
            type:"GET",
            url:"/moim/subdelete.do",
            data: {
                subMoimNo:subMoimNo,
                moimNo:moimNo
            },
            dataType:"json"
        })
    }

    function subMoimfx(subMoimNo, userId) {
        console.log("fx");
        console.log(subMoimNo, userId);
    }

    function exitSub(subMoimNo, userId) {
        console.log(subMoimNo, userId);
        console.log("exit");
    }

    function joinSub(subMoimNo, userId) {
        console.log(subMoimNo, userId);
        console.log("join");
    }

	function getSubMoimDetail(subMoimNo, loginedUser) {

            $.ajax({
                type:"GET",
                url:"/moim/submoim.do",
                data: {subMoimNo:subMoimNo},
                dataType:"json",
                success:function (subMoim) {
                    joinCount = subMoim.moimSubMoim.joinCount;
                    headCount = subMoim.moimSubMoim.headCount;
                    $("#btn-participant").removeClass('btn-danger');
                    $("#btn-participant").removeClass('btn-warning');
                    $("#btn-participant").addClass('btn-primary');
                    $("#sub-moim-title").text(subMoim.moimSubMoim.title);
                    $("#sub-moim-time").text(subMoim.moimSubMoim.joinDate);
                    $("#sub-moim-location").text(subMoim.moimSubMoim.location);
                    $("#sub-moim-fee").text(subMoim.moimSubMoim.fee);
                    $("#btn-participant").text(subMoim.moimSubMoim.joinCount + "/" + subMoim.moimSubMoim.headCount);


                    if(subMoim.moimSubMoim.joinCount == subMoim.moimSubMoim.headCount) {
                        $("#btn-participant").removeClass('btn-danger');
                        $("#btn-participant").removeClass('btn-primary');
                        $("#btn-participant").addClass('btn-warning');
                    }

                    let $joinusers = $("#sub-moim-join-users").empty();
                    let div = "";
                    for (let user of subMoim.subJoinUsers){
                        div += '<div class="row ml-4 mb-1">';
                        div += '<span>';
                        div += '<img src="/resources/profileImage/'+ user.profileImage +'"class="rounded-circle"'
                            +   'alt="avatar image" height="55px">';
                        div += '<strong class="ml-3" style="font-size: large">' +user.userId+ '</strong>';
                        div += '</span>';
                        div += '</div>';
                        if(loginedUser === user.userId) {
                            $("#btn-participant").removeClass('btn-primary');
                            $("#btn-participant").addClass('btn-danger');
                            tempUser = user.userId

                            if(subMoim.moimSubMoim.joinCount == subMoim.moimSubMoim.headCount) {
                                $("#btn-participant").removeClass('btn-danger');
                                $("#btn-participant").addClass('btn-warning');
                            }
                        }
                    }
                    $joinusers.append(div);
                }
            })
       }

</script>