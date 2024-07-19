<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	EmpDAO dao=EmpDAO.newInstance();
	List<EmpVO> list=dao.empListdata();
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
				<% for(EmpVO vo:list) { %>
					<tr>
						<td class="text-center"><%=vo.getEmpno() %></td>
						<td class="text-center"><%=vo.getEname() %></td>
						<td class="text-center"><%=vo.getJob() %></td>
						<td class="text-center"><%=vo.getHiredate() %></td>
						<td class="text-center"><%=vo.getSal() %></td>
					</tr>
				<% } %>
			</table>
		</div>
	</div>
</body>
</html>