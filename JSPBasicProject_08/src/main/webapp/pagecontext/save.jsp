<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.forward("output.jsp"); // request를 전송
	/*
		forward는 다른 파일로 전송할 때 request를 유지함 => URL이 동일하다
		sendRedirect는 request를 초기화 한 후에 파일 이동 => URL이 변경된다 
	*/
%>