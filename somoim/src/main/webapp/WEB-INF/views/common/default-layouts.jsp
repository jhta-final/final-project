<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>

<head>
<tiles:insertAttribute name="header" />
<style type="text/css">

	body {
	  background: #FFF;
	  font-family:Sunflower,Poor Story;
	  color: #000;
	  padding: 0;
	  font-size: 20px;
	  position: relative;
	}
		
	.my-back {
		padding-top: 0px;
		padding-left: 0px;
		padding-right: 0px;
	}
	.my-content {
		background-color: #f5f5f5;
		min-height: 860px;
	}
    .card {
    	background-color: #f5f5f5;
    }
    
    .clearfix:after{content:"";display:block;clear:both}

</style>
</head>

<body>

<div class="container-fluid ">
	<div class="row">
		<div class="col-12 my-back">
			<tiles:insertAttribute name="nav" />
		</div>
	</div>
	<div class="row" style="margin-top: 71.53px;">
		<div class="left col-2">
			<tiles:insertAttribute name="left" />
		</div>
		<div class="my-content col-10">
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
	           $(".left").attr("class", "left col-2");
	           if (window.sessionStorage) {
	                sessionStorage.setItem('position', 'open');
	            }
	       } else {
	           $(".left").attr("class", "left");
	           action = 1;
	           if (window.sessionStorage) {
	                sessionStorage.setItem('position', 'close');
	            }
	       }
	       //$("#sideMenu").toggle("fast");
	}
	$("#sideMenu").on("click", viewSomething);

	function viewSomething() {
	       if ( action == 1 ) {
	    	   $(".my-content").attr('class','my-content col-12');
	           $("#mySidenav").css("left", "-317px");
	           action = 2;
	       } else {
	    	   $(".my-content").attr('class','my-content col-10');
	    	   $("#mySidenav").css("left", "0px");
	           action = 1;
	       }
	}
})
</script>
</body>

</html>