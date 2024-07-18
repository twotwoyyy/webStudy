<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	조건
	= 단일 조건문
	  <c:if test="조건문"> => ${비교 연산자 / 논리 연산자}
	  	출력물
	  </c:if>
	= 다중 조건문
	  <c:choose>
	  	<c:when test="조건문">출력물</c:when>
	  	<c:when test="조건문">출력물</c:when>
	  	<c:when test="조건문">출력물</c:when>
	  	<c:otherwise>DEFAULT</c:otherwise>
	  </c:choose>
	  
	  1~10까지의 짝수만 출력 
	  
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Java : 조건문</h3>
	<% for(int i=1;i<=10;i++) { %>
		<% if(i%2==0) { %>
			<%=i %>&nbsp;
		<% } %>
	<% } %>
	<h3>JSTL : 조건문</h3>
	<c:forEach var="i" begin="1" end="10">
		<c:if test="${i%2==0 }">
			${i }&nbsp;
		</c:if>
	</c:forEach>
</body>
</html>