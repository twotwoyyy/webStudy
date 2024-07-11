<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.ReplyDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String fno=request.getParameter("fno");
	String rno=request.getParameter("rno");
	String msg=request.getParameter("msg");
	String type=request.getParameter("type");
	
	ReplyVO vo=new ReplyVO();
	vo.setRno(Integer.parseInt(rno));
	vo.setMsg(msg);
	
	dao.replyUpdate(vo);
	
	//이동
	 if(Integer.parseInt(type)==1)
     {
      response.sendRedirect("../main/main.jsp?mode=1&fno="+fno);
     }
     else 
     { 
      response.sendRedirect("../main/main.jsp?mode=3&no="+fno);
     }
%>