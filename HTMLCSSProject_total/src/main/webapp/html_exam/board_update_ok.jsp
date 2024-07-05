<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	// 한글 변환 처리
	request.setCharacterEncoding("UTF-8");
	String no=request.getParameter("no");
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	
	BoardVO vo=new BoardVO();
	vo.setNo(Integer.parseInt(no));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	// 데이터베이스 연동 => DAO
	BoardDAO dao=BoardDAO.newInstance();
	boolean bCheck=dao.boardUpdate(vo);
	// 화면 이동
	if(bCheck==false){
		// 비밀번호가 틀리면 수정창으로 이동 
%>
		<script>
			alert("비밀번호가 틀립니다!!");
			history.back();
		</script>
<%
	}else{
		// 비밀번호가 맞을 경우 상세보기로 이동 
		response.sendRedirect("board_detail.jsp?no="+no);
	}
%>
