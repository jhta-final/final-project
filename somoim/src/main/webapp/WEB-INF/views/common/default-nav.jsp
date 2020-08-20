<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!--Navbar -->
<div class="my-nav">
	<nav class="navbar navbar-dark fixed-top" style="background-color: #FFFFF0;">
		<div style="width: 20%;">
			<button class="navbar-toggler mr-3 nav-white">
				<span class="navbar-toggler-icon" style="color: lightgray ;background-color: lightgray;" id="sideMenu"></span>
			</button>
			<a class="navbar-brand" href="/home.do" style="color: black"> <img src="/resources/home_images/logo_1.png"
					height="30" class="d-inline-block align-top" alt="mdb logo">
				somoim
			</a>
		</div>
		<div style="width: 40%;">
			<form class="form-inline my-1" action="/test.do">
				<div class="md-form form-sm my-0">
					<input class="form-control form-control-sm" style="width: 500px;" type="text" placeholder="Search"
						aria-label="Search">
				</div>
				<button class="btn btn-outline-primary btn-sm ml-1 my-0" type="submit">Search</button>
				<div class="dropdown">
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown"></button>
					<div class="dropdown-menu dropdown-menu-right" style="width: 595px;">
						<div class="form-group" style="width: 100%">
							<i class="mr-2 fas fa-map-marker" style="color: #0F4C81;"></i><label>지역구</label>
							<select name="location" class="form-control">
								<option value="" selected="selected" disabled="disabled" class="text-center">지역</option>
								<option value="1">강서구</option>
								<option value="2">양천구</option>
								<option value="3">구로구</option>
								<option value="4">금천구</option>
								<option value="5">영등포구</option>
								<option value="6">동작구</option>
								<option value="7">관악구</option>
								<option value="8">서초구</option>
								<option value="9">강남구</option>
								<option value="10">송파구</option>
								<option value="11">강동구</option>
								<option value="12">마포구</option>
								<option value="13">용산구</option>
								<option value="14">서대문구</option>
								<option value="15">은평구</option>
								<option value="16">중구</option>
								<option value="17">종로구</option>
								<option value="18">성동구</option>
								<option value="19">광진구</option>
								<option value="20">동대문구</option>
								<option value="21">성북구</option>
								<option value="22">강북구</option>
								<option value="23">도봉구</option>
								<option value="24">노원구</option>
								<option value="25">중랑구</option>
							</select>
						</div>
						<div class="form-group" style="width: 100%">
							<i class="mr-2 fas fa-tags" style="color: #0F4C81;"></i><label>카테고리</label>
							<select id="main-cate" name="category" class="form-control" onchange="getSubCate()">
								<option value="" selected="selected" disabled="disabled" class="text-center"></option>
								<option value="1">게임/오락</option>
								<option value="2">사교/인맥</option>
								<option value="3">운동/스포츠</option>
								<option value="4">반려동물</option>
								<option value="5">문화/공연/축제</option>
							</select>
						</div>
						<div class="form-group" style="width: 100%">
							<i class="mr-2 fas fa-tags" style="color: #0F4C81;"></i><label>세부
								카테고리</label> <select id="sub-cate" name="category" class="form-control">
							</select>
						</div>

						<div class="text-right mr-3">
							<button class="btn btn-primary btn-sm" type="submit">상세검색</button>
							<button class="btn btn-outline-primary btn-sm" type="reset">리셋</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="" style="float: right">
			<div class="dropdown" style="float: right;text-align: right">
				<a class="nav-link dropdown-toggle-right" id="navbarDropdownMenu2" data-toggle="dropdown">
					<img src="/resources/profileImage/${LOGIN_USER.profileImage }" class="rounded-circle z-depth-0"
						alt="avatar image" height="35" width="35">
					<input id="userId" type="hidden" value="${LOGIN_USER.id }">
				</a>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" href="/mypage/mypage.do">my page</a>
					<a class="dropdown-item" href="#">프로필 수정</a>
					<button class="dropdown-item" id="nav-message-button">쪽지함</button>
					<a class="dropdown-item" href="/login/signout.do">로그아웃</a>
				</div>
			</div>
			<div class="dropdown" style="float: right;text-align: right">
				<a class="nav-link navbar-toggler-right" id="navbarDropdownMenu1" data-toggle="dropdown">
					<i class="fas fa-bell fa-2x" style="color: lightgray;"></i>
				</a>
				<div id="alram-dropdown" class="dropdown-menu dropdown-menu-right">
					<c:choose>
						<c:when test="${empty alrams }">
							<p style="margin: 0;">새 알림이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${alrams }" var="alram">
								<a data-alram-no="${alram.alramNo }" class="dropdown-item " href="#"><strong>
										<c:out value="[${alram.type }]"></c:out>
									</strong>
									<c:out value="${alram.message }"></c:out>
								</a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</nav>
</div>

<!--쪽지함 모달창 -->
<div class="modal fade" id="nav-message-modal">
	<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">쪽지함</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="mt-3 pb-3" style='border-bottom: 1px solid darkgray'>
					<p>받은 쪽지</p>
					<div style="width:100%; height:200px; overflow:auto">						
						<table id="receive-table" class="table" style="font-size: 14px">
							<colgroup>
								<col width="10%">
								<col width="75%">
								<col width="10%">
								<col width="5%">
							</colgroup>
							<thead>
								<tr>
									<td>발신자</td>
									<td>제목</td>
									<td>날짜</td>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<!-- 시작 -->
								<tr>
									<td>권영준</td>
									<td data-toggle="collapse" data-target="#message-get-content-1">권영준님이 메세지를 보냈습니다.</td>
									<td>2020.01.11</td>
									<td><button class="btn btn-danger btn-sm" style="line-height:0.8">x</button></td>
								</tr>
								<tr>
									<td colspan="4" id="message-get-content-1" class="collapse" style="background: lightgray">Lorem ipsum dolor text....</td>
								</tr>
								<!-- 끝 -->
								<tr>
									<td>권영준</td>
									<td data-toggle="collapse" data-target="#message-get-content-2">권영준님이 메세지를 보냈습니다.</td>
									<td>2020.01.11</td>
									<td><button class="btn btn-danger btn-sm" style="line-height:0.8">x</button></td>
								</tr>
								<tr>
									<td colspan="4" id="message-get-content-2" class="collapse" style="background: lightgray">Lorem ipsum dolor text....</td>
								</tr>
								<tr>
									<td>권영준</td>
									<td data-toggle="collapse" data-target="#message-get-content-3">권영준님이 메세지를 보냈습니다.</td>
									<td>2020.01.11</td>
									<td><button class="btn btn-danger btn-sm" style="line-height:0.8">x</button></td>
								</tr>
								<tr>
									<td colspan="4" id="message-get-content-3" class="collapse" style="background: lightgray">Lorem ipsum dolor text....</td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<div class="text-right mt-3">
						<button type="button" class="btn btn-secondary">비우기</button>
					</div>
				</div>
				<div class="mt-3 pb-3" style='border-bottom: 1px solid darkgray'>
					<p>보낸 쪽지</p>
					<div style="width:100%; height:200px; overflow:auto">
						<table id="send-table" class="table" style="font-size: 14px">
							<colgroup>
								<col width="10%">
								<col width="75%">
								<col width="10%">
								<col width="5%">
							</colgroup>
							<thead>
								<tr>
									<td>수신자</td>
									<td>제목</td>
									<td>날짜</td>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<!-- 시작 -->
								<tr>
									<td>아이디</td>
									<td data-toggle="collapse" data-target="#message-send-content-1">권영준님이 메세지를 보냈습니다.</td>
									<td>2020.01.11</td>
									<td><button class="btn btn-danger btn-sm" style="line-height:0.8">x</button></td>
								</tr>
								<tr>
									<td colspan="4" id="message-send-content-1" class="collapse" style="background: lightgray">Lorem ipsum dolor text....</td>
								</tr>
								<!-- 끝 -->
								<tr>
									<td>권영준</td>
									<td data-toggle="collapse" data-target="#message-send-content-2">권영준님이 메세지를 보냈습니다.</td>
									<td>2020.01.11</td>
									<td><button class="btn btn-danger btn-sm" style="line-height:0.8">x</button></td>
								</tr>
								<tr>
									<td colspan="4" id="message-send-content-2" class="collapse" style="background: lightgray">Lorem ipsum dolor text....</td>
								</tr>
								<tr>
									<td>권영준</td>
									<td data-toggle="collapse" data-target="#message-send-content-3">권영준님이 메세지를 보냈습니다.</td>
									<td>2020.01.11</td>
									<td><button class="btn btn-danger btn-sm" style="line-height:0.8">x</button></td>
								</tr>
								<tr>
									<td colspan="4" id="message-send-content-3" class="collapse" style="background: lightgray">Lorem ipsum dolor text....</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="text-right mt-3">
						<button type="button" class="btn btn-secondary">비우기</button>
					</div>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<!--/.Navbar -->
<script type="text/javascript">
	$(function () {
		// 드롭다운 꺼지지 않게 하기
		$("#alram-dropdown").click(function (event) {
			event.stopPropagation();
		});

		// 알림 읽은거 지우고 새로운거 띄우기
		$("#alram-dropdown").on("click", "a", function () {
			var alramNo = $(this).data("alram-no");
			var userId = $("#userId").val();

			$.ajax({
				type: "GET",
				url: "/alram/read.do",
				data: {
					alramNo: alramNo,
					userId: userId
				},
				dataType: "json",
				success: function (alrams) {
					var $dropdown = $("#alram-dropdown").empty();

					if (alrams.length == 0) {
						var text = "<p style='margin: 0;'>새 알림이 없습니다.</p>"
						$dropdown.append(text);
						return;
					}

					$.each(alrams, function (index, alram) {
						var text = "<a data-alram-no='" + alram.alramNo +
							"' class='dropdown-item' href = '#' > < strong > [" + alram.type + "] < /strong>" + alram
							.message + "</a > ";

						$dropdown.append(text);
					});
				}
			})
		});

		// 쪽지함 모달창 관련 JS
		$("#nav-message-button").click(function () {
			$("#nav-message-modal").modal('show');
			
			// 쪽지 조회
			$.ajax({
				type: "GET",
				url: "/alram/message.do",
				dataType: "json",
				success: function (messages) {
					var $Rtbody = $("#receive-table tbody").empty();
					var $Stbody = $("#send-table tbody").empty();
					
					// 받은 쪽지 조회
					if (messages.receiveMessages.length == 0) {
						var text = "<tr>";
						text += "<td colspan='4'>새로운 쪽지가 없습니다.</td>";
						text += "</tr>";
						
						$Rtbody.append(text);
						
						return;
					}
					
					$.each(messages.receiveMessages, function(index, message) {
						var text = "<tr>";
							text += "<td>"+message.sendUser+"</td>";
							text += "<td data-toggle='collapse' data-target='#message-get-content-1'>"+message.title+"</td>";
							text += "<td>"+message.createdDate+"</td>";
							text += "<td><button class='btn btn-danger btn-sm' style='line-height:0.8'>x</button></td>";
							text += "</tr>";
							text += "<tr>";
							text += "<td colspan='4' id='message-get-content-1' class='collapse' style='background: lightgray'>"+message.content+"</td>";
							text += "</tr>";
						
						$Rtbody.append(text);
					})
					
					// 보낸 쪽지 조회
					if (messages.sendMessages.length == 0) {
						var text = "<tr>";
						text += "<td colspan='4'>보낸 쪽지가 없습니다.</td>";
						text += "</tr>";
						
						$Stbody.append(text);
						
						return;
					}
					
					$.each(messages.sendMessages, function(index, message) {
						var text = "<tr>";
							text += "<td>"+message.receiveUser+"</td>";
							text += "<td data-toggle='collapse' data-target='#message-send-content-1'>"+message.title+"</td>";
							text += "<td>"+message.createdDate+"</td>";
							text += "<td><button class='btn btn-danger btn-sm' style='line-height:0.8'>x</button></td>";
							text += "</tr>";
							text += "<tr>";
							text += "<td colspan='4' id='message-send-content-1' class='collapse' style='background: lightgray'>"+message.content+"</td>";
							text += "</tr>";
						
						$Stbody.append(text);
					})
				}
			});
		})
	});
</script>