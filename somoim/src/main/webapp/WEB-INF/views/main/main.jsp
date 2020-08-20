<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>

.card{
	border: none;
}
.home-body {
	padding: 16px;
}
.home-card {
 	width: 307px;
 	height: 300px;
 	margin: 12px;
}
.home-card:hover {
	cursor: pointer;
}
.card-img-top {
	width: 300px;
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
	
<!-- Swiper -->
<div class="row">
	<div class="col-12">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach items="${favoliteMoims }" var="favolite">
				<div class="swiper-slide">
					<div class="card mb-4 home-card" id="card-list" data-no="${favolite.moimNo }">
						<img class="card-img-top" src="/resources/home_images/11.png"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${favolite.title }" />
								<p class="ml-5" style="float: right"><span class="mr-3">${favolite.joinCount}/${favolite.headCount}</span> <i class="far fa-heart" id="Like"></i></p>
							</h5>
							<div class="text-right">
								<small class="text-muted"><fmt:formatDate value="${favolite.createdDate}" /></small>
					        </div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>
</div>
<!-- Swiper Finish -->
<!-- 목록 -->
<div style="padding-left:23px">
<div class="row">
	<div class="col-12">
		<h1>${locationMoims[0].locationName }</h1>
		<div class="row home-body">
			<c:forEach items="${locationMoims }" var="location">
				<div class="card mb-4 home-card" data-no="${location.moimNo }">
					<img class="card-img-top" src="/resources/home_images/1.jpeg"
						alt="Card image cap">
					<div class="card-body">
						<div class="card-title">
							<c:out value="${location.title }" />
							<p class="ml-5" style="float: right">
								<span class="mr-3">${location.joinCount }/${location.headCount }</span> <i class="far fa-heart"></i>
							</p>
						</div>
						<div class="text-right">
							<small class="text-muted"><fmt:formatDate value="${location.createdDate}" /></small>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-12">
		<h1>${mainCategoryMoims[1].mainCateName }</h1>
		<div class="row home-body">
			<c:forEach items="${mainCategoryMoims }" var="category">
				<div class="card mb-4 home-card" data-no="${category.moimNo }">
					<img class="card-img-top" src="/resources/home_images/7.jpg"
						alt="Card image cap">
					<div class="card-body">
						<div class="card-title">
							<c:out value="${category.title }" />
							<p class="ml-5" style="float: right"><span class="mr-3">${category.joinCount }/${category.headCount }</span> <i class="far fa-heart"></i></p>
						</div>
						<div class="text-right">
							<small class="text-muted"><fmt:formatDate value="${category.createdDate}" /></small>
				        </div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-12">
		<h1>전체모임</h1>
		<div class="row home-body">
			<c:forEach items="${allMoims }" var="moim">
				<div class="card mb-4 home-card" data-no="${moim.moimNo }">
					<img class="card-img-top" src="/resources/home_images/9.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">
							<c:out value="${moim.title }" />
							<p class="ml-5" style="float: right"><span class="mr-3">${moim.joinCount }/${moim.headCount }</span> <i class="far fa-heart"></i></p>
						</h5>
						<div class="text-right">
							<small class="text-muted"><fmt:formatDate value="${moim.createdDate}"/></small>
				        </div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>

<!-- 모달창 -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<input type="text" name="bookId" id="bookId" value="moimNo" hidden="hidden"/>

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">상세정보</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal Header end -->
			<!-- Modal body -->
			<div class="modal-body" style="padding:0px;">
					<div class="row">
						<div class="col-12"><img class="card-img-top" src="/resources/home_images/9.jpg"
							alt="Card image cap" style="width: 100%; height: 450px;"></div>
					</div>
					<div class="row">
						<div class="col-12" style="padding: 30px;">
						<h3 id="detail-title"></h3>
							<p id="detail-count"></p>
							<p id="detail-content"></p>
							<p><i class="fas fa-won-sign 2x"></i><span id="detail-fee"></span></p>
							<p id="detail-likes"></p>
							<p id="detail-premium"></p>
							<p id="detail-joinDate">모이는날 : 2020.10.19</p>
							<p id="detail-createDate">만든날 : 2020.08.15</p>
						</div>
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
</div>

<!-- 바로가기 키 -->
<div style="position: fixed;bottom: 10px; right: 10px;">
	<a href="/moim/add.do"><i class="fas fa-plus"></i></a>
	<a href="#"><i class="fas fa-arrow-up"></i></a>
</div>

<!-- Initialize Swiper -->
<script>

$(function() {
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
	
	// 모임 디테일 모달 창 
	$(".home-card").click(function() {
		var moimNo = $(this).data("no");
		$("#myModal").modal('show');

		$.ajax({
			type: "GET",
			url: "/detail.do",
			data: {moimNo: moimNo},
			dataType: "json",
			success: function (moim) {
				console.log(moim);
				$("#detail-title").text(moim.moimMainDto.title)
				$("#detail-count").text(moim.moimMainDto.joinCount + "/" + moim.moimMainDto.headCount)
				$("#detail-content").text(moim.moimMainDto.content)
				$("#detail-fee").text(moim.moimMainDto.fee + "원")
				$("#detail-likes").text("좋아요수 : " + moim.moimMainDto.likes + "개")
				$("#detail-joinDate").text("모이는날 : " + moim.moimMainDto.joinDate)
				$("#detail-createDate").text("만든날 : " + moim.moimMainDto.createdDate)



				if(moim.moimMainDto.premiumYn == 'Y') {
					let premium = '<i class="fas fa-crown ml-2" style="color:#6699FF;"></i>';
					$("#detail-premium").append(premium);
				} else {
					$("#detail-premium").empty();
				}


			}
		})

	})
   
});

</script>