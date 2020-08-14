<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.card-deck{
	margin-bottom: 50px;
}
.card{
	width: 350px;
	height: 300px;
	margin-bottom: 150px;
}
.card-img-top {
	width: 348px;
	height: 200px;
}
h5 {
	font-size: 12px;
}

a > p {
	font-size: 8px;
}

</style>
<div class="main ">
	<div style="position: fixed;bottom: 10px; right: 10px;">
		<a href="/moim/add.do"><i class="fas fa-plus"></i></a>
		<a href="#"><i class="fas fa-arrow-up"></i></a>
	</div>
	<!-- Swiper -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
				<c:forEach items="${favoliteMoims }" var="favolite">
			<div class="swiper-slide">
				<a href="/moim/moim.do?moimNo=${favolite.moimNo}"> 
				<div class="card mb-4">
					<img class="card-img-top" src="/resources/home_images/11.png"
						alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${favolite.title }" />
							</h5>
							<p class="card-text">${favolite.content }</p>
							<small class="text-muted">${favolite.createdDate}</small>
						</div>
				</div>
					</a>
			</div>
				</c:forEach>
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
	<div class="ml-4" id="test1">
			<h1>${locationMoims[0].locationName }</h1>
		<div class="card-deck mb-4">
			<a href="/moim/moim.do?moimNo=500000">
				<div class="card mb-4">
					<img class="card-img-top" src="/resources/home_images/9.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">
							<c:out value="title" />
						</h5>
						<p class="card-text">정원이 원하는 페이지</p>
						<small class="text-muted">ㅇㅇㅇㅇㅇㅇㅇ</small>
					</div>
				</div>

			</a>
			<c:forEach items="${locationMoims }" var="location">
					<a href="/moim/moim.do?moimNo=${location.moimNo}"> 
				<div class="card mb-4">
					<img class="card-img-top" src="/resources/home_images/1.jpeg"
						alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${location.title }" />
							</h5>
							<p class="card-text">${location.content }</p>
							<small class="text-muted">${location.createdDate}</small>
						</div>
				</div>
					</a>
			</c:forEach>
		</div>
		<hr />
		<h1>카테고리별</h1>
		<div class="card-deck mb-4">
			<c:forEach items="${mainCategoryMoims }" var="category">
				<a href="/moim/moim.do?moimNo=${category.moimNo}">
					<div class="card mb-4">
						<img class="card-img-top" src="/resources/home_images/7.jpg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${category.title }" />
							</h5>
							<p class="card-text">${category.content }</p>
							<small class="text-muted">${category.createdDate}</small>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		<hr />
		<h1>전체모임</h1>
		<div class="card-deck mb-4">
			<c:forEach items="${allMoims }" var="moim">
				<a href="/moim/moim.do?moimNo=${moim.moimNo}">
					<div class="card mb-4">
						<img class="card-img-top" src="/resources/home_images/9.jpg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${moim.title }" />
							</h5>
							<p class="card-text">${moim.content }</p>
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