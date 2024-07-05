<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	// 사용자가 보내준 값을 받는다
	// 한글 => 한글 처리 => 디코딩 
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");

	BoardVO vo=new BoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	// DAO를 통해서 오라클로 전송 
	BoardDAO dao=BoardDAO.newInstance();
	dao.boardInsert(vo);
	// 화면 이동 => board_list.jsp
	response.sendRedirect("board_list.jsp");
%>

