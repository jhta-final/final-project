<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>소모임</title>
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

	<script src="/resources/jquery/jquery.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/bootstrap/js/popper.min.js"></script>
	<script src="https://kit.fontawesome.com/7a2820e1a2.js"></script>

	<!-- Demo styles -->
	<style>
		html,
		body {
			position: relative;
			height: 100%;
		}

		body {
			background: #eee;
			font-family:Jua, Helvetica Neue, Helvetica, Arial, sans-serif;
			font-size: 15px;
			color: #000;
			margin: 0;
			padding: 0;
		}


		.jb-box {
			width: 100%;
			height: auto;
			overflow: hidden;
			margin: 0px auto;
			position: fixed;
			box-sizing: border-box;
		}
		
		.jb-box::before {
		    content: "";
		    position: fixed;
		    top: 0;
		    right: 0;
		    bottom: 0;
		    left: 0;
		    background: rgba(0,0,0,.3);
		    display: block;
		}

		video {
			position: fixed;
		    top: 50%; 
		    left: 50%;
		    -webkit-transform: translateX(-50%) translateY(-50%);
		    transform: translateX(-50%) translateY(-50%);
		    min-width: 100%; 
		    min-height: 100%; 
		    width: auto; 
		    height: auto;
		    z-index: -1000; 
		    overflow: hidden;	
		}

		.bg-text {
			color: black;
			font-weight: bold;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			z-index: 2;
			width: 25%;
			text-align: center;
			box-sizing: border-box;
		}
		
		.bg-text .title {
		    font-size: 80px;
		    color: #fff;
		    text-shadow: 0 1px 1px rgba(0,0,0,.35),
		                 0 1px 25px rgba(0,0,0,.75);
		}
		
		.bg-text .btn {
			border: 1px solid  #00284d;
	    	border-radius: 3px;
			width: 217px;
		}
		
		.bg-text .btn-primary {
			background-color: #00498c; 
		}
		.bg-text .btn-primary:hover {
			background: #00498c linear-gradient(#00498c, #005cb3);
		}
		
		.bg-text .btn-secondary:hover {
			background: #6c757d linear-gradient(#6c757d , #848d94);
		}
		.myimg {
			width: 250px;
			height: 300px;
			background: linear-gradient(45deg, rgb(218, 218, 231), #000080);
		}

		.mycard {
			margin-right: 4px;
			margin-left: 9px;
		}

		.mycardp {
			color: #fff;
			background-color: #000;
			font-weight: bold;
			font-size: 19px;
			opacity: 0.6;
			padding: 4px;
		}

		.card-img-overlay {
			padding: 0px;
		}

		.card-text {
			margin: 90px;
			display: none;
		}

		.card-check-mark {
			font-size: 70px;
			color: rgb(209, 255, 4);
		}

		#select-category-image [type=radio] {
			position: absolute;
			opacity: 0;
			width: 0;
			height: 0;
		}

		/* IMAGE STYLES */
		#select-category-image [type=radio]+.card {
			cursor: pointer;
		}

		#select-category-image [type=radio]+.card:hover {
			opacity: 0.8;
		}

		/* CHECKED STYLES */
		#select-category-image [type=radio]:checked+.card {
			opacity: 0.6;
		}
		
		#signup-modal {
		
		}
		
		#index-join-form .input-group{
			display: block;
		}
		
		#index-join-form .input-group-text {
			display: flex;
		    -ms-flex-align: center;
		    align-items: center;
		    padding: 0px 10px;
		    margin-bottom: 0px;
		    font-size: 1rem;
		    font-weight: 400;
		    line-height: 1.5;
		    color: #495057;
		    text-align: center;
		    white-space: nowrap;
		    background-color: #FFF;
		    border: none;
		    border-radius: 0.25rem;
		}
		
		#index-join-form .form-control {
			width: 100%;
		    padding: 10px;
		    font-size: 16px;
		    border: 1px solid rgba(0,0,0,.5);
		    border-radius: 5px;
		    outline: none;
		    box-sizing: border-box;
		    box-shadow: inset 0 1px 2px rgba(0,0,0,.075);  /* .75 아니고 .075 주의 */
		    margin-bottom: 4px;
		}
		
		#index-join-form .index-join-check {
			position: relative;
		}
		
		#index-join-form .btn {
			top: 0;
		    right: 0;
		    position: absolute;
		    z-index: 2999;
		    background-color: #f5f5f5;
		    font-weight: 100;
		    border: 1px solid #000;
		    color: #666;
		    min-width: 78.56px;
		}
		
		#index-join-form .btn:hover {
			background-color: #ccc;
		}
		
	</style>
</head>

<body>
	<div class="bg-imag">
		<div class="jb-box">
			<video muted autoplay loop>
				<source src="/resources/index_images/indexVideo.mp4" type="video/mp4">
			</video> 
		</div> 
		<div class="bg-text">
			<div style="background-color: rgba(255, 248, 248, 0.00); border-radius: 6%;">
				<div class="" style="color: rgb(255, 255, 255); font-weight: 700;">
					<div class="title">모임을 만들고 참여해보세요.</div>
				</div>
				<div class="card-body">
					<form:form action="/login/signin.do" method="post" modelAttribute="loginForm">
						<div class="form-group text-left">
							<form:input type="text" class="form-control" path="userId" placeholder="아이디를 입력해주세요" />
						</div>
						<div class="form-group text-left">
							<form:input type="password" class="form-control" path="userpwd" placeholder="비밀번호를 입력해주세요" />
						</div>
						<button type="submit" class="btn btn-primary">Signin</button>
						<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#signup-modal">
						Signup</button>
					</form:form>
				</div>
				<div class="" style="padding: 10px 10px;">
					<div class="mb-2">
						<span><img src="/resources/index_images/kakao_login_medium_narrow.png" alt="" width="40%"></span>
						<span><img src="/resources/index_images/kakao_login_medium_narrow.png" alt="" width="40%"></span>
					</div>
					<div class="">
						<span><img src="/resources/index_images/네이버 아이디로 로그인_완성형_Green.PNG" alt="" width="40%"></span> <span><img
								src="/resources//index_images/네이버 아이디로 로그인_완성형_Green.PNG" alt="" width="40%"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--회원가입 모달 창-->
	<div class="modal" id="signup-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원가입</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="#" id="index-join-form">
						<div class="input-group">
							<div class="input-group-text">아이디</div>
							<div class="index-join-check">
								<input type="text" class="form-control" id="signup-id" placeholder="이메일를 입력해주세요">
								<a class="btn" id="signup-mail-check">인증</a>
							</div>
						</div>
						<div class="input-group">
							<div class="input-group-text">비밀번호</div>
							<input type="password" class="form-control" id="signup-password" placeholder="비밀번호를 입력해주세요">
							<a class="btn" id="signup-pay-check">결제</a>
						</div>
						<div class="input-group">
							<div class="input-group-text">비밀번호 확인</div>
							<input type="password" class="form-control" id="signup-password-check" placeholder="비밀번호를 입력해주세요">
						</div>
						<div class="input-group">
							<div class="input-group-text">전화번호</div>
							<div class="index-join-check">
								<input type="text" class="form-control" id="signup-tel" placeholder=" - 없이 입력해주세요">
								<a class="btn" id="signup-tel-check">인증</a>
							</div>
						</div>
						<div class="input-group">
							<div class="input-group-text" id="inputGroup-sizing-sm">이름</div>
							<input type="text" class="form-control" id="signup-name" placeholder="이름을 입력해주세요">
						</div>
						
						<div class="input-group">
							<div class="input-group-text">닉네임</div>
							<input type="text" class="form-control" id="signup-nickname" placeholder="닉네임을 입력해주세요">
						</div>
						<div class="input-group">
							<div class="input-group-text">생년월일</div>
							<input type="text" class="form-control" id="signup-birth" placeholder="( ex: xxxxxx )">
						</div>
						<div class="input-group">
							<div class="input-group-text">성별</div>
							<div class="form-control" style="border: none; box-shadow: none;">
								<div class="form-check-inline">
									<input type="radio" class="form-radio" value="남" name="gender" checked>
									<label class="input-group-text">남자</label>
								</div>
								<div class="form-check-inline">
									<input type="radio" class="form-radio" value="여" name="gender">
									<label class="input-group-text">여자</label>
								</div>
							</div>
						</div>
						<div class="input-group">
							<div class="input-group-text" for="signup-location">관심지역</div>
							<select class="form-control" id="signup-location">
								<option value="" selected="selected" disabled="disabled" class="text-center">선택</option>
								<option value="">없음</option>
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

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="button-category">카테고리
						선택</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<div class="modal" id="select-category-modal">
		<div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 900px;">
			<div class=" modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">카테고리 선택</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" style="margin: 5px 31px;" id="select-category-image">
					<form action="/login/signup2.do" method="get" id="button-signup-final">
						<label> <input type="radio" name="cateno" value="4">
							<div class="card mycard">
								<img class="card-img-top myimg" src="/resources/index_images/반려동물.png" alt="Card image">
								<div class="card-img-overlay">
									<p class="card-title mycardp">반려동물</p>
									<div class="card-text">
										<i class="fas fa-check card-check-mark"></i>
									</div>
								</div>
							</div>
						</label> <label> <input type="radio" name="cateno" value="1">
							<div class="card mycard">
								<img class="card-img-top myimg" src="/resources/index_images/게임.jpg" alt="Card image">
								<div class="card-img-overlay">
									<p class="card-title mycardp">게임/오락</p>
									<div class="card-text">
										<i class="fas fa-check card-check-mark"></i>
									</div>
								</div>
							</div>
						</label> <label> <input type="radio" name="cateno" value="2">
							<div class="card mycard">
								<img class="card-img-top myimg" src="/resources/index_images/사교인맥.png" alt="Card image">
								<div class="card-img-overlay">
									<p class="card-title mycardp">사교/인맥</p>
									<div class="card-text">
										<i class="fas fa-check card-check-mark"></i>
									</div>
								</div>
							</div>
						</label> <label> <input type="radio" name="cateno" value="3">
							<div class="card mycard">
								<img class="card-img-top myimg" src="/resources/index_images/스포츠.png" alt="Card image">
								<div class="card-img-overlay">
									<p class="card-title mycardp">운동/스포츠</p>
									<div class="card-text">
										<i class="fas fa-check card-check-mark"></i>
									</div>
								</div>
							</div>
						</label> <label> <input type="radio" name="cateno" value="5">
							<div class="card mycard">
								<img class="card-img-top myimg" src="/resources/index_images/문화공연.jpg" alt="Card image">
								<div class="card-img-overlay">
									<p class="card-title mycardp">문화/공연/축제</p>
									<div class="card-text">
										<i class="fas fa-check card-check-mark"></i>
									</div>
								</div>
							</div>
						</label> <label> <input type="radio" name="cateno" value="" disabled>
							<div class="card mycard" style="opacity: 0.5;">
								<img class="card-img-top myimg" src="/resources/index_images/음악.png" alt="Card image">
								<div class="card-img-overlay">
									<p class="card-title mycardp">준비중...</p>
								</div>
							</div>
						</label>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="signup-button">회원가입</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		$(function () {
			$("#button-category").click(function () {
				var signUpForm = {
					id: $("#signup-id").val(),
					name: $("#signup-name").val(),
					nickname: $("#signup-nickname").val(),
					password: $("#signup-password").val(),
					birth: $("#signup-birth").val(),
					email: $("#signup-email").val(),
					tel: $("#signup-tel").val(),
					locationNo: $("#signup-location").val(),
					gender: $(":input[name=gender]:checked").val()
				};

				$.ajax({
					type: "POST",
					url: "/login/signup1.do",
					data: JSON.stringify(signUpForm),
					contentType: "application/json",
					dataType: "json",
					success: function (status) {
						console.log(status);
						if (status == false) {
							alert("아이디 혹은 비밀번호가 틀리셨습니다.")
						} else {
							console.log("성공?");
							$("#signup-modal").modal("hide");
							$("#select-category-modal").modal("show");
						}
					}
				})
			})

			//최종 회원가입
			$("#signup-button").click(function () {
				$("#button-signup-final").submit();
			})

			// 인증
			$("#signup-tel-check").click(function () {
				var tel = {
					phone : $("#signup-tel").val()
				}
				
				$.ajax({
					type: "POST",
					url: "/login/sendSMS.do",
					data: JSON.stringify(tel),
					contentType: "application/json",
					dataType: "json",
					success: function (status) {
						console.log(status);
						//사인업컨트롤러에서 data에 문자메세지가 보내졌으면
						//status를 success로, 보내기가실패했으면 fail로 할테니
						//fail일때 올바른 전화번호를 입력해달라고 알려주시기 바랍니다.
					}
				})
			})
			// 카페
			$("#signup-pay-check").click(function () {
				var IMP = window.IMP; // 생략가능
		        IMP.init('imp21551057'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        var msg;
		        
		        IMP.request_pay({
		            pg : 'kakaopay',
		            pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : '소모임 프리미엄 결제',
		            amount : 50000,
		            buyer_email : 'amiruna@naver.com',
		            buyer_name : '문주영',
		            buyer_tel : '010-2222-2222',
		            buyer_addr : '서울시 구로구',
		            buyer_postcode : '123-456',
		            //m_redirect_url : 'http://www.naver.com'
		        }, function(rsp) {
		            if ( rsp.success ) {
		                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		                jQuery.ajax({
		                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
		                    type: 'POST',
		                    dataType: 'json',
		                    data: {
		                        imp_uid : rsp.imp_uid
		                        //기타 필요한 데이터가 있으면 추가 전달
		                    }
		                }).done(function(data) {
		                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		                    if ( everythings_fine ) {
		                        msg = '결제가 완료되었습니다.';
		                        msg += '\n고유ID : ' + rsp.imp_uid;
		                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                        msg += '\결제 금액 : ' + rsp.paid_amount;
		                        msg += '카드 승인번호 : ' + rsp.apply_num;
		                        
		                        alert(msg);
		                    } else {
		                        //[3] 아직 제대로 결제가 되지 않았습니다.
		                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		                    }
		                });
		                //성공시 이동할 페이지
		                location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
		            } else {
		                msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		                //실패시 이동할 페이지
		                location.href="<%=request.getContextPath()%>/";
		                alert(msg);
		            }
		        });
			})
			$("#signup-mail-check").click(function () {
				var email = {
					mail : $("#signup-id").val()
				}
				
				$.ajax({
					type: "POST",
					url: "/login/sendMail.do",
					data: JSON.stringify(email),
					contentType: "application/json",
					dataType: "json",
					success: function (status) {
						console.log(status);
						//사인업컨트롤러에서 data에 문자메세지가 보내졌으면
						//status를 success로, 보내기가실패했으면 fail로 할테니
						//fail일때 올바른 전화번호를 입력해달라고 알려주시기 바랍니다.
					}
				})
			})
			
			// 카테고리 체크
			$("#select-category-image .card").click(function () {
				$("#select-category-image .card").find('.card-text')
					.css('display', 'none');
				$(this).find('.card-text').css('display', 'block');
			})
		})
	</script>
</body>

</html>