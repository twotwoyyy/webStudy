<%@page import="com.sist.dao.EmpVO"%>
<%@page import="com.sist.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EmpDAO dao=EmpDAO.newInstance();
	String empno=request.getParameter("empno");
	EmpVO vo=dao.empDetailData(Integer.parseInt(empno));
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
		<h3></h3>
		<div class="row">
			<table class="table">
	            <tr>
	               <th class="text-center" width="20%">사번</th>
	               <td class="text-center" width="30%"><%=vo.getEmpno() %></td>
	               <th class="text-center" width="20%">이름</th>
	               <td class="text-center" width="30%"><%=vo.getEname() %></td>
	            </tr>
	            <tr>
	               <th class="text-center" width="20%">직위</th>
	               <td class="text-center" width="30%"><%=vo.getJob() %></td>
	               <th class="text-center" width="20%">입사일</th>
	               <td class="text-center" width="30%"><%=vo.getHiredate().toString() %></td>
	            </tr>
	            <tr>
	               <th class="text-center" width="20%">급여</th>
	               <td class="text-center" width="30%"><%=vo.getSal()%></td>
	               <th class="text-center" width="20%">성과급</th>
	               <td class="text-center" width="30%"><%=vo.getComm() %></td>
	            </tr>
	            <tr>
	               <th class="text-center" width="20%">부서명</th>
	               <td class="text-center" width="30%"><%=vo.getDvo().getDname() %></td>
	               <th class="text-center" width="20%">근무지</th>
	               <td class="text-center" width="30%"><%=vo.getDvo().getLoc() %></td>
	            </tr>
	            <tr>
	               <th class="text-center" width="20%">호봉</th>
	               <td colspan="3"><%=vo.getSvo().getGrade() %></td>
	            </tr>
	         </table>
		</div>
	</div>
</body>
</html>