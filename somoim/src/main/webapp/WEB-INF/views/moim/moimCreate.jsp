<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .image-checked {
        border: solid 5px yellow;
    }
</style>

<div class="container mt-5 ml-4">
    <form:form class="form" method="post" enctype="multipart/form-data" action="/moim/add.do" modelAttribute="moimForm">
        <form:input hidden="hidden" value="${LOGIN_USER.id}" path="userId" />
        <div class="form-group mt-4">
            <i class="mr-2 fas fa-images" style="color: #0F4C81;"></i><label>기본 이미지</label>
            <br>
            <span id="image-check">
	            <img class="mr-3 image-checked" data-no="문화공연.jpg" src="/resources/home_images/문화공연.jpg" width="150" height="150" />
	            <img class="mr-3" data-no="게임.jpg" src="/resources/home_images/게임.jpg"  width="150" height="150" />
	            <img class="mr-3" data-no="사교인맥.png" src="/resources/home_images/사교인맥.png" width="150" height="150" />
	            <img class="mr-3" data-no="스포츠.png" src="/resources/home_images/스포츠.png" width="150" height="150" />
            </span>
            <form:input id="image-file" type="file" path="upfile" />
            <br>
        </div>
        <form:input id="image-name" hidden="hidden" path="image" value="default1"/>
        <div class="form-group mt-4">
            <i class="mr-2 fas fa-check" style="color: #0F4C81;"></i><label>모임 이름</label>
            <form:input type="text" class="form-control" path="title" required="required"/>
        </div>
        <div class="form-group">
            <i class="mr-2 far fa-clock" style="color: #0F4C81;"></i><label>정모 일시</label>
            <form:input type="datetime-local" class="form-control" path="joinDate" required="required"/>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-map-marker" style="color: #0F4C81;"></i><label>지역구</label>
            <form:select path="locationNo" class="form-control" required="required">
                <option value=""selected="selected" disabled="disabled" class="text-center">지역</option>
                <option value="1">강서구</option>
                <option value="2">양천구</option>
                <option value="3">구로구</option>
                <option value="4">금천구</option>
                <option value="5">영등포구</option>
                <option value="6">동작구</option>
                <option value="7">관악구</option>
                <option value="8">서초구</option>
                <option value="9">강남구</option>
                <option value="10">송파구</option>
                <option value="11">강동구</option>
                <option value="12">마포구</option>
                <option value="13">용산구</option>
                <option value="14">서대문구</option>
                <option value="15">은평구</option>
                <option value="16">중구</option>
                <option value="17">종로구</option>
                <option value="18">성동구</option>
                <option value="19">광진구</option>
                <option value="20">동대문구</option>
                <option value="21">성북구</option>
                <option value="22">강북구</option>
                <option value="23">도봉구</option>
                <option value="24">노원구</option>
                <option value="25">중랑구</option>
            </form:select>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-tags" style="color: #0F4C81;"></i><label>카테고리</label>
            <select id="main-category" name="category" required="required" class="form-control" onchange="getSubCate()">
                <option value="0"selected="selected" disabled="disabled" class="text-center"></option>
                <option value="1">게임/오락</option>
                <option value="2">사교/인맥</option>
                <option value="3">운동/스포츠</option>
                <option value="4">반려동물</option>
                <option value="5">문화/공연/축제</option>
            </select>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-tags" style="color: #0F4C81;"></i><label>세부 카테고리</label>
            <form:select id="sub-category" required="required" path="subCateNo" class="form-control">
            </form:select>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-won-sign" style="color: #0F4C81;"></i><label>참가비</label>
            <form:input type="number" required="required" class="form-control" path="fee"/>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-user-friends" style="color: #0F4C81;"></i><label>참가인원 (2 ~ 60명)</label>
            <form:input type="number" required="required" min="2" max="60" class="form-control" path="headCount"/>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-edit" style="color: #0F4C81;"></i><label>상세 설명</label>
            <form:textarea path="content" required="required" id="ckeditor" rows="10" cols="80"></form:textarea>
        </div>
        <div class="form-group d-inline-flex">
            <i class="mr-2 fas fa-dollar-sign" style="color: #0F4C81;"></i><label>프리미엄 </label>
            <form:input hidden="hidden" id="premium" type="text" value="N" path="premiumYN" />
            <div class="custom-control custom-switch">
			    <input type="checkbox" class="custom-control-input" onchange="checkBox()" id="switch1">
			    <label class="custom-control-label" for="switch1"></label>
		  	</div>
        </div>
        <div class="text-right">
            <a href="/home.do" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">개설</button>
        </div>
    </form:form>
</div>

<script>
    CKEDITOR.replace( 'ckeditor' );

    $(function () {
        $("#image-file").change(function (e) {
            $("#image-check img").removeClass("image-checked");
            $("#image-name").val("empty");
        });
    })

    $("#image-check").on("click", "img", function () {
        $("#image-check img").removeClass("image-checked");
        $(this).addClass("image-checked");
        $("#image-name").val($(this).data("no"));
    })

    // 세부 카테고리 가져오기
    function getSubCate() {
        let mainCateNo = $("#main-category option:selected").val();
        $.ajax({
            type:"GET",
            url:"/moim/subCate.do",
            data: {
                mainCateNo:mainCateNo
            },
            dataType:"json",
            success:function (subCates) {
                let $select = $("#sub-category").empty();
                let options = "";
                for(let subCate of subCates) {
                    options += '<option value='+subCate.subCateNo+'>';
                    options += subCate.name;
                    options += '</option>';
                }
                $select.append(options);
            }
        })
    }

    function checkBox() {
        if($("#switch1").prop("checked")) {
            $("#premium").val("Y");
        } else {
            $("#premium").val("N");
        }
    }
</script>