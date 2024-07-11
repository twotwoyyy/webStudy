<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">내부객체</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="basic_02.jsp?mode=1">Request</a></li>
	      <li><a href="basic_02.jsp?mode=2">Response</a></li>
	      <li><a href="#">Session</a></li>
	      <li><a href="#">Application</a></li>
	      <li><a href="#">Out</a></li>
	      <li><a href="#">PageContext</a></li>
	      <li><a href="#">Cookie</a></li>
	      <li><a href="#">JavaBean</a></li>
	      <li><a href="#">데이터베이스(DBCP)</a></li>
	    </ul>
	  </div>
	</nav>
</div>
</body>
</html>