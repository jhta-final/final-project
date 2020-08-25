<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style>

.swiper-container {
	  margin-top: 30px;
      width: 100%;
      height: 100%;
    }


	.card-title {
		font-size: 20px;
    	display : inline-block;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 100%;
		height: 28px;
		margin-bottom: 0px;
    }
    
    .swiper-slide {
    
      font-size: 18px;
      background: #f5f5f5;

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

.card{
	border: none;
}
.home-body {
	font-size: 18px;
	margin-left: 3px;
	padding: 35px;
}
.home-card {
 	width: 345px;
 	height: 330px;
 	margin: 8px;
}
.home-card:hover {
	cursor: pointer;
}
.card-img-top {
	width: 343px;
	height: 250px;
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
							<div class="card-title">
								<p><c:out value="${favolite.title }" /></p>
							</div>
							<div class="text-left">
								<i class="fas fa-heart" style="color: #00498C"></i>&ensp;<span class="text-left" >${favolite.likes }</span>&ensp;&ensp;
								<span>${favolite.joinCount}/${favolite.headCount}</span>
								<p style="float: right">
								<fmt:formatDate value="${favolite.joinDate}" /></p>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
		</div>
	</div>
</div>
<!-- Swiper Finish -->
<!-- 목록 -->
<div class="" style="margin-top: 35px;">
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
							<span><c:out value="${location.title }" /></span>
						</div>
						<div class="text-left">
							<i class="fas fa-heart" style="color: #800020"></i>&ensp;<span class="text-left" >${location.likes }</span>&ensp;&ensp;
							<span class="mr-3">${location.joinCount }/${location.headCount }명</span>
							<p style="float: right">
							<fmt:formatDate value="${location.joinDate}" /></p>
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
							<span><c:out value="${category.title }" /></span>
						</div>
						<div class="text-left">
							<i class="fas fa-heart" style="color: #d09afc"></i>&ensp;<span class="text-left" >${category.likes }</span>&ensp;&ensp;
							<span class="mr-3">${category.joinCount }/${category.headCount }</span>
							<p style="float: right">
							<fmt:formatDate value="${category.joinDate}" /></p>
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
						<div class="card-title">
							<span><c:out value="${moim.title }" /></span>
						</div>
						<div class="text-left">
							<i class="fas fa-heart" style="color: #fcba03"></i>&ensp;<span class="text-left" >${moim.likes }</span>&ensp;&ensp;
							<span class="mr-3">${moim.joinCount }/${moim.headCount }</span>
							<p style="float: right">
							<fmt:formatDate value="${moim.joinDate}" /></p>
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
						<h3 id="home-detail-title"></h3>
							<p id="home-detail-count"></p>
							<p id="home-detail-content"></p>
							<p><i class="fas fa-won-sign 2x"></i><span id="home-detail-fee"></span></p>
							좋아요수 : <span id="home-detail-likes"></span>개
							<p id="home-detail-premium"></p>
							<p id="home-detail-joinDate">모이는날 : 2020.10.19</p>
							<p id="home-detail-createDate">만든날 : 2020.08.15</p>
						</div>
					</div>
			</div>
			<!-- Modal body end -->
			<!-- Modal footer -->
			<div class="modal-footer">
				<i id="home-modal-like" class="" style="cursor: pointer;"></i>
				<a id="home-moim-link-btn" class="btn btn-primary" href="">모임가기</a>
				<a id="home-moim-join-btn" class="btn btn-success" href="">모임가입</a>
				<a id="home-moim-withdrawal-btn" class="btn btn-warning" href="">모임탈퇴</a>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
			<!-- Modal footer end -->
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
	var modalMoimNo = "";
	
	 var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 3,
	      spaceBetween: 30,
	      freeMode: true,
	      autoplay: {
	          delay: 2500,
	          disableOnInteraction: false,
	      },
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      }
	    });
	
	// 모임 디테일 모달 창 
	$(".home-card").click(function() {
		var moimNo = $(this).data("no");
		$("#myModal").modal('show');
		modal(moimNo);
	})
	
	
	$("#home-modal-like").click(function() {
		$.ajax({
			type: "GET",
			url: "/like.do",
			data: {moimNo: modalMoimNo},
			success: function () {
				modal(modalMoimNo);
			}
		})
	})
  
	function modal(no) {
		$.ajax({
			type: "GET",
			url: "/detail.do",
			data: {moimNo: no},
			dataType: "json",
			success: function (moim) {
				console.log(moim);
				$("#home-detail-title").text(moim.moimMainDto.title)
				$("#home-detail-count").text(moim.moimMainDto.joinCount + "/" + moim.moimMainDto.headCount)
				$("#home-detail-content").text(moim.moimMainDto.content)
				$("#home-detail-fee").text(moim.moimMainDto.fee + "원")
				$("#home-detail-likes").text(moim.moimMainDto.likes)
				$("#home-detail-joinDate").text("모이는날 : " + moim.moimMainDto.joinDate)
				$("#home-detail-createDate").text("만든날 : " + moim.moimMainDto.createdDate)
				
				var link = '/moim/moim.do?moimNo='+moim.moimMainDto.moimNo+'';
				var join = '/moim/join.do?moimNo='+moim.moimMainDto.moimNo+'&userId=${loginedUser}';
				var withdrawal = '/moim/outMoim.do?moimNo='+moim.moimMainDto.moimNo+'&userId=${loginedUser}';
				modalMoimNo = moim.moimMainDto.moimNo;
				
				$("#home-moim-join-btn").attr('href', join);
				$("#home-moim-withdrawal-btn").attr('href', withdrawal);
				
				
				
				$("#home-detail-premium").empty();
				if(moim.moimMainDto.premiumYn == 'Y') {
					$("#home-moim-link-btn").attr("href", link);
					let premium = '<i class="fas fa-crown ml-2" style="color:#6699FF;"></i>';
					$("#home-detail-premium").append(premium);
					$("#home-moim-link-btn").css('display', 'block');
				} else {
					$("#home-moim-link-btn").css('display', 'none');
				}
				
				
				
				if(moim.moimMainDto.likesYn == 'Y') {
					$("#home-modal-like").attr('class', 'fas fa-heart')
				} else {
					$("#home-modal-like").attr('class', 'far fa-heart')
				}			
			}
		})
	}
});

</script>