<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style type="text/css">
.table_content{
	margin: 0px auto;
	width: 600px;
}
h3{
	text-align:center;
}
</style>
</head>
<body>
	<h3>구구단(JSTL)</h3>
	<table class="table_content">
		<tr>
			<c:forEach var="i" begin="2" end="9">
				<th>${i+="단" }</th>
			</c:forEach>
		</tr>
		<c:forEach var="i" begin="1" end="9">
			<tr>
				<c:forEach var="j" begin="2" end="9">
					<td class="tdcenter">${j } * {i }=${i*j }</td> 
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>