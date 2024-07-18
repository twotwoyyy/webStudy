<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String[] colors={"green","blue","yellow","pink","orange"};
	request.setAttribute("colors", colors); 
	// $ => 일반 자바 변수는 출력이 불가능 => reqeust, session에 값을 넣어야 한다 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Java => 향상된 for(for-each)</h3>
		<ul>
		<% int i=1; %>
		<% for(String color:colors){ %>
			<li><%=i%>.<%=color %></li>
			<% i++; %>
		<% } %>
		</ul>
	<h3>JSTL => for-each</h3>
	<ul>
		<c:forEach var="color" items="${colors }" varStatus="s"><%-- varStatus는 배열이나 컬렉션의 index번호를 사용할 때 씀 0부터 시작  --%>
			<li>${s.index+1 }.${color }</li>
			<%-- $는 값을 가져오려면 request와 session 이용해야 한다  --%>
		</c:forEach>
	</ul>
</body>
</html>