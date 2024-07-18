<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<String> list=new ArrayList<String>();
	list.add("홍길동");
	list.add("심청이");
	list.add("이순신");
	list.add("박문수");
	list.add("강감찬");
	
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이름 출력</h1>
	<ul>
	<% for(String name:list) {%>
		<li><%=name %></li>
	<%} %>
	</ul>
	<h2>이름 출력2</h2>
	<ul>
		<c:foreach var="name" items="${list})">
		</c:foreach>
	</ul>
</body>
</html>