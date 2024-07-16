<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%-- 순수 JSP로 사용 --%>
<jsp:useBean id="dao" class="com.sist.dao.DiaryService"/>
<jsp:useBean id="vo" class="com.sist.dao.DiaryVO">
  <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
    String id=(String)session.getAttribute("id");
    vo.setId(id);
    
    dao.diaryInsert(vo);
    
    response.sendRedirect("diary.jsp");
    
%>