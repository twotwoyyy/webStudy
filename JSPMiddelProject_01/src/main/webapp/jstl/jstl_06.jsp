<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<String> names=new ArrayList<String>();
	List<String> sexs=new ArrayList<String>();
	
	names.add("홍길동"); sexs.add("남자");
	names.add("심청이"); sexs.add("여자");
	names.add("이순신"); sexs.add("남자");
	names.add("춘향이"); sexs.add("여자");
	names.add("강감찬"); sexs.add("남자");
	
	request.setAttribute("names", names);
	request.setAttribute("sexs", sexs);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>자바 : for </h1>
	<ul>
		<% for(int i=0;i<names.size();i++) { %>
			<li><%=names.get(i) %>-<%=sexs.get(i) %></li>
		<% } %>
	</ul>
	<h1>JSTL : for </h1>
	<ul>
		<c:forEach var="name" items="${names }" varStatus="s" >
			<li>${name }-${sexs[s.index]}</li>
		</c:forEach>
	</ul>
</body>
</html>