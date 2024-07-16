<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb"%>
<%--
	1.out
	 => 출력 버퍼 관리 객체명 => JSPWriter
	    ===== HTML을 저장하는 메모리 공간
	    | JSP를 실행 요청 => 톰캣 => out.write()을 메모리에 출력
	                            ===========
	                            서블릿 out.write("<html>")
	                            JSP HTML앞에 out.write를 생략
	    | 브라우저에서 읽기 => 자동으로 메모리를 바꿔준다
	                      ==================
	                      브라우저에서 읽을 때마다 잘라내기 한다 : 사용자당 메모리 공간 1개 생성
	                      => out,session,cookie
	                                     ======= 브라우저에 저장
	    | 기본 저장 공간 : 8kb
	      ========== HTML이 많거나 (상용된 사이트) => 크기를 변경할 수 있다
	      <%@ page buffer="16kb" %>
	  => 주요 메소드
	     println()/print()/write() => HTML 저장 용도 => <%= %>
	                                                 =======
	                                                 out.print()
	     getBufferSize() : 버퍼의 크기 확인
	     getRemaining() : 남아있는 버퍼 크기 확인
	     => out 객체는 한번만 사용한다 => 다운로드
	       ======== <%= %> : ${}
	     *** 권장사항 : <%@~ 지시자를 제외하고 <% 제거한다 => HTML/Java를 통합하지 않는다
	         JSP안에 자바 코딩 : 재사용을 할 수 없다 
	                         ==============
	                         자바를 별도로 제작 (재사용, 추가, 삭제, 수정 편리)
	                         ======================================
	                         MVC (자바 따로, HTML 따로..)
	                         == 개발자 인원 추가 (개발 속도가 빠르다) 
	 2. application
	 3. pageContext
	 4. page / config / exception (X)
	           => web.xml
	           
	           ${ "Out(JspWrite)"} <%-- EL --%>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전체 버퍼 크기 확인:<%= out.getBufferSize() %>(8*1024)</h3>
	<h3>남아 있는 버퍼 크기: <%= out.getRemaining() %></h3>
	<h3>사용 중인 버퍼의 크기:<%= out.getBufferSize()-out.getRemaining() %></h3>
	<br>
	<%
		out.print("<font color=red>Out(JSPWriter)</font><br>");
		out.println("<font color=blue>Out(JSPWriter)</font>"); // println은 메모리에만 적용 
		out.write("<font color=green>Out(JSPWriter)</font>");
	%>
	<br>
	<%= "Out(JspWrite)" %><%-- out.print()로 변환 --%><br>
	
</body>
</html>