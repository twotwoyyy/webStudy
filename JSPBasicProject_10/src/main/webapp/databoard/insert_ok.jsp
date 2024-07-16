<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.io.*"%>
<%-- 
	사용자가 보내준 데이터를 받아 처리 후에 목록으로 다시 이동하게 만든다 
	// JSP : 입력값을 받아서 처리 (데이터베이스 처리) 이동 ==> _ok
	// JSP : 브라우저에 화면 출력 
--%>
<%
	request.setCharacterEncoding("UTF-8");
	String path="c:\\upload";
	try{
		File dir=new File(path);
		if(!dir.exists()){
			dir.mkdir(); // 폴더가 없으면 생성하라 
		}
	}catch(Exception ex){}
	String euctype="UTF-8"; //한글 파일명 처리
	int max=1024*1024*100; //파일의 최대 크기는 100MB
	MultipartRequest mr=new MultipartRequest(request,path,max,euctype,new DefaultFileRenamePolicy()); //업로드
	// a.jpg => a1.jpg => a2.jpg....
	String name=mr.getParameter("name");
	String subject=mr.getParameter("subject");
	String content=mr.getParameter("content");
	String pwd=mr.getParameter("pwd");
	String filename=mr.getFilesystemName("upload");
	DataBoardVO vo=new DataBoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	if(filename==null){ //업로드가 없는 경우
		vo.setFilename("");
		vo.setFilesize(0);
		
	}else{ // 업로드 된 상태
		File f=new File(path+"\\"+filename);
		vo.setFilename(filename); // 실제 저장된 파일명
		vo.setFilesize((int)f.length()); // 실제 크기 
	}
	
	DataBoardDAO dao=DataBoardDAO.newInstance();
	dao.databoardInsert(vo); // 데이터베이스에 추가
	
	// 이동
	response.sendRedirect("list.jsp");
%>