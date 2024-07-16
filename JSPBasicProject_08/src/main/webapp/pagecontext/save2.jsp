<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RequestDispatcher rd=request.getRequestDispatcher("output.jsp");
	rd.forward(request,response);
	/*
		HTML 화면 이동 : <a>, <form> => 데이터 전송, 화면 변경 
		Java 화면 이동 : 서버에서 변경 => login => main 
			pageContext.forward()
			requestDispatcher.forward()
			============================= request를 유지 
			response.sendRedirect()
			============================= request를 초기화 
		JavaScript 화면 이동 
		    location.href="파일명"
	*/
%>