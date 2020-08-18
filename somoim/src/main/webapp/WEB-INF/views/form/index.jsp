<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>소모임</title>
   <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

   <script src="/resources/jquery/jquery.min.js"></script>
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src="/resources/bootstrap/js/popper.min.js"></script>
   <script src="https://kit.fontawesome.com/7a2820e1a2.js" crossorigin="anonymous"></script>

   <!-- Demo styles -->
   <style>
      html,
      body {
         position: relative;
         height: 100%;
      }

      body {
         background: #eee;
         font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
         font-size: 14px;
         color: #000;
         margin: 0;
         padding: 0;
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
      }

      .jb-box {
         width: 100%;
         height: 937px;
         overflow: hidden;
         margin: 0px auto;
         position: relative;
      }

      video {
         width: 100%;
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

      [type=radio] {
         position: absolute;
         opacity: 0;
         width: 0;
         height: 0;
      }

      /* IMAGE STYLES */
      [type=radio]+.card {
         cursor: pointer;
      }

      [type=radio]+.card:hover {
         opacity: 0.8;
      }

      /* CHECKED STYLES */
      [type=radio]:checked+.card {
         opacity: 0.6;
      }
   </style>
</head>

<body>
   <div class="bg-imag">
      <div class="jb-box">
         <video muted autoplay loop>
            <source src="/resources/index_images/indexVideo.mp4" video/mp4"> </video> </div> <div class="bg-text">
            <div style="background-color: rgba(255, 248, 248, 0.00); border-radius: 6%;">
               <div class="" style="color: rgb(255, 255, 255); font-weight: 700;">
                  <div style="font-size: 73px;">모임을 만들고 참여해 보세요.</div>
               </div>
               <div class="card-body">
                  <form:form action="/signin.do" method="post" modelAttribute="loginForm">
                     <div class="form-group text-left">
                        <form:input type="text" class="form-control" id="signin-id" path="userId" placeholder="아이디를 입력해주세요" />
                     </div>
                     <div class="form-group text-left">
                        <form:input type="password" class="form-control" id="signin-password" path="userpwd"
                           placeholder="비밀번호를 입력해주세요" />
                     </div>
                     <button type="submit" class="btn btn-primary"
                        style="width: 150px; background-color: #0f4c81;">Signin</button>
                     <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#signup-modal"
                        style="width: 150px;">Signup</button>
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
      <div class="modal-dialog  modal-lg modal-dialog-centered" style="max-width: 500px;">
         <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">고민될때는 그냥 혀~~</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" style="margin: 0 45px;">
               <form action="">
                  <div class="form-group text-left">
                     <label for="signin-id" style="font-size: 20px;">아이디</label> <input type="text" class="form-control"
                        id="signup-id">
                  </div>
                  <div class="form-group text-left">
                     <label for="signin-password" style="font-size: 20px;">password</label>
                     <input type="text" class="form-control" id="signup-password">
                  </div>
                  <div class="form-group text-left">
                     <label for="signin-id" style="font-size: 20px;">전화번호</label> <input type="text" class="form-control"
                        id="signup-tel">
                  </div>
                  <div class="form-group text-left">
                     <label for="signin-id" style="font-size: 20px;">이름</label> <input type="text" class="form-control"
                        id="signup-name">
                  </div>
                  <div class="form-group text-left">
                     <label for="signin-id" style="font-size: 20px;">관심지역</label> <select name="locationNo"
                        class="form-control" id="signup-location">
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
                  <div class="form-group text-left">
                     <label for="signin-id" style="font-size: 20px;">닉네임</label> <input type="text" class="form-control"
                        id="signup-nickname">
                  </div>
                  <div class="form-group text-left">
                     <label for="signin-id" style="font-size: 20px;">생년월일</label> <input type="text" class="form-control"
                        id="signup-birth">
                  </div>
                  <div class="form-group text-left">
                     <label for="signin-id" style="font-size: 20px;">이메일</label> <input type="text" class="form-control"
                        id="signup-email">
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
               <form action="">
                  <label> <input type="radio" name="test" value="small">
                     <div class="card mycard">
                        <img class="card-img-top myimg" src="/resources/index_images/반려동물.png" alt="Card image">
                        <div class="card-img-overlay">
                           <p class="card-title mycardp">반려동물</p>
                           <div class="card-text">
                              <i class="fas fa-check card-check-mark"></i>
                           </div>
                        </div>
                     </div>
                  </label> <label> <input type="radio" name="test" value="small">
                     <div class="card mycard">
                        <img class="card-img-top myimg" src="/resources/index_images/게임.jpg" alt="Card image">
                        <div class="card-img-overlay">
                           <p class="card-title mycardp">게임</p>
                           <div class="card-text">
                              <i class="fas fa-check card-check-mark"></i>
                           </div>
                        </div>
                     </div>
                  </label> <label> <input type="radio" name="test" value="small">
                     <div class="card mycard">
                        <img class="card-img-top myimg" src="/resources/index_images/사교인맥.png" alt="Card image">
                        <div class="card-img-overlay">
                           <p class="card-title mycardp">사교/인맥</p>
                           <div class="card-text">
                              <i class="fas fa-check card-check-mark"></i>
                           </div>
                        </div>
                     </div>
                  </label> <label> <input type="radio" name="test" value="small">
                     <div class="card mycard">
                        <img class="card-img-top myimg" src="/resources/index_images/스포츠.png" alt="Card image">
                        <div class="card-img-overlay">
                           <p class="card-title mycardp">스포츠</p>
                           <div class="card-text">
                              <i class="fas fa-check card-check-mark"></i>
                           </div>
                        </div>
                     </div>
                  </label> <label> <input type="radio" name="test" value="small">
                     <div class="card mycard">
                        <img class="card-img-top myimg" src="/resources/index_images/문화공연.jpg" alt="Card image">
                        <div class="card-img-overlay">
                           <p class="card-title mycardp">문화/공연</p>
                           <div class="card-text">
                              <i class="fas fa-check card-check-mark"></i>
                           </div>
                        </div>
                     </div>
                  </label> <label> <input type="radio" name="test" value="small" disabled>
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
   <script>
      $(function () {
         $("#button-category").click(function () {
        	 console.log(1);
            var signUpForm = {
               id: $("#signup-id").val(),
               name: $("#signup-name").val(),
               nickname: $("#signup-nickname").val(),
               password: $("#signup-password").val(),
               birth: $("#signup-birth").val(),
               email: $("#signup-email").val(),
               tel: $("#signup-tel").val(),
               locationNo: $("#signup-location").val()
            }
            $.ajax({
               type: "POST",
               url: "/signup1.do",
               data: JSON.stringify(signUpForm),
               contentType: "application/json",
               dataType: "json",
               success: function (status) {
                  console.log(1);
               }
            })
         })

         $("#select-category-image .card").click(
            function () {

               $("#select-category-image .card").find('.card-text')
                  .css('display', 'none');
               $(this).find('.card-text').css('display', 'block');
            })
      })
   </script>
</body>

</html>