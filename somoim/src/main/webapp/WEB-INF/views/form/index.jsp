<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
  <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">

  <script src="/resources/jquery/jquery.min.js"></script>
  <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="/resources/bootstrap/js/popper.min.js"></script>
  <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
  <script src="/resources/bootstrap/swiper/swiper-bundle.min.js"></script>
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

    .swiper-container {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

    .bg-image {
      /* Add the blur effect */
      filter: blur(0px);
      -webkit-filter: blur(0px);

      /* Full height */
      height: 100%;

      /* Center and scale the image nicely */
      background-position: center;
      background-repeat: no-repeat;
      background-size: auto;
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
  </style>
</head>

<body>
  <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide bg-image" style=" background-image: url('/resources/index_images/1.jpg');"></div>
      <div class="swiper-slide bg-image" style=" background-image: url('/resources/index_images/2.jpg');"></div>
      <div class="swiper-slide bg-image" style=" background-image: url('/resources/index_images/4.jpg');"></div>
      <div class="swiper-slide bg-image" style=" background-image: url('/resources/index_images/5.jpg');"></div>
      <div class="swiper-slide bg-image" style=" background-image: url('/resources/index_images/6.jpg');"></div>
      <div class="swiper-slide bg-image" style=" background-image: url('/resources/index_images/7.png');"></div>
      <div class="swiper-slide bg-image" style=" background-image: url('/resources/index_images/8.png');"></div>
    </div>
    <div class="bg-text">
      <div class="card" style=" background-color: rgba(255, 248, 248, 0.3); border-radius: 6%;">
        <div class="card-header mt-5"
          style="font-size: 40px; font-weight: bolder; margin-top: 20px; margin-bottom: 20px; background-color: rgba(0, 0, 0, 0); border-bottom: 0; ">
          모임에 참여하세요!!!</div>
        <div class="card-body">
          <form action="">
            <div class="form-group text-left">
              <label for="signin-id" style="font-size: 20px;">id</label>
              <input type="text" class="form-control" id="signin-id">
            </div>
            <div class="form-group text-left">
              <label for="signin-password" style="font-size: 20px;">password</label>
              <input type="text" class="form-control" id="signin-password">
            </div>
            <button type="button" class="btn btn-primary"
              style="width: 150px; background-color: #0f4c81;">Signin</button>
            <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#signup-modal"
              style="width: 150px;">Signup</button>
          </form>
        </div>
        <div class="card-footer" style="padding: 10px 10px;">
          <div class="mb-2">
            <span><img src="kakao_login_medium_narrow.png" alt="" width="40%"></span>
            <span><img src="kakao_login_medium_narrow.png" alt="" width="40%"></span>
          </div>
          <div class="">
            <span><img src="네이버 아이디로 로그인_완성형_Green.PNG" alt="" width="40%"></span>
            <span><img src="네이버 아이디로 로그인_완성형_Green.PNG" alt="" width="40%"></span>
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
              <label for="signin-id" style="font-size: 20px;">아이디</label>
              <input type="text" class="form-control" id="signin-id" value="아이디">
            </div>
            <div class="form-group text-left">
              <label for="signin-password" style="font-size: 20px;">password</label>
              <input type="text" class="form-control" id="signin-password">
            </div>
            <div class="form-group text-left">
              <label for="signin-id" style="font-size: 20px;">전화번호</label>
              <input type="text" class="form-control" id="signin-id">
            </div>
            <div class="form-group text-left">
              <label for="signin-id" style="font-size: 20px;">이름</label>
              <input type="text" class="form-control" id="signin-id">
            </div>
            <div class="form-group text-left">
              <label for="signin-id" style="font-size: 20px;">닉넥임</label>
              <input type="text" class="form-control" id="signin-id">
            </div>
            <div class="form-group text-left">
              <label for="signin-id" style="font-size: 20px;">생년월일</label>
              <input type="text" class="form-control" id="signin-id">
            </div>
            <div class="form-group text-left">
              <label for="signin-id" style="font-size: 20px;">이메일</label>
              <input type="text" class="form-control" id="signin-id">
            </div>
            <div class="form-group text-left">
              <label for="signin-id" style="font-size: 20px;">프로필 사진</label>
              <input type="text" class="form-control" id="signin-id">
            </div>
          </form>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>

      </div>
    </div>
  </div>
  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
</body>

</html>