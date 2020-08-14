<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>

<head>
<tiles:insertAttribute name="header" />
<style type="text/css">
.my-back {
	padding-top: 0px;
	padding-left: 0px;
	padding-right: 0px;
}
.my-content {
	background-color: white;
}

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      padding: 0;
    }

    .swiper-container {
      width: 100%;
      height: 300px;
      margin: 20px auto;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

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

    .append-buttons {
      text-align: center;
      margin-top: 20px;
    }

    .append-buttons a {
      display: inline-block;
      border: 1px solid #007aff;
      color: #007aff;
      text-decoration: none;
      padding: 4px 10px;
      border-radius: 4px;
      margin: 0 10px;
      font-size: 13px;
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
		<div class ="test col-2">
			<tiles:insertAttribute name="left" />
		</div>
		<div class="col-10 my-content">
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
	           $("#mySidenav").css("left", "-317px");
	       } else {
	    	   $("#mySidenav").css("left", "0px");
	           action = 1;
	       }
	       $("#sideMenu").toggle("fast");
	}
	

	$("#sideMenu").on("click", viewSomething);

	function viewSomething() {
	       if ( action == 1 ) {
	    	   $(".my-content").attr('class','my-content col-12');
	    	   $("#mySidenav").attr('class', "sidenav");
	           $("#mySidenav").css("left", "-317px");
	           $("#test1").attr("class", "");
	           action = 2;
	       } else {
	    	   $(".my-content").attr('class','my-content col-10');
	    	   $("#mySidenav").attr('class', "sidenav col-2");
	    	   $("#mySidenav").css("left", "0px");
	           $("#test1").attr("class", "ml-4");
	           action = 1;
	       }
	}
})
</script>
</body>

</html>