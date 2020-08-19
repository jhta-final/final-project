<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!--Navbar -->
<div class="my-nav">
	<nav class="navbar navbar-dark" style="background-color: #FFFFF0;">
		<div style="width: 20%;">
			<button class="navbar-toggler mr-3 nav-white">
				<span class="navbar-toggler-icon" style="color: lightgray ;background-color: lightgray;" id="sideMenu"></span>
			</button>
			<a class="navbar-brand" href="/home.do" style="color: black"> <img
				src="/resources/home_images/logo_1.png"
				height="30" class="d-inline-block align-top" alt="mdb logo">
				somoim
			</a>
		</div>
		<div style="width: 40%;">
			<form class="form-inline my-1">
				<div class="md-form form-sm my-0">
					<input class="form-control form-control-sm" style="width: 500px;"
						type="text" placeholder="Search" aria-label="Search">
				</div>
				<button class="btn btn-outline-primary btn-sm ml-1 my-0"
					type="submit">Search</button>
				<div class="dropdown">
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle"
						data-toggle="dropdown"></button>
					<div class="dropdown-menu dropdown-menu-right" style="width: 595px;">
						<div class="form-group" style="width: 100%">
							<i class="mr-2 fas fa-map-marker" style="color: #0F4C81;"></i><label>지역구</label>
							<select name="location" class="form-control">
								<option value="" selected="selected" disabled="disabled"
									class="text-center">지역</option>
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
						<div class="form-group" style="width: 100%">
							<i class="mr-2 fas fa-tags" style="color: #0F4C81;"></i><label>카테고리</label>
							<select id="main-cate" name="category" class="form-control"
								onchange="getSubCate()">
								<option value="" selected="selected" disabled="disabled"
									class="text-center"></option>
								<option value="1">게임/오락</option>
								<option value="2">사교/인맥</option>
								<option value="3">운동/스포츠</option>
								<option value="4">반려동물</option>
								<option value="5">문화/공연/축제</option>
							</select>
						</div>
						<div class="form-group" style="width: 100%">
							<i class="mr-2 fas fa-tags" style="color: #0F4C81;"></i><label>세부
								카테고리</label> <select id="sub-cate" name="category" class="form-control">
							</select>
						</div>

						<div class="text-right mr-3">
							<button class="btn btn-primary btn-sm" type="submit">상세검색</button>
							<button class="btn btn-outline-primary btn-sm" type="reset">리셋</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="" style="float: right">
			<div class="dropdown" style="float: right;text-align: right">
		        <a class="nav-link dropdown-toggle dropdown-toggle-right" id="navbarDropdownMenu2" data-toggle="dropdown">
		          <img src="/resources/profileImage/${LOGIN_USER.profileImage }" class="rounded-circle z-depth-0"
		            alt="avatar image" height="35" width="35">
		        </a>
				<div class="dropdown-menu dropdown-menu-right">
		          <a class="dropdown-item" href="/mypage/mypage.do">my page</a>
		          <a class="dropdown-item" href="#">프로필 수정</a>
		          <a class="dropdown-item" href="#">쪽지함</a>
		          <a class="dropdown-item" href="/login/signout.do">로그아웃</a>
				</div>
			</div>
			<div class="dropdown" style="float: right;text-align: right">
				<a class="nav-link navbar-toggler-right dropdown-toggle dropdown-toggle-right" id="navbarDropdownMenu1" data-toggle="dropdown">
		          <i class="fas fa-bell fa-2x" style="color: lightgray;"></i>
		        </a>
		        <div class="dropdown-menu dropdown-menu-right">
		          <a class="dropdown-item" href="#">알람</a>
		          <a class="dropdown-item" href="#">경고:어쩌고 저쩌고</a>
		          <a class="dropdown-item" href="#">친구:홍길동님이 팔로우 하셧습니다.</a>
				</div>
			</div>
		</div>
	</nav>
</div>
<!--/.Navbar -->
<script type="text/javascript">
	<!-- 세부 카테고리 가져오기 -->
    function getSubCate() {
        mainCateNo = $("#main-cate option:selected").val()

        $.ajax({
            type:"GET",
            url:"/moim/subCate.do",
            data: {
                mainCateNo:mainCateNo
            },
            dataType:"json",
            success:function (subCates) {
                console.log(subCates);
                let $select = $("#sub-cate").empty();
                let options = "";
                for(let subCate of subCates) {
                    options += '<option value='+subCate.subCateNo+'>'
                    options += subCate.name;
                    options += '</option>';
                }
                $select.append(options);
            }
        })
    }
</script>
