<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>

.card{
	width: 298px;
	height: 250px;
	margin-bottom: 100px;
}
.card-img-top {
	width: 296px;
	height: 200px;
}

</style>
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
		<a href="#" class="prepend-2-slides">Prepend 2 Slides</a> <a href="#"
			class="prepend-slide">Prepend Slide</a> <a href="#"
			class="append-slide">Append Slide</a> <a href="#"
			class="append-2-slides">Append 2 Slides</a>
	</p>
	<!-- Swiper Finish -->
	<!-- 목록 -->
	<div class="">
		<div class="card-deck">
			<a href="/moim/moim.do?moimNo=500000">
				<div class="card">
					<img class="card-img-top" src="/resources/home_images/9.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">
							<c:out value="제목제목제목" />
						</h5>
						<p class="card-text">텍스트 텓그스</p>
					</div>
					<div class="card-footer">
						<small class="text-muted"> 데이터데이터</small>
					</div>
				</div>

			</a>
		</div>
		<div class="card-deck">
			<c:forEach items="${locationMoims }" var="location">
		<h1>${location.name }</h1>
					<a href="/moim/moim.do?moimNo=${location.moimNo}"> 
				<div class="card">
					<img class="card-img-top" src="/resources/home_images/1.jpeg"
						alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${location.title }" />
							</h5>
							<p class="card-text">${location.content }</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">${location.createdDate}</small>
						</div>
				</div>
					</a>
			</c:forEach>
		</div>
		<hr />
		<h1>랜덤뿌리기</h1>
		<div class="card-deck">
			<c:forEach items="${allMoims }" var="moim">
				<a href="/moim/moim.do?moimNo=${moim.moimNo}">
					<div class="card">
						<img class="card-img-top" src="/resources/home_images/9.jpg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${moim.title }" />
							</h5>
							<p class="card-text">${moim.content }</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">${moim.createdDate}</small>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</div>

<!-- Initialize Swiper -->
<script>
	var swiper = new Swiper('.swiper-container', {
		spaceBetween : 30,
		centeredSlides : true,
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