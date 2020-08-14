<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-5 ml-4">
    <form class="form" role="form" method="post" action="">
        <div class="form-group mt-4">
            <i class="mr-2 fas fa-check"></i><label>벙개 이름</label>
            <input type="text" class="form-control" name="title"/>
        </div>
        <div class="form-group">
            <i class="mr-2 far fa-clock" style="color: #0F4C81;"></i><label>정모 일시</label>
            <input type="datetime-local" class="form-control" name="title"/>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-map-marker" style="color: #0F4C81;"></i><label>지역구</label>
            <select name="location" class="form-control">
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
            </select>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-tags" style="color: #0F4C81;"></i><label>카테고리</label>
            <select name="category" class="form-control">
                <option value=""selected="selected" disabled="disabled" class="text-center"></option>
                <option value="1">게임/오락</option>
                <option value="2">사교/인맥</option>
                <option value="3">운동/스포츠</option>
                <option value="4">반려동물</option>
                <option value="5">문화/공연/축제</option>
            </select>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-tags" style="color: #0F4C81;"></i><label>세부 카테고리</label>
            <input type="text" class="form-control" name="location"/>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-won-sign" style="color: #0F4C81;"></i><label>참가비</label>
            <input type="number" class="form-control" name="fee"/>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-user-friends" style="color: #0F4C81;"></i><label>참가인원 (2 ~ 60명)</label>
            <input type="number" min="2" max="20" class="form-control" name="headCount"/>
        </div>
        <div class="form-group">
            <i class="mr-2 fas fa-edit" style="color: #0F4C81;"></i><label>상세 설명</label>
            <textarea name="" id="ckeditor" rows="10" cols="80">

            </textarea>
        </div>
        <div class="text-right">
            <a href="/home.do" class="btn btn-secondary">취소</a>
            <button type="submit" class="btn btn-primary">개설</button>
        </div>
    </form>
</div>

<script>
    CKEDITOR.replace( 'ckeditor' );
</script>