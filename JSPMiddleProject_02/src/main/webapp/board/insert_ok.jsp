<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.BoardModel"/>
<% 
	// Model method 호출 
	model.boardInsertOk(request, response);
%>