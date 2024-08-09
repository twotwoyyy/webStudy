<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 900px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3 class="text-center">검색 결과</h3>
			<table class="table">
				<tr>
					<th>사번</th>
					<th>이름</th>
					<th>직위</th>
					<th>입사일</th>
					<th>급여</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.empno }</td>
						<td>${vo.ename }</td>
						<td>${vo.job }</td>
						<td>${vo.dbday }</td>
						<td>${vo.sal }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>