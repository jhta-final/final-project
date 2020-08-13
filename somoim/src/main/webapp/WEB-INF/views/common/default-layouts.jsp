<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="../package/swiper-bundle.min.css">

<tiles:insertAttribute name="header" />
<style type="text/css">
.my-back {
	padding-left: 0px;
	padding-right: 0px;
}

#content {
	margin-left: 250px;
	transition: 1s;
}

</style>
</head>

<body>
<div class="container-fluid ">
	<div class="row">
		<div class="col-12 my-back">
			<tiles:insertAttribute name="nav" />
		</div>
	</div>
	<div class="row">
		<tiles:insertAttribute name="left" />
		<div class="col-10 my-content" id="content">
			<tiles:insertAttribute name="content" />
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	var action = 1;
	function viewSomething() {
	       if ( action == 1 ) {
	           action = 2;
	           $("#mySidenav").css("left", "250px");
	       } else {
	    	   $("#mySidenav").css("left", "0px");
	           action = 1;
	       }
	       $("#sideMenu").toggle("fast");
	}
	

	$("#sideMenu").on("click", viewSomething);

	function viewSomething() {
	       if ( action == 1 ) {
	           $("#mySidenav").css("left", "-250px");
	           $("#content").css("marginLeft", "0px");
	           action = 2;
	       } else {
	    	   $("#mySidenav").css("left", "0px");
	           $("#content").css("marginLeft", "250px");
	           action = 1;
	       }
	}
})
</script>
</body>

</html>