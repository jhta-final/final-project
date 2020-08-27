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
						<img class="card-img-top" src="/resources/home_images/${favolite.image }"
							alt="Card image cap">
						<div class="card-body">
							<div class="card-title">
								<p><c:out value="${favolite.title }" /></p>
							</div>
							<div class="text-left">
								<i class="fas fa-heart" style="color: #d09afc"></i>&ensp;<span class="text-left" >${favolite.likes }</span>&ensp;&ensp;
								<i class="fas fa-users" style="color: #fcba03"></i>&ensp;<span>${favolite.joinCount}/${favolite.headCount}</span>
								<c:if test="${favolite.premiumYn == 'Y'}">
									<i class="fas fa-crown ml-2" style="color:#6699FF;"></i>
								</c:if>
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
		<h1 id="locationTitle"></h1>
		<div id="locationMoim" class="row home-body">
			
		</div>
		<button id="btn-get-data" class="btn text-center mb-3" style="width: 100%;background-color: lightgray; border-bottom: 1px solid gray; display: none;">더보기</button>
		<hr/>
	</div>
</div>
<div class="row">
	<div class="col-12">
		<h1>${mainCategoryMoims[1].mainCateName }</h1>
		<div class="row home-body">
			<c:forEach items="${mainCategoryMoims }" var="category">
				<div class="card mb-4 home-card" data-no="${category.moimNo }">
					<img class="card-img-top" src="/resources/home_images/${category.image }"
						alt="Card image cap">
					<div class="card-body">
						<div class="card-title">
							<span><c:out value="${category.title }" /></span>
						</div>
						<div class="text-left">
							<i class="fas fa-heart" style="color: #d09afc"></i>&ensp;<span class="text-left" >${category.likes }</span>&ensp;&ensp;
							<i class="fas fa-users" style="color: #fcba03"></i>&ensp;<span class="mr-3">${category.joinCount }/${category.headCount }</span>
							<c:if test="${category.premiumYn == 'Y'}">
								<i class="fas fa-crown ml-2" style="color:#6699FF;"></i>
							</c:if>
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
					<img class="card-img-top" src="/resources/home_images/${moim.image }"
						alt="Card image cap">
					<div class="card-body">
						<div class="card-title">
							<span><c:out value="${moim.title }" /></span>
						</div>
						<div class="text-left">
							<i class="fas fa-heart" style="color: #d09afc"></i>&ensp;<span class="text-left" >${moim.likes }</span>&ensp;&ensp;
							<i class="fas fa-users" style="color: #fcba03"></i>&ensp;<span class="mr-3">${moim.joinCount }/${moim.headCount }</span>
							<c:if test="${moim.premiumYn == 'Y'}">
								<i class="fas fa-crown ml-2" style="color:#6699FF;"></i>
							</c:if>
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
<div class="modal fade" id="myModal" style="background-color: rgba(1, 1, 1, 0.7);">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.0)">
			<!-- Modal Header -->
			<div id="home-modal-header" class="modal-header" style="background-color: rgba(255, 255, 255, 0.0) !important; color: #FFF">
				<h4 class="modal-title">상세정보</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal Header end -->
			<!-- Modal body -->
			<div class="modal-body" style="padding:0px; background-color: #FFF">
					<div id="home-modal-image" class="row"></div>
					<div class="row">
						<div class="col-12" style="padding: 30px;">
						<h3 id="home-detail-title"></h3>
							<p id="home-detail-count"></p>
							<p id="home-detail-content"></p>
							<p id="home-detail-location"></p>
							<p id="home-detail-cate"></p>
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
	
	
	// 더보기 시작--------------------------------------
	var currentPageNo = 1;
	var locationNo = 0;
	var $list = $("#locationMoim");
	$("#btn-get-data").click(function() {
		moreData();
	});
	var $locationTitle = $("#locationTitle");
	function moreData() {
		
		$.ajax({
			type:"GET",
			url:"/location.do",
			data:{
				locationNo: locationNo,
				currentPageNo :currentPageNo
			},
			success:function(result){
				if(result.moims.length == 0) {return;}
				locationNo = result.moims[0].locationNo
				
				if (result.total == 0) {
	               $("#btn-get-data").hide();
				} else {
	               $("#btn-get-data").show();
				}
				
	            $locationTitle.text(result.moims[0].locationName);
	            if(Math.ceil(currentPageNo/4) == Math.ceil(result.total/4)) {
	               $("#btn-get-data").hide();
	            } else {
	               $("#btn-get-data").show();
	            }
				
				$.each(result.moims, function(index, locationMoim){
					
					var row2 = '<div class="card mb-4 home-card" data-no="'+ locationMoim.moimNo +'">';
					row2 += '<img class="card-img-top" src="/resources/home_images/'+locationMoim.image+'" alt="Card image cap">';
					row2 += '<div class="card-body"><div class="card-title">';
					row2 += '<span>'+locationMoim.title+'</span>';
					row2 += '</div><div class="text-left">';
					row2 += '<i class="fas fa-heart" style="color: #d09afc"></i>&ensp;<span class="text-left" >'+locationMoim.likes+'</span>';
				   	row2 += '&ensp;&ensp;<i class="fas fa-users" style="color: #fcba03"></i>&ensp;<span class="mr-3">'+locationMoim.joinCount+'/'+locationMoim.headCount+'</span>';
				   	if (locationMoim.premiumYn == 'Y') {
					   	row2 += '<i class="fas fa-crown ml-2" style="color:#6699FF;"></i>';				   		
				   	}
				   	row2 += '<p style="float: right">'+locationMoim.joinDate+'</p>';
				   	row2 += '</div></div></div>';
					
					$list.append(row2);
				}); 
				currentPageNo += 4;
			}
			
		})
	}

	moreData();
	
	// 더보기 끝------------------------------------
	
	
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
	$("body").on('click', ".home-card",function() {
		console.log(1);
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
				var header = '<img src="/resources/profileImage/'+moim.profileImage+'" class="rounded-circle z-depth-0" alt="image" height="50px" width="50px">'
					header += '<span>'+moim.nickName+'</span>'
					header += '<span">'+moim.userId+'</span>'
					header += '<p>'+moim.userContent+'</p>'
					
				$("#home-modal-header").empty();
				$("#home-modal-header").append(header);
				$("#home-detail-title").text(moim.title)
				$("#home-detail-count").text(moim.joinCount + "/" + moim.headCount)
				$("#home-detail-content").text(moim.content)
				$("#home-detail-fee").text(moim.fee + "원")
				$("#home-detail-location").text("지역 : " + moim.locationName)
				$("#home-detail-cate").text("카테고리 : " + moim.subCateName)
				$("#home-detail-likes").text(moim.likes)
				$("#home-detail-joinDate").text("모이는날 : " + moim.joinDate)
				$("#home-detail-createDate").text("만든날 : " + moim.createdDate)
				
				var link = '/moim/moim.do?moimNo='+moim.moimNo+'';
				var join = '/moim/join.do?moimNo='+moim.moimNo+'&userId=${LOGIN_USER.id}';
				var withdrawal = '/moim/outMoim.do?moimNo='+moim.moimNo+'&userId=${LOGIN_USER.id}';
				modalMoimNo = moim.moimNo;
				
				$("#home-moim-join-btn").attr('href', join);
				$("#home-moim-withdrawal-btn").attr('href', withdrawal);
				
				var image = '<div class="col-12"><img class="card-img-top" src="/resources/home_images/'+moim.image+'" alt="Card image cap" style="width: 100%; height: 581.63px; background-color: lightgray"></div>'
				
				$("#home-modal-image").empty();
				$("#home-modal-image").append(image);
				
				$("#home-detail-premium").empty();
				if(moim.premiumYn == 'Y') {
					$("#home-moim-link-btn").attr("href", link);
					let premium = '<i class="fas fa-crown ml-2" style="color:#6699FF;"></i>';
					$("#home-detail-premium").append(premium);
					$("#home-moim-link-btn").css('display', 'block');
				} else {
					$("#home-moim-link-btn").css('display', 'none');
				}
				
				
				
				if(moim.likesYn == 'Y') {
					$("#home-modal-like").attr('class', 'fas fa-heart')
				} else {
					$("#home-modal-like").attr('class', 'far fa-heart')
				}			
			}
		})
	}
});

</script>