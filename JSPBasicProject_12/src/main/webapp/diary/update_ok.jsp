<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	/*
		전체값을 받아 VO에 담는다
		=> setProperty * => 전체값 읽기 
		Spring 
		  public void update_ok(DiaryVO vo); <스프링은 메소드에 매개변수로 값을 받음>
	*/
%>
<jsp:useBean id="vo" class="com.sist.dao.DiaryVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>

<%
	DiaryService dao=DiaryService.newInstance();
	// update요청
	dao.diaryUpdate(vo);
	// 화면 이동
	response.sendRedirect("diary.jsp");
%>