<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
  .card {
    width: 200px;
  }

  .myp {
    margin: 0;
  }

  .smallimage {
    width: 50px;
    height: 50px;
  }
</style>
<div>
	<h1><c:out value="${title }"></c:out> </h1>
	<span class="badge badge-pill badge-secondary">${keyword.locationName }</span>
	<span class="badge badge-pill badge-secondary">${keyword.mainCateName }</span>
	<span class="badge badge-pill badge-secondary">${keyword.subCateName }</span>
</div>
<!-- 여기서 부터 반복문 돌리기 -->
<c:forEach items="${cateMoims }" var="moim">
	<div class="row">
	  <div class="col-9">
	    <div id="home-card" data-no="${moim.moimNo }" class="row mb-4 mt-4">
	      <div class="col-3">
	        <img src="/resources/index_images/${moim.image }" alt="" class="rounded mx-auto d-block" width="250px">
	      </div>
	      <div class="col-8 mt-3 float-left">
	        <p class="myp" style="font-size: 50px; font-weight: bold;"><c:out value="${moim.title }"/>
	            <c:if test="${moim.premiumYn == 'Y'}">
					<i class="fas fa-crown ml-2 text-right" style="color:#6699FF;"></i>
				</c:if>
			</p>
	        <div class="mb-1">
	          <span class="mr-3"><c:out value="${moim.userId }"></c:out> </span>
	          <span><i class="fas fa-heart" style="color: #d09afc"></i><fmt:formatNumber value="${moim.likes }"/> </span>
	          <p>지역 : ${moim.locationName } &ensp;카테고리 : ${moim.subCateName }</p>
	        </div>
	        <div class="mb-2">
	          <span class="mr-3"><i class="fas fa-won-sign"></i> <fmt:formatNumber value="${moim.fee }"/> 원</span>
	          <span><fmt:formatNumber value="${moim.joinCount }"/>/<fmt:formatNumber value="${moim.headCount }"/></span>
	        </div>
	        <p class="text-right"><fmt:formatDate value="${moim.joinDate }" pattern="yyyy-MM-dd"/></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-3" style="padding:">
	    <div class="text-center">내 친구</div>
	    <c:forEach items="${moim.friends }" var="friend">
	    <div class="mb-3">
	      <a href="#"><img src="/resources/home_images/3.png" class="rounded-circle smallimage mr-3" alt="Cinque Terre">
	        <span style="font-size: 15px; font-weight: bold;"><c:out value="${friend.nickname }"/></span></a>
	    </div>
	    </c:forEach>
	  </div>
	</div>
</c:forEach>
<!-- 반복문 끝-->
<!-- 모달창 -->
<div class="modal fade" id="searchModal" style="background-color: rgba(1, 1, 1, 0.7);">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.0)">
			<!-- Modal Header -->
			<div id="search-modal-header" class="modal-header row" style="background-color: rgba(255, 255, 255, 0.0) !important; color: #FFF; border-bottom: 0px;"></div>
			<!-- Modal Header end -->
			<!-- Modal body -->
			<div class="modal-body" style="padding:0px; margin-top: -1px; background-color: #FFF;border-radius:0 !important">
					<div id="search-modal-image" class="row"></div>
					<div class="row">
						<div class="col-12" style="padding: 30px;">
						<h3 id="search-detail-title"></h3>
							<p id="search-detail-count"></p>
							<p id="search-detail-content"></p>
							<p id="search-detail-location"></p>
							<p id="search-detail-cate"></p>
							<p><i class="fas fa-won-sign 2x"></i><span id="search-detail-fee"></span></p>
							좋아요수 : <span id="search-detail-likes"></span>개
							<p id="search-detail-joinDate">모이는날 : </p>
							<p id="search-detail-createDate">만든날 : </p>
						</div>
					</div>
			</div>
			<!-- Modal body end -->
			<!-- Modal footer -->
			<div class="modal-footer"  style="background-color: rgba(1, 1, 1, 0.3)">
				<i id="search-modal-like" class="" style="cursor: pointer; color: #d09afc"></i>
				<a id="search-moim-link-btn" class="btn btn-primary" href="">모임가기</a>
				<a id="search-moim-join-btn" class="btn btn-success" href="">모임가입</a>
				<a id="search-moim-withdrawal-btn" class="btn btn-warning" href="">모임탈퇴</a>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
			<!-- Modal footer end -->
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	var modalMoimNo = "";
	
	$("body").on('click', "#home-card",function() {
		var moimNo = $(this).data("no");
		$("#searchModal").modal('show');
		console.log('11',moimNo);
		modal(moimNo);
	})
	
	function modal(no) {
		
		$.ajax({
			type: "GET",
			url: "/detail.do",
			data: {moimNo: no},
			dataType: "json",
			success: function (moim) {
				console.log(moim);
				var link = '/moim/moim.do?moimNo='+moim.moimNo+'';
				var join = '/moim/join.do?moimNo='+moim.moimNo+'&userId=${LOGIN_USER.id}';
				var withdrawal = '/moim/out.do?moimNo='+moim.moimNo+'&userId=${LOGIN_USER.id}';
				modalMoimNo = moim.moimNo;
				var header = '<div class="col-1"><img src="/resources/profileImage/'+moim.profileImage+'" class="rounded-circle z-depth-0" alt="image" height="50px" width="50px"></div>'
					header += '<div class="col-9 text-left"><span class="mr-3">'+moim.nickName+'</span>'
					header += '<span class="mr-3">'+moim.userId+'</span>'
					header += '<span style="display: block">'+moim.userContent+'</span></div>'
				if(moim.premiumYn == 'Y') {
					$("#search-moim-link-btn").css('display', 'block');
					header += '<div class="col-2"><i class="fas fa-crown fa-2x ml-5" style="color:#6699FF;"></i></div>'
				} else {
					$("#search-moim-link-btn").css('display', 'none');
					header += '<div class="col-2"></div>'
				}
				if(moim.checkJoin == 1){
					$("#search-moim-withdrawal-btn").css('display', 'block');
					$("#search-moim-join-btn").css('display', 'none');
				} else {
					$("#search-moim-join-btn").css('display', 'block');
					$("#search-moim-withdrawal-btn").css('display', 'none');
				}
					
				$("#search-moim-join-btn").attr('href', join);
				$("#search-moim-withdrawal-btn").attr('href', withdrawal);
					
				$("#search-modal-header").empty();
				$("#search-modal-header").append(header);
				$("#search-moim-link-btn").attr("href", link);
					
				$("#search-detail-premium").empty();
				$("#search-detail-title").text(moim.title)
				$("#search-detail-count").text(moim.joinCount + "/" + moim.headCount)
				$("#search-detail-content").text(moim.content)
				$("#search-detail-fee").text(moim.fee + "원")
				$("#search-detail-location").text("지역 : " + moim.locationName)
				$("#search-detail-cate").text("카테고리 : " + moim.subCateName)
				$("#search-detail-likes").text(moim.likes)
				$("#search-detail-joinDate").text("모이는날 : " + moim.joinDate)
				$("#search-detail-createDate").text("만든날 : " + moim.createdDate)
				
				
				
				var image = '<div class="col-12"><img class="card-img-top" src="/resources/home_images/'+moim.image+'" alt="Card image cap" style="width: 100%; height: 581.63px; background-color: lightgray"></div>'
				
				$("#search-modal-image").empty();
				$("#search-modal-image").append(image);
				
				
				
				
				if(moim.likesYn == 'Y') {
					$("#search-modal-like").attr('class', 'fas fa-heart')
				} else {
					$("#search-modal-like").attr('class', 'far fa-heart')
				}			
			}
		})
	}

	

})
</script>