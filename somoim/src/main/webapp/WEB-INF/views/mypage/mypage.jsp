<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
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
	
	#mypage-modify-modal .input-group-text {
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
	
	#mypage-modify-modal .form-control {
		width: 100%;
	    padding: 3px;
	    font-size: 16px;
	    border: 1px solid rgba(0,0,0,.5);
	    border-radius: 5px;
	    outline: none;
	    box-sizing: border-box;
	    box-shadow: inset 0 1px 2px rgba(0,0,0,.075);  /* .75 아니고 .075 주의 */
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
	    box-shadow: 0 0 5px rgba(0,0,0,.75);
	
	}
	
	#mypage-temp-img {
		width:150px;
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
		<img src="/resources/profileImage/${LOGIN_USER.profileImage }" class="rounded-circle myimage mr-3"
			alt="Cinque Terre">
		<span style="font-size: large; font-weight: bold;">${LOGIN_USER.nickname }</span>
	</div>
	<div class="row mt-3" style="width: 95%">
		<div class="col-12">
			<nav class="navbar">
				<ul class="nav nav-tabs" id="mypage-nav">
					<li class="nav-item"><a class="nav-link active" href="#" id="mypage-info">정보</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#" id="mypage-mymoim">가입모임</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#" id="mypage-images">사진첩</a></li>
					<li class="nav-item"><a class="nav-link" href="#" id="mypage-board">내후기</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="row" style="padding: 30px 35px;">
		<div class="col-9">
			<div id="mypage-body">

			</div>
		</div>
		<div class="col-3">
			<div class="text-center mb-3"><strong>내 친구</strong></div>
			<c:forEach items="${followers }" var="follower">
				<div class="mb-3 pl-5">
					<a href="/other/info.do?userId=${follower.folUserId }">
						<img src="/resources/profileImage/${follower.image }" class="rounded-circle smallimage mr-3"
							alt="Cinque Terre">
						<span style="font-size: 15px; font-weight: bold;">${follower.nickname }</span>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<!-- 회원정보 수정 모달창 -->
<div class="modal fade" id="mypage-modify-modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title">사용자 정보 수정</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <div class="modal-body">
        <form action="/mypage/modify.do" method="post" id="mypage-modify-form" enctype="multipart/form-data">
			<div class="input-group">
				<div class="input-group-text">닉네임 수정</div>
				<input type="text" class="form-control" id="mypage-modify-nickname" name="nickname" placeholder="닉네임를 입력해주세요" value="${LOGIN_USER.nickname }">
			</div>
			<div class="input-group">
				<div class="input-group-text">비밀번호 수정</div>
				<input type="password" class="form-control" id="mypage-modify-password" name="password" placeholder="비밀번호를 입력해주세요" value="${LOGIN_USER.password }">
			</div>
			<div class="input-group">
				<div class="input-group-text">비밀번호 확인</div>
				<input type="password" class="form-control" id="mypage-modify-password-check" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="input-group">
				<div class="input-group-text">이메일</div>
				<input type="email" class="form-control" id="mypage-modify-email" name="email" placeholder="이메일을 입력해주세요" value="${LOGIN_USER.email }">
			</div>
			<div class="input-group">
				<div class="input-group-text">프로필 사진</div>
				<input type="file" class="form-control" id="mypage-modify-profile" name="upfile" accept=".jpg,.jpeg,.png,.gif,.bmp" placeholder="파일을 선택해주세요">
				<div class="preview-image text-center">
					<span class="text-white">미리보기</span>					
					<img id="mypage-temp-img" alt="profile-image"/>
				</div>
			</div>
			<div class="input-group">
				<div class="input-group-text" id="inputGroup-sizing-sm">인사말 </div>
				<textarea class="form-control" id="mypage-modify-content" name="content" placeholder="내용을 입력해주세요">${LOGIN_USER.content }</textarea>
				<span id="mypage-content-counter">(0 / 최대 200자)</span></div>
			
			<div class="input-group">
				<div class="input-group-text">관심지역</div>
				<select class="form-control" id="mypage-modify-location" name="locationNo">
					<option value="0" selected="selected">없음</option>
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
		</form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="mypage-modify-submit">수정</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<script>
	//가입모임 데이터 가져오는 AJAX
	$(function () {
		var $mypageBody = $("#mypage-body");

		// 정보탭 JS
		var mypageInfo =
			"<div><div class='row'><div class='col-9'><div class='pb-4' style='border-bottom: 1px solid darkgray'>";
		mypageInfo += "<p>Profile</p><div class='mx-auto'><table class='table-borderless' style='width:700px'>";
		mypageInfo += "<colgroup><col width='20%'><col width='40%'><col width='20%'><col width='40%'></colgroup>";
		mypageInfo +=
			"<tr><th class='text-center'>아이디</th><td>${LOGIN_USER.id}</td><th class='text-center'>전화번호</th><td>${LOGIN_USER.tel}</td></tr>";
		mypageInfo +=
			"<tr><th class='text-center'>이름</th><td>${LOGIN_USER.name}</td><th class='text-center'>이메일</th><td>${LOGIN_USER.email}</td></>";
		mypageInfo += "<tr><th class='text-center'>생일</th><td>${LOGIN_USER.birthDate}</td></tr></table></div></div>";
		mypageInfo += "<div class='mt-3 pb-4' style='border-bottom: 1px solid darkgray'><p>Comment</p>";
		mypageInfo += "<p>${fn:replace(LOGIN_USER.content,replaceCharRN,replaceCharBr)}</p></div></div>";
		mypageInfo +=
			"<div class='col-3'><p>통계</p>	<div class='mx-auto'><table class='table-borderless' style='width:255px'>";
		mypageInfo += "<colgroup><col width='50%'><col width='50%'></colgroup>";
		mypageInfo +=
			"<tr><th class='text-center'>가   입   일 </th><td><fmt:formatDate value='${LOGIN_USER.createdDate}'/></td></tr>";
		mypageInfo += "<tr><th class='text-center'>팔로워 수</th><td>${followersCnt}</td></tr>";
		mypageInfo += "</table></div>";
		mypageInfo += "<div class='text-right mt-5'><button type='button' class='btn btn-info mr-2' id='mypage-modify-modal-button'><i class='fas fa-edit mr-1'></i>수정</button>";
		mypageInfo += "<button type='button' class='btn btn-danger' id='mypage-exit-modal-button'><i class='fas fa-sign-out-alt mr-1'></i>탈퇴</button></div></div></div>"
	
		$mypageBody.append(mypageInfo);

		$("#mypage-nav .nav-link").click(function () {
			$("#mypage-nav .nav-link").removeClass('active');
			$(this).addClass('active');
			$mypageBody.empty();
		})

		$("#mypage-info").click(function () {
			$mypageBody.append(mypageInfo);
		});
		
		$("#mypage-modify-modal-button").on('click', function() {
			$("#mypage-modify-modal").modal('show');
		})
		
		// 가입모임 JS
		$("#mypage-mymoim").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/usermoim.do",
				dataType: "json",
				success: function (moims) {
					if (moims.length == 0) {
						var empty = "<div><p>내가 가입한 모임이 존재하지않습니다.</p></div>";
						$mypageBody.append(empty);
						return;
					}
					var moimPage = "<div class='clearfix'>";

					$.each(moims, function (index, moim) {
						moimPage +=
							"<div class='card float-left'><img class='card-img-top' src='/resources/index_images/10.jpg' alt='Card image'>";
						moimPage += "<div class='card-body mt-2'><div class='card-title'><div class='clearfix'>";
						moimPage +=
							"<span class='float-left'>"+moim.title+"</span><span class='float-right'>"+moim.joinCount+"/"+moim.headCount+"<i class='far fa-heart ml-4'></i></span>";
						moimPage +=
							"	</div></div><div class='text-right'><small class='text-muted'>2020.11.22</small>";
						moimPage += "</div></div></div>";

					})
					moimPage += "</div>";
					$mypageBody.append(moimPage);
				}
			})
		});

		$("#mypage-images").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/photo.do",
				dataType: "json",
				success: function (images) {
					if (images.length == 0) {
						var empty = "<div><p>내가올린 사진이 존재하지않습니다.</p></div>";
						$mypageBody.append(empty);
					} else {
						$.each(images, function (index, image) {
							var tr = "<div class='card'>";
							tr += "<a href='/moim/moim.do?moimNo=${moim.moimNo}'>";
							tr +=
								"<img class='card-img-top' src='/resources/home_images/9.jpg' alt='Card image cap'>";
							tr += "<div class='card-body'>";
							tr += "<h5 class='card-title'><c:out value='${moim.title }'/></h5>"
							tr += "<p class='card-text'>${moim.content }</p>";
							tr += "</div><div class='card-footer'>";
							tr += "<small class='text-muted'>${moim.createdDate}</small>";
							tr += "</div></a></div>";

							$mypageBody.append(tr);

						})
					}
				}
			})
		});
		
		$("#mypage-board").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/board.do",
				dataType: "json",
				success: function (boards) {
					if (boards.length == 0) {
						var empty = "<div>내가쓴 글이 존재하지않습니다.</div>";
						$mypageBody.append(empty);
					} else {
						$.each(boards, function (index, board) {
							var tr = "<div class='card'>";
							tr += "<a href='/moim/moim.do?moimNo=${moim.moimNo}'>";
							tr +=
								"<img class='card-img-top' src='/resources/home_images/9.jpg' alt='Card image cap'>";
							tr += "<div class='card-body'>";
							tr += "<h5 class='card-title'><c:out value='${moim.title }'/></h5>"
							tr += "<p class='card-text'>${moim.content }</p>";
							tr += "</div><div class='card-footer'>";
							tr += "<small class='text-muted'>${moim.createdDate}</small>";
							tr += "</div></a></div>";

							$mypageBody.append(tr);

						})
					}
				}
			})
		})
		$("#mypage-message").click(function () {
			$.ajax({
				type: "GET",
				url: "/mypage/message.do",
				dataType: "json",
				success: function (message) {
					console.log(message);
				}
			})
		})
		
		// 회원 수정 관련
		$("#mypage-modify-submit").click(function() {
			$("#mypage-modify-form").submit();
		})
		
		// 파일 업로드 미리보기
		$("#mypage-modify-profile").change(function (e) {
			$(".preview-image").css('display', 'block');
			readURL(this);
		});
		
		function readURL(input) {
			if(input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$("#mypage-temp-img").attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		$('#mypage-modify-content').keyup(function (e){
		    var content = $(this).val();
		    $('#mypage-content-counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅

		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $('#mypage-content-counter').html("(200 / 최대 200자)");
		    }
		});

	})
</script>