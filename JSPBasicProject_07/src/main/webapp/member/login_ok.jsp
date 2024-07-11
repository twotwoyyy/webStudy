<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.MemberDAO"/>
<%-- MemberDAO dao=new MemberDAO()--%> 
<%
	// 사용자가 보내준 ID,PWD를 받는다
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	// 오라클에 존재 여부 묻기
	MemberVO vo=dao.isLogin(id, pwd);
	
	if(vo.getMsg().equals("NOID")){
	%>
		<script>
			alert("아이디가 존재하지 않습니다!!");
			history.back();
		</script>
		
	<%
	}else if(vo.getMsg().equals("NOPWD")){
	%>
		<script>
			alert("비밀번호가 틀렸습니다!!");
			history.back();
		</script>
	<%
	}else{
		// 세션에 저장
		session.setAttribute("id", id);
		session.setAttribute("name", vo.getName());
		// 이동
		response.sendRedirect("../main/main.jsp");
	}
%>