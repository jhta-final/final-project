<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1 class="mt-5 ml-4">관리자 페이지</h1>
<div class="ml-4">
  <div class="row mt-3" style="width: 95%">
    <div class="col-12">
      <nav class="navbar">
        <ul class="nav nav-tabs" id="mypage-nav">
          <li class="nav-item"><a class="nav-link" href="/manager/show.do">사용자 신고 관리</a>
          </li>
          <li class="nav-item"><a class="nav-link active" href="/manager/boards.do">공지사항 등록</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
  
  <div class="row justify-content-center" >
  	<table id="warning-list-table" class="table table-striped" style="width:94%;">
  		<colgroup>
        		<col width="8%">
        		<col width="*">
        		<col width="10%">
        		<col width="10%">
        		<col width="8%">
        </colgroup>
        <thead>
          <tr>
            <th>#</th>
            <th>제목</th>
            <th>날짜</th>
            <th>조회수</th>
            <th>삭제</th>
          </tr>
        </thead>
        <tbody>
       		<tr>
       			<td class="text-danger">공지</td>
       			<td>조심하세요~~</td>
       			<td>2020.20.11</td>
       			<td>4</td>
       			<td><button type="button" class="btn btn-danger">x</button></td>
       		</tr>
       		<tr>
       			<td class="text-danger">공지</td>
       			<td>조심하세요~~</td>
       			<td>2020.20.11</td>
       			<td>4</td>
       			<td><button type="button" class="btn btn-danger">x</button></td>
       		</tr>
       		<tr>
       			<td class="text-danger">공지</td>
       			<td>조심하세요~~</td>
       			<td>2020.20.11</td>
       			<td>4</td>
       			<td><button type="button" class="btn btn-danger">x</button></td>
       		</tr>
       		
        </tbody>
      </table>
  </div>
  
  <div class="row mt-4">		
		<div class="text-right" style="width: 90%">
			<a href="/manager/create.do" class="btn btn-primary">글 쓰기</a>
		</div>
	</div>
 </div>