<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	EmpDAO dao=EmpDAO.newInstance();
	List<EmpVO> list=dao.empSubqueryData();
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
	width: 800px;
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
				<tr>
					<th class="text-center">사번</th>
					<th class="text-center">이름</th>
					<th class="text-center">직위</th>
					<th class="text-center">입사일</th>
					<th class="text-center">부서명</th>
					<th class="text-center">근무지</th>
				</tr>
				<%
					for(EmpVO vo:list){
				%>
				<tr>
					<td class="text-center"><%=vo.getEmpno() %></td>
					<td class="text-center"><a href="detail.jsp?empno=<%=vo.getEmpno()%>"><%=vo.getEname() %></a></td>
					<td class="text-center"><%=vo.getJob() %></td>
					<td class="text-center"><%=vo.getHiredate().toString() %></td>
					<td class="text-center"><%=vo.getDvo().getDname() %></td>
					<td class="text-center"><%=vo.getDvo().getLoc() %></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>