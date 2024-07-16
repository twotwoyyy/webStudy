<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	
	DataBoardDAO dao=DataBoardDAO.newInstance();
	DataBoardVO vo=dao.databoardFileInfoData(Integer.parseInt(no));
	String result=dao.databoardDelete(Integer.parseInt(no), pwd);
	
	try{
		if(result.equals("yes") && vo.getFilesize()!=0){
			File f=new File("c:\\upload\\"+vo.getFilename());
			f.delete();
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}
%>
<%= result%>