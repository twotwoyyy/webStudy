<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Java : 다중 조건문</h3>
	<% int star=3; %>
		<% if(star==0) { %>
		<span style="color:orange">☆☆☆☆☆</span>
		<% }else if(star==1) { %>
			<span style="color:orange">★☆☆☆☆</span>
		<% } else if(star==2) { %>
			<span style="color:orange">★★☆☆☆</span>
		<% } else if(star==3) { %>
			<span style="color:orange">★★★☆☆</span>
		<% } else if(star==4) { %>
			<span style="color:orange">★★★★☆</span>
		<% } else if(star==5) { %>
			<span style="color:orange">★★★★★</span>
		<% } %>
	<h3>JSTL : 다중 조건문</h3>
	<% request.setAttribute("star", 3); %>
	<c:choose>
		<c:when test="${star==0 }">☆☆☆☆☆</c:when>
		<c:when test="${star==1 }">★☆☆☆☆</c:when>
		<c:when test="${star==2 }">★★☆☆☆</c:when>
		<c:when test="${star==3 }">★★★☆☆</c:when>
		<c:when test="${star==4 }">★★★★☆</c:when>
		<c:when test="${star==5 }">★★★★★</c:when>
	</c:choose>
	<h3>Java : 선택 조건문</h3>
	<% int sex=1; %>
	<% if(sex==1) { %>
		남자
	<% }else { %>
		여자
	<% } %>
	<h3>JSTL : 선택 조건문</h3>
	<% request.setAttribute("sex", 2);%>
	<c:choose>
		<c:when test="${sex==1 }">남자</c:when>
		<c:otherwise>여자</c:otherwise>
	</c:choose>
</body>
</html>