<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no=request.getParameter("no");
	Cookie cookie=new Cookie("goods_"+no,no);
	cookie.setPath("/"); //저장할 공간
	cookie.setMaxAge(60*60*24); // 저장 기간 => setMaxAge(0)을 주면 삭제 
	// 브라우저로 전송
	response.addCookie(cookie);
	// 화면 이동
	response.sendRedirect("../main/main.jsp?mode=3&no="+no);
%>