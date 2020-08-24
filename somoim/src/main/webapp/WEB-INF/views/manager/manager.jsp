<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>관리자 페이지</h1>
<div>
  <div class="row mt-3" style="width: 95%">
    <div class="col-12">
      <nav class="navbar">
        <ul class="nav nav-tabs" id="mypage-nav">
          <li class="nav-item"><a class="nav-link active" href="#" id="mypage-info">사용자 신고 관리</a>
          </li>
          <li class="nav-item"><a class="nav-link" href="#" id="mypage-mymoim">공지사항 등록</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>

  <div>
    <div>
      <table class="table table-striped" style="width:900px;">
        <thead>
          <tr>
            <th>사용자</th>
            <th>신고횟수</th>
            <th>자세히보기</th>
            <th>경고버튼</th>
            <th>계정상태</th>
            <th>정지버튼</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>영준</td>
            <td>4</td>
            <td>
            	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#warning-detail-modal">
 				상세</button>
 			</td>
            <td><button type="button" class="btn btn-warning">경고</button></td>
            <td><strong class="text-danger">정지</strong></td>
            <td><button type="button" class="btn btn-secondary">풀기</button></td>
          </tr>
          <tr>
            <td>영준2</td>
            <td>3</td>
            <td><button type="button" class="btn btn-info">상세</button></td>
            <td><button type="button" class="btn btn-warning">경고</button></td>
            <td><strong class="text-secondary">일반</strong></td>
            <td><button type="button" class="btn btn-danger">정지</button></td>
          </tr>
        </tbody>
      </table>

<!-- The Modal -->
<div class="modal" id="warning-detail-modal">
  <div class="modal-dialog modal-dialog-centered  modal-xl">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">상세</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <table class="table">
        	<colgroup>
        		<col width="10%">
        		<col width="8%">
        		<col width="*">
        		<col width="10%">
        		<col width="7%">
        	</colgroup>
        	<thead>
        		<tr>
        			<th>신고자</th>
        			<th>유형</th>
        			<th>내용</th>
        			<th>신고날짜</th>
        			<th>삭제</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>홍길동</td>
        			<td>유저</td>
        			<td>욕설을 난무 합니다.</td>
        			<td>2020.11.22</td>
        			<td><button type="button" class="btn btn-danger">x</button></td>
        		</tr>
        		<tr>
        			<td>홍길동</td>
        			<td>모임</td>
        			<td>활동이 없는 모임입니다.</td>
        			<td>2020.11.22</td>
        			<td><button type="button" class="btn btn-danger">x</button></td>
        		</tr>
        		<tr>
        			<td>문주영</td>
        			<td>게시판</td>
        			<td>악성 후기를 작성했습니다.</td>
        			<td>2020.11.22</td>
        			<td><button type="button" class="btn btn-danger">x</button></td>
        		</tr>
        	</tbody>
        </table>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
  </div>
</div>
</div>