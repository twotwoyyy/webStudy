<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String path="C:\\webDev\\webStudy\\JSPBasicProject_08\\src\\main\\webapp\\application";
	String path=application.getRealPath("/application"); // 현재 나오는 경로를 RealPath이다 
	String euctype="UTF-8";
	int max=1024*1024*100; // 100MB
	// cos.jar => 파일 업로드 라이브러리 (com.oreilly.servlet)
	MultipartRequest mr=new MultipartRequest(request,path,max,euctype,new DefaultFileRenamePolicy());
	//                                                                ============================= 파일명이 같은 경우는 1씩 증가 
	String fn=mr.getOriginalFileName("upload"); // name값이랑 동일해야 한다 
	response.sendRedirect("output.jsp?fn="+fn);
%>