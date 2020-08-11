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
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
			document.getElementById("content").style.marginLeft = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("content").style.marginLeft = "0";
		}
	</script>
</body>

</html>