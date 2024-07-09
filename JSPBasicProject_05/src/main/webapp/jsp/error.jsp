<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>시스템에 장애가 발생하였습니다!!</h1>
		<%= exception.getMessage() %> <%-- 에러나는 이유 설명 --%>
</body>
</html>