<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); // 세션 해제 => 메모리 데이터를 지운다 
	response.sendRedirect("../main/main.jsp");
%>