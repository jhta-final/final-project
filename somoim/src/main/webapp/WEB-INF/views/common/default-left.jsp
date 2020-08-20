<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style>
/* The side navigation menu */
.sidenav {
	height: 100%; /* 100% Full-height */
	width: 317px; /* 0 width - change this with JavaScript */
	position: fixed; /* Stay in place */
	z-index: 1; /* Stay on top */
	left: 0px;
	background-color: #FFFFF0; /* Black*/
	overflow-x: hidden; /* Disable horizontal scroll */
	padding-top: 20px; /* Place content 60px from the top */
	transition: 0.2s;
	/* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav a {
	padding: 8px 8px 8px 8px;
	text-decoration: none;
	font-size: 20px;
	color: gray;
	display: block;
	transition: 0.2s;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
	color: #f1f1f1;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#content {
	transition: margin-left .1s;
	padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
	.sidenav {
		
	}
	.sidenav a {
		font-size: 18px;
	}

.collapse{
  background-color: #777;
  color: white;
  cursor: pointer;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
	height: 200px;
}

}
</style>

<div id="mySidenav" class="sidenav">
	<ul class="navbar-nav" style="text-align: center">
		<li class="nav-item active">
			<a class="nav-link" href="/home.do">Home</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="#">인기</a></li>
		<li class="nav-item mb-3">
			<div class="dropdown dropright">
				<a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					카테고리
				</a>
				<div class="dropdown-menu" style="z-index:1; position:absolute; transform:translate3d(235px,0,-1px);">
					<a class="dropdown-item dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게임/오락</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">롤</a>
						<a class="dropdown-item" href="#">배그</a>
						<a class="dropdown-item" href="#">서든</a>
					</div>
					<a class="dropdown-item dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">사교/인맥</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">롤</a>
						<a class="dropdown-item" href="#">배그</a>
						<a class="dropdown-item" href="#">서든</a>
					</div>
					<a class="dropdown-item dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">운동/스포츠</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">롤</a>
						<a class="dropdown-item" href="#">배그</a>
						<a class="dropdown-item" href="#">서든</a>
					</div>
					<a class="dropdown-item dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">반려동물</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">롤</a>
						<a class="dropdown-item" href="#">배그</a>
						<a class="dropdown-item" href="#">서든</a>
					</div>
					<a class="dropdown-item dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">문화/공연/축제</a>
				</div>
			</div>
		</li>
	</ul>
	<a class="btn" data-toggle="collapse" href="#collapseExample"
		role="button" aria-expanded="false" aria-controls="collapseExample">
		가입모임 </a>
	<div class="collapse" id="collapseExample"
		style="border-top: 1px solid lightgray">
		<div class="card card-body" style="background-color: #EDEDED">
			<c:choose>
				<c:when test="${not empty joinedMoim }">
					<c:forEach items="${joinedMoim}" var="joinedMoim">
						<a class="nav-link" href="/moim/moim.do?moimNo=${joinedMoim.moimNo }"> <span class="nav-item avatar">
								${joinedMoim.title }
								<c:if test="${joinedMoim.premiumYn eq 'Y'}">
									<i class="fas fa-crown ml-2" style="color: #6699FF;"></i>
								</c:if>
						</span>
						</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p class="text-center">가입한 모임이 없습니다.</p>
				</c:otherwise>
			</c:choose>
			<a class="nav-link text-center" href="#" style="color: black;">더보기</a>
		</div>
	</div>
	<a class="btn" data-toggle="collapse" href="#collapseExample2"
		role="button" aria-expanded="false" aria-controls="collapseExample">
		모임<i class="far fa-heart"></i>
	</a>
	<div class="collapse" id="collapseExample2"
		style="border-top: 1px solid lightgray">
		<div class="card card-body" style="background-color: #EDEDED">
			<c:choose>
				<c:when test="${not empty select}">
					<c:forEach items="${selectMoim}" var="select">
						<a class="nav-link" href="#">
							<span class="nav-item avatar">
								${select.title}
								<c:if test="${select.premiumYn eq 'Y'}">
									<i class="fas fa-crown ml-2" style="color:#6699FF;"></i>
								</c:if>
							</span>
						</a>
					</c:forEach>
					</c:when>
				<c:otherwise>
					<p class="text-center">좋아요한 모임이 없습니다.</p>
				</c:otherwise>
			</c:choose>
			<a class="nav-link text-center" href="#" style="color: black;">더보기</a>
		</div>
	</div>
	<a class="btn" data-toggle="collapse" href="#collapseExample3"
		role="button" aria-expanded="false" aria-controls="collapseExample">
		내 친구 </a>
	<div class="collapse" id="collapseExample3"
		style="border-top: 1px solid lightgray">
		<div class="card card-body" style="background-color: #EDEDED">
			<c:choose>
				<c:when test="${not empty followUsers}">
					<c:forEach items="${followUsers}" var="follow">
						<a class="nav-link" href="#"> <span class="nav-item avatar">
								<img src="/resources/profileImage/${follow.image }"
								class="rounded-circle z-depth-0" alt="avatar image" height="35">
								${follow.nickname }
						</span>
						</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p class="text-center">팔로잉한 사람이 없습니다.</p>
				</c:otherwise>
			</c:choose>
			<a class="nav-link text-center" href="#" style="color: black;">더보기</a>
		</div>
	</div>
	<a class="btn btn-primary" href="/moim/moim.do?moimNo=500000">
		정원 500000번 모임
	</a>
	<hr />
	<div class="" id="footer" style="font-size: 10px; margin-left:50px;">
		<p>자주하는 질문</p>
		<p>help@friendscube.com</p>
		<p>홈서비스</p>
		<p>소개언론/미디어블로그</p>
		<p>고객센터</p>
		<p>웹사이트소통공간서비스</p>
		<p>이용약관개인정보</p>
		<p>취급방침</p>
		<p>ⓒ Friendscube</p>
		<br/>
		<br/>
	</div>
</div>
<script type="text/javascript">
$(function() {
	var action = 1;
	$(".dropdown").click(function() {
		if (action == 1) {
			$('#Like').attr('class', 'fas fa-heart');
			action = 2;
		} else {
			$('#Like').attr('class', 'far fa-heart');
			action = 1;
		}
		$("#Like").toggle("fast");
	}

var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}
})
</script>
