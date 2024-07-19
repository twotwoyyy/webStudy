<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	EmpModel model=new EmpModel();
	model.empListData(request); // Controller
	// => HTML(View) / Java (Model) => MV 구조
	//     |             |
	//     ==== 연결 : Controller 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 960px;
}
h3{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>사원 목록</h3>
		<div class="row">
			<table class="table">
				<tr class="success">
					<th class="text-center">사번</th>
					<th class="text-center">이름</th>
					<th class="text-center">직위</th>
					<th class="text-center">입사일</th>
					<th class="text-center">급여</th>
				</tr>
				<%-- for(EmpVo vo:list) --%>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td class="text-center">${vo.empno}</td>
						<td class="text-center">${vo.ename}</td>
						<td class="text-center">${vo.job}</td>
						<td class="text-center">${vo.hiredate}</td>
						<td class="text-center">${vo.sal}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>