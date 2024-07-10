<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<!--  navbar-fixed-top : 메뉴 고정 -->
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Include</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="action_include.jsp">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="action_include.jsp?mode=1">회원가입</a></li>
          <li><a href="action_include.jsp?mode=2">아이디 찾기</a></li>
          <li><a href="action_include.jsp?mode=3">비밀번호 찾기</a></li>
        </ul>
      </li>
      <li><a href="action_include.jsp?mode=4">커뮤니티</a></li>
      <li><a href="action_include.jsp?mode=5">마이페이지</a></li>
    </ul>
  </div>
</nav>
</body>
</html>