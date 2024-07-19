<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	1. <c:set> : 변수 설정 => request.setAttribute()
	2. <c:out> : 화면에 출력 
	   ======= 자바 스크립트에서 자바 데이터 출력 
	           => Jquery => $ => 그래프 => 함수로 인식 
	           => EL     => $
	           
	           => 충돌 방지를 위해 c:out을 사용한다 
 --%>
<%
	List<String> names=new ArrayList<String>();
	for(char a='A';a<='Z';a++) {
		names.add(String.valueOf(a));
	}
%>
<c:set var="names" value="<%=names %>"/>
<%-- request.setAttribute("names",names) --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL : 변수 설정 =&lt;c:set&gt;</h1>
	<c:forEach var="alpha" items="${names }">
		${alpha }&nbsp;
	</c:forEach>
	<h1>JSTL : 변수 설정 =&lt;c:out&gt;</h1>
	<c:forEach var="alpha" items="${names }">
		<c:out value="${alpha }"></c:out>&nbsp;
	</c:forEach>
	
</body>
</html>