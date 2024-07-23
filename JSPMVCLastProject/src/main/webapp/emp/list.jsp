<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.service.*"%>
<%
	EmpDAO dao=EmpDAO.newInstance();
	List<EmpVO> list=dao.empListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<% for(EmpVO vo:list){ %>
			<li><%=vo.getEmpno() %>-<%=vo.getEname() %></li>
		<% } %>
	</ul>
</body>
</html>