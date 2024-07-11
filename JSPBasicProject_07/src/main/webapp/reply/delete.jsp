<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.ReplyDAO"/>
<%	
	// ron=1&fno=2
	String rno=request.getParameter("rno"); //댓글 번호
	String fno=request.getParameter("fno"); //맛집 번호
	 String type=request.getParameter("type");
     dao.replyDelete(Integer.parseInt(rno));
	dao.replyDelete(Integer.parseInt(rno));
	// 이동
	 if(Integer.parseInt(type)==1)
     {
      response.sendRedirect("../main/main.jsp?mode=1&fno="+fno);
     }
     else 
     {
      response.sendRedirect("../main/main.jsp?mode=3&no="+fno);
     }
%>
