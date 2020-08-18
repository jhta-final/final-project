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
      <table style="width:800px;">
        <thead>
          <tr>
            <th>사용자</th>
            <th>신고횟수</th>
            <th>자세히보기</th>
            <th>경고버튼</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>영준</td>
            <td>4</td>
            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  상세
</button></td>
            <td><button type="button" class="btn btn-warning">경고</button></td>
          </tr>
          <tr>
            <td>영준2</td>
            <td>3</td>
            <td><button type="button" class="btn btn-info">상세</button></td>
            <td><button type="button" class="btn btn-warning">경고</button></td>
          </tr>
        </tbody>
      </table>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
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