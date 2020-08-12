<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>

<head>
<tiles:insertAttribute name="header" />
<style type="text/css">
.my-back {
	background: blue;
	padding-left: 0px;
	padding-right: 0px;
}

.my-content a {
	margin-left: 0px;
	color: black;
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
	    	   $("#mySidenav").css("width", "250px");
	           action = 2;
	       } else {
	           $("#mySidenav").css("width", "0px");
	           action = 1;
	       }
	       $("#sideMenu").toggle();
	}
	

	$("#sideMenu").on("click", viewSomething);

	function viewSomething() {
	       if ( action == 1 ) {
	    	   $("#mySidenav").css("width", "250px");
	           $("#content").css("marginLeft", "250px");
	           action = 2;
	       } else {
	           $("#content").css("marginLeft", "0px");
	           $("#mySidenav").css("width", "0px");
	           action = 1;
	       }
	}
})
</script>
</body>

</html>