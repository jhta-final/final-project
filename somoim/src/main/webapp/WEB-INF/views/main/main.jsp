<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="main">
	<!-- Swiper -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img alt="" src="/resources/index_images/1.jpg" width="500px">
			</div>
			<div class="swiper-slide">
				<img alt="" src="/resources/index_images/2.jpg" width="500px">
			</div>
			<div class="swiper-slide">
				<img alt="" src="/resources/index_images/3.jpg" width="500px">
			</div>
			<div class="swiper-slide">
				<img alt="" src="/resources/index_images/4.jpg" width="500px">
			</div>
			<div class="swiper-slide">
				<img alt="" src="/resources/index_images/5.jpg" width="500px">
			</div>
			<div class="swiper-slide">
				<img alt="" src="/resources/index_images/6.jpg" width="500px">
			</div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Arrows -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
	<p class="append-buttons">
		<a href="#" class="prepend-2-slides">Prepend 2 Slides</a>
		<a href="#" class="prepend-slide">Prepend Slide</a>
		<a href="#" class="append-slide">Append Slide</a>
		<a href="#" class="append-2-slides">Append 2 Slides</a>
	</p>
	<!-- Swiper Finish -->
	<!-- 목록 -->
	<div class="">
		<div class="card-columns">
		  <div class="card">
		    <img class="card-img-top" src="/resources/home_images/1.jpeg" alt="Card image cap">
		    <div class="card-body">
		      <h5 class="card-title">Card title</h5>
		      <p class="card-text">🔥[No.1 채널 멜론둥이의 멜론차트]🔥 2020년 8월 12일 3주차 🔥KPOP Chart🔥 최신 인기가요 노래 모음!!🔥🔥</p>
		    </div>
		    <div class="card-footer">
		      <small class="text-muted">Last updated 3 mins ago</small>
		    </div>
		  </div>
		  <div class="card">
		    <img class="card-img-top" src="/resources/home_images/2.jpg" alt="Card image cap">
		    <div class="card-body">
		      <h5 class="card-title">Card title</h5>
		      <p class="card-text">🔥[No.1 채널 멜론둥이의 멜론차트]🔥 2020년 8월 12일 3주차 🔥KPOP Chart🔥 최신 인기가요 노래 모음!!🔥🔥</p>
		    </div>
		    <div class="card-footer">
		      <small class="text-muted">Last updated 3 mins ago</small>
		    </div>
		  </div>
		  <div class="card">
		    <img class="card-img-top" src="/resources/home_images/3.png" alt="Card image cap" width="300px;" height="250px;">
		    <div class="card-body">
		      <h5 class="card-title">Card title</h5>
		      <p class="card-text">🔥[No.1 채널 멜론둥이의 멜론차트]🔥 2020년 8월 12일 3주차 🔥KPOP Chart🔥 최신 인기가요 노래 모음!!🔥🔥</p>
		    </div>
		    <div class="card-footer">
		      <small class="text-muted">Last updated 3 mins ago</small>
		    </div>
		  </div>
		  <div class="card">
		    <img class="card-img-top" src="/resources/home_images/4.jpeg" alt="Card image cap" width="300px;" height="250px;">
		    <div class="card-body">
		      <h5 class="card-title">Card title</h5>
		      <p class="card-text">🔥[No.1 채널 멜론둥이의 멜론차트]🔥 2020년 8월 12일 3주차 🔥KPOP Chart🔥 최신 인기가요 노래 모음!!🔥🔥</p>
		    </div>
		    <div class="card-footer">
		      <small class="text-muted">Last updated 3 mins ago</small>
		    </div>
		  </div>
		  <div class="card">
		    <img class="card-img-top" src="/resources/home_images/5.jpg" alt="Card image cap" width="300px;" height="250px;">
		    <div class="card-body">
		      <h5 class="card-title">Card title</h5>
		      <p class="card-text">🔥[No.1 채널 멜론둥이의 멜론차트]🔥 2020년 8월 12일 3주차 🔥KPOP Chart🔥 최신 인기가요 노래 모음!!🔥🔥</p>
		    </div>
		    <div class="card-footer">
		      <small class="text-muted">Last updated 3 mins ago</small>
		    </div>
		  </div>
		  <div class="card">
		    <img class="card-img-top" src="/resources/home_images/6.jpeg" alt="Card image cap" width="300px;" height="250px;">
		    <div class="card-body">
		      <h5 class="card-title">Card title</h5>
		      <p class="card-text">🔥[No.1 채널 멜론둥이의 멜론차트]🔥 2020년 8월 12일 3주차 🔥KPOP Chart🔥 최신 인기가요 노래 모음!!🔥🔥</p>
		    </div>
		    <div class="card-footer">
		      <small class="text-muted">Last updated 3 mins ago</small>
		    </div>
		  </div>
		  <div class="card">
		    <img class="card-img-top" src="/resources/home_images/7.jpg" alt="Card image cap" width="300px;" height="250px;">
		    <div class="card-body">
		      <h5 class="card-title">Card title</h5>
		      <p class="card-text">🔥[No.1 채널 멜론둥이의 멜론차트]🔥 2020년 8월 12일 3주차 🔥KPOP Chart🔥 최신 인기가요 노래 모음!!🔥🔥</p>
		    </div>
		    <div class="card-footer">
		      <small class="text-muted">Last updated 3 mins ago</small>
		    </div>
		  </div>
		  <div class="card">
		    <img class="card-img-top" src="/resources/home_images/8.jpeg" alt="Card image cap" width="300px;" height="250px;">
		    <div class="card-body">
		      <h5 class="card-title">Card title</h5>
		      <p class="card-text">🔥[No.1 채널 멜론둥이의 멜론차트]🔥 2020년 8월 12일 3주차 🔥KPOP Chart🔥 최신 인기가요 노래 모음!!🔥🔥</p>
		    </div>
		    <div class="card-footer">
		      <small class="text-muted">Last updated 3 mins ago</small>
		    </div>
		  </div>
		  <div class="card">
		    <img class="card-img-top" src="/resources/home_images/9.jpg" alt="Card image cap" width="300px;" height="250px;">
		    <div class="card-body">
		      <h5 class="card-title">Card title</h5>
		      <p class="card-text">🔥[No.1 채널 멜론둥이의 멜론차트]🔥 2020년 8월 12일 3주차 🔥KPOP Chart🔥 최신 인기가요 노래 모음!!🔥🔥</p>
		    </div>
		    <div class="card-footer">
		      <small class="text-muted">Last updated 3 mins ago</small>
		    </div>
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
  
	var appendNumber = 4;
	var prependNumber = 1;
	var swiper = new Swiper('.swiper-container', {
		slidesPerView : 3,
		centeredSlides : true,
		spaceBetween : 30,
		autoplay : {
			delay : 2500,
			disableOnInteraction : false,
		},
		pagination : {
			el : '.swiper-pagination',
			clickable : true,
		},
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},
	});
	document.querySelector('.prepend-2-slides').addEventListener(
			'click',
			function(e) {
				e.preventDefault();
				swiper.prependSlide([
						'<div class="swiper-slide">Slide ' + (--prependNumber)
								+ '</div>',
						'<div class="swiper-slide">Slide ' + (--prependNumber)
								+ '</div>' ]);
			});
	document.querySelector('.prepend-slide').addEventListener(
			'click',
			function(e) {
				e.preventDefault();
				swiper.prependSlide('<div class="swiper-slide">Slide '
						+ (--prependNumber) + '</div>');
			});
	document.querySelector('.append-slide').addEventListener(
			'click',
			function(e) {
				e.preventDefault();
				swiper.appendSlide('<div class="swiper-slide">Slide '
						+ (++appendNumber) + '</div>');
			});
	document.querySelector('.append-2-slides').addEventListener(
			'click',
			function(e) {
				e.preventDefault();
				swiper.appendSlide([
						'<div class="swiper-slide">Slide ' + (++appendNumber)
								+ '</div>',
						'<div class="swiper-slide">Slide ' + (++appendNumber)
								+ '</div>' ]);
			});
</script>
