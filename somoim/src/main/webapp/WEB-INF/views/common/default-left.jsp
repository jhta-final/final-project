<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style>
/* The side navigation menu */
.sidenav {
	height: 100%; /* 100% Full-height */
	width: 317px; /* 0 width - change this with JavaScript */
	position: fixed; /* Stay in place */
	z-index: 1; /* Stay on top */
	top: 0;
	left: 0px;
	background-color: #FFFFF0; /* Black*/
	overflow-x: hidden; /* Disable horizontal scroll */
	padding-top: 60px; /* Place content 60px from the top */
	transition: 0.2s;
	/* 0.5 second transition effect to slide in the sidenav */
	margin-top: 55px;
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

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
	position: absolute;
	top: 0;
	font-size: 36px;
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
    <ul class="navbar-nav" style="text-align:center">
      <li class="nav-item active">
        <a class="nav-link" href="/home.do">Home
          <span class="sr-only">(current)</span>
        </a>
      </li>
      <li class="nav-item">
		<a class="nav-link" href="#">인기</a>
      </li>
      <li class="nav-item mb-3">
		<a class="nav-link" href="/test.do">카테고리</a>
      </li>
    </ul>
	<a class="btn" data-toggle="collapse" href="#collapseExample"
		role="button" aria-expanded="false" aria-controls="collapseExample">
		가입모임 </a>
	<div class="collapse" id="collapseExample"
		style="border-top: 1px solid lightgray">
		<div class="card card-body">
			<c:forEach items="${joinedMoim}" var="joinedMoim">
				<a class="nav-link" href="/moim/moim.do?moimNo=${joinedMoim.moimNo }"> <span class="nav-item avatar">
						<img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
						class="rounded-circle z-depth-0" alt="avatar image" height="35">
						${joinedMoim.title }
				</span>
				</a>
			</c:forEach>
			<a class="nav-link" href="#"> <span class="nav-item avatar">더보기</span>
			</a>
		</div>
	</div>
	<a class="btn" data-toggle="collapse" href="#collapseExample2"
		role="button" aria-expanded="false" aria-controls="collapseExample">
		모임<i class="far fa-heart"></i>
	</a>
	<div class="collapse" id="collapseExample2"
		style="border-top: 1px solid lightgray">
		<div class="card card-body">
				<a class="nav-link" href="#">
					<span class="nav-item avatar">
						<img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
						class="rounded-circle z-depth-0" alt="avatar image" height="35">
						커피커피
					</span>
				</a>
		</div>
	</div>
	<a class="btn" data-toggle="collapse" href="#collapseExample3"
		role="button" aria-expanded="false" aria-controls="collapseExample">
		내 친구 </a>
	<div class="collapse" id="collapseExample3"
		style="border-top: 1px solid lightgray">
		<div class="card card-body">
			<c:forEach items="${followUsers}" var="follow">
				<a class="nav-link" href="#"> <span class="nav-item avatar">
						<img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-5.jpg"
						class="rounded-circle z-depth-0" alt="avatar image" height="35">
						${follow.nickname }
				</span>
				</a>
			</c:forEach>
			<a class="nav-link" href="#"> <span class="nav-item avatar">더보기</span>
			</a>
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
<!--

//-->
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
</script>
