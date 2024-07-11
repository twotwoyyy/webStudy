<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	request / response / session 
	application / out / pageContext
	page / config / exception 
	=========================== 내장 객체
	Cookie : 최신 방문 => 보안 노출 위험 
	 => 대신 session이 더 많이 쓰인다 
	 
	=> 빈즈 => VO, DAO, 
	=> DAO => DBCP로 전환 
	=> MVC => MV / MVC 
	               => Spring 형식 => 프로젝트 
 --%>
<%
	String mode=request.getParameter("mode");
	if(mode==null)
		mode="1";
	int index=Integer.parseInt(mode);
	String jsp="";
	switch(index){
	case 1:
		jsp="request.jsp";
		break;
	case 2:
		jsp="response.jsp";
		break;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.row{
	margin: 0px auto;
	width: 960px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<jsp:include page="<%=jsp %>"></jsp:include>
	</div>
</body>
</html>