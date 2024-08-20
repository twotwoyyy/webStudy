
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
   <div class="one_quarter first">
	   <div class="panel panel-primary">
	    <div class="panel-heading">
	      <h3 class="panel-title">관리</h3>
	    </div>
	    <!-- 사이드바 메뉴목록1 -->
	    <ul class="list-group">
	      <li class="list-group-item"><a href="../adminpage/member_list.do">회원관리</a></li>
	      <li class="list-group-item"><a href="../adminpage/notice_list.do">공지사항관리</a></li>
	      <li class="list-group-item"><a href="#">구매관리</a></li>
	      <li class="list-group-item"><a href="../adminpage/admin_reserve.do">예약관리</a></li>
	      <li class="list-group-item"><a href="../adminpage/reply_list.do">묻고답하기관리</a></li>
	    </ul>
	   </div>
   </div>
   <div class="three_quarter">
     <jsp:include page="${admin_jsp }"></jsp:include>
   </div>
  </main>
</div>
</body>
</html>
