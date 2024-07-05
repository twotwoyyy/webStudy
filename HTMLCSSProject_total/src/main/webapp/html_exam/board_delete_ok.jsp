<%@page import="com.sist.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//사용자가 보내준 값을 받는다
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	
	//데이터베이스 연동
	BoardDAO dao=BoardDAO.newInstance();
	boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
	//이동
	if(bCheck==false){
		out.println("<script>");
		out.println("alert(\"비밀번호가 틀립니다\")");
		out.println("history.back()");
		out.println("</script>");		
	}else{
		response.sendRedirect("board_list.jsp");
	}
%>