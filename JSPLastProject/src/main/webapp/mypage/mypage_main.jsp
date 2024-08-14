<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
   <h2 class="sectiontitle">마이페이지</h2>
   <div class="one_quarter first">
	    <div class="panel panel-info">
	    <div class="panel-heading">
	      <h3 class="panel-title">개인정보</h3>
	    </div>
	    <!-- 사이드바 메뉴목록1 -->
	    <ul class="list-group">
	      <li class="list-group-item"><a href="#">회원수정</a></li>
	      <li class="list-group-item"><a href="#">회원탈퇴</a></li>
	      <li class="list-group-item"><a href="#">비밀번호 변경</a></li>
	    </ul>
	   </div>
	   <div class="panel panel-warning">
	    <div class="panel-heading">
	      <h3 class="panel-title">관리정보</h3>
	    </div>
	    <!-- 사이드바 메뉴목록1 -->
	    <ul class="list-group">
	      <li class="list-group-item"><a href="#">게시판관리</a></li>
	      <li class="list-group-item"><a href="#">댓글관리</a></li>
	      <li class="list-group-item"><a href="#">찜관리</a></li>
	      <li class="list-group-item"><a href="#">좋아요관리</a></li>
	      <li class="list-group-item"><a href="#">장바구니관리</a></li>
	      <li class="list-group-item"><a href="#">예약관리</a></li>
	    </ul>
	   </div>
   </div>
   <div class="three_quarter">
     <jsp:include page="${mypage_jsp }"></jsp:include>
   </div>
  </main>
</div>
</body>
</html>