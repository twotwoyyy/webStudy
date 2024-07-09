<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP 동작 구조 
	1. JSP 파일 요청 => URL 
	   http://localhost/JSPBasicProject_04/jsp/basic_01.jsp
	2. 웹 서버가 요청을 받는다
	   httpd
	   => 해결 => .html / .xml 
	   => .jsp, .servlet은 처리 못함 
	      ============== 따라서 
	3. WAS(Tomcat)로 전송
	   ===========
	4. jsp파일을 자바 파일로 변경
	   a.jsp => a_jsp.java (톰캣이 처리)
	   =====
	   코딩한 내용을 public void _jspService()에 첨부  
	   
	   이 주석 부분은 소스코드에 첨부되지 않는다 
    5. 컴파일 => a_jsp.class
    6. 실행 (인터프리터) 
       out.write()에 있는 내용만 메모리에 저장 
    7. 저장된 메모리에서 브라우저가 읽어서 출력 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 화면에 출력하는 태그 -->
</body>
</html>