<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.card-deck{
	margin-bottom: 50px;
	border: none;
}
.card{
	border: none;
}
#card-list{
	width: 350px;
	height: 295px;
}
.card-img-top {
	width: 348px;
	height: 200px;
}
h5 {
	font-size: 15px;
}

.card-body{
	padding: 8px;
}
.card-body p{
	display: inline-block;
	margin-bottom: 0px;
}

.card-text{
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 300px;
  height: 20px;
  font-size: 10px;
  line-height: 1;
  margin-bottom:0px;
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
				<a href="#myModal" data-toggle="modal"> 
				<div class="card mb-4" id="card-list">
					<img class="card-img-top" src="/resources/home_images/11.png"
						alt="Card image cap">
					<div class="card-body">
							<h5 class="card-title">
								<c:out value="${favolite.title }" />
								<p class="ml-5" style="float: right"><span class="mr-3">${favolite.joinCount}/${favolite.headCount}</span> <i class="far fa-heart" id="Like"></i></p>
							</h5>
							<div class="text-right">
							<small class="text-muted">${favolite.createdDate}</small>
					          
					        </div>
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
			<c:forEach items="${locationMoims }" var="location">
				<a href="#myModal" data-toggle="modal">
					<div class="card mb-4" id="card-list">
						<img class="card-img-top" src="/resources/home_images/1.jpeg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${location.title }" />
								<p class="ml-5" style="float: right">
									<span class="mr-3">${location.joinCount }/${location.headCount }</span> <i class="far fa-heart"></i>
								</p>
							</h5>
							<div class="text-right">
								<small class="text-muted">${location.createdDate}</small>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		<hr />
		<h1>${mainCategoryMoims[1].mainCateName }</h1>
		<div class="card-deck mb-4">
			<c:forEach items="${mainCategoryMoims }" var="category">
				<a href="#myModal" data-toggle="modal" >
					<div class="card mb-4" id="card-list">
						<img class="card-img-top" src="/resources/home_images/7.jpg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${category.title }" />
								<p class="ml-5" style="float: right"><span class="mr-3">${category.joinCount }/${category.headCount }</span> <i class="far fa-heart"></i></p>
							</h5>
							<div class="text-right">
							<small class="text-muted">${category.createdDate}</small>
					        </div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		<hr />
		<h1>전체모임</h1>
		<div class="card-deck mb-4">
			<c:forEach items="${allMoims }" var="moim">
				<a href="#myModal" data-toggle="modal">
					<div class="card mb-4" id="card-list">
						<img class="card-img-top" src="/resources/home_images/9.jpg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${moim.title }" />
								<p class="ml-5" style="float: right"><span class="mr-3">${moim.joinCount }/${moim.headCount }</span> <i class="far fa-heart"></i></p>
							</h5>
							<div class="text-right">
								<small class="text-muted">${moim.createdDate}</small>
					        </div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">상세정보</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal Header end -->
			<!-- Modal body -->
			<div class="modal-body" style="padding:0px;">
					<div class="row">
						<div class="col-md-12"><img class="card-img-top" src="/resources/home_images/9.jpg"
							alt="Card image cap" style="width: 100%; height: 450px;"></div>
					</div>
					<div class="row">
					</div>
					<div class="row">
					</div>
					<div class="row">
					</div>
			</div>
			<!-- Modal body end -->
			<!-- Modal footer -->
			<div class="modal-footer">
				<a class="btn btn-danger" href="#"><i class="fas fa-heart"></i></a>
				<a class="btn btn-primary" href="/moim/moim.do?moimNo=500000">모임가기</a>
				<button type="button" class="btn btn-warning" data-dismiss="modal">회원탈퇴</button>
				<button type="button" class="btn btn-success" data-dismiss="modal">모임가입</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
			<!-- Modal footer end -->
		</div>
	</div>
</div>

<!-- Initialize Swiper -->
<script>
	var action = 1;
	function viewSomething() {
		if (action == 1) {
			$('#Like').attr('class', 'fas fa-heart');
			action = 2;
		} else {
			$('#Like').attr('class', 'far fa-heart');
			action = 1;
		}
		$("#Like").toggle("fast");
	}

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