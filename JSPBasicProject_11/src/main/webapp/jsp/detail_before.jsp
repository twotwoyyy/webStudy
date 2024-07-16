<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// detail_before.jsp?no=1
	// ?앞에 있는 JSP에서 받아서 처리
	// <form> => action에 등록된 파일을 받아서 처리 
	// include가 되면 전체를 가지고 있는 JSP에서 처리 => 모든 JSP가 request를 공유하기 때문에 
	// 웹은 데이터형이 없다 => 무조건 String 
	String no=request.getParameter("no");
	Cookie cookie=new Cookie("seoul_"+no,no);
	cookie.setPath("/");
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	
	// 화면 이동
	response.sendRedirect("detail.jsp?no="+no);
%>