<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,java.net.*"%>
<%
	// GET => 자동 한글 변환  => IE 10이상 => 이전 (server.xml : URIEncoding="UTF-8")
	// POST => 한글 변환 필요 => request.setCharacterEncoding()
	String fn=request.getParameter("fn");
	try{
		File file=new File("c:\\upload\\"+fn);
		// 1. 다운로드 창을 띄운다 => header
		response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(fn,"UTF-8"));
		// 2. 파일 복사 => 해당 클라이언트로 전송 
		int i=0;
		byte[] buffer=new byte[1024];
		// 프로그래스바
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
		// 서버에서 파일 읽기
		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
		// 클라이언트에 파일 생성
		while((i=bis.read(buffer,0,1024))!=-1){
			bos.write(buffer,0,i);
		}
		bis.close();
		bos.close();
		out.clear(); // 다운로드 기능의 out 객체 초기화
		out=pageContext.pushBody(); // out 다시 생성 
	}catch(Exception ex){
		ex.printStackTrace();
	}
	
%>