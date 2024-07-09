<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--

	149page 
	
	include 지시자 : JSP안에 특정 부분에 다른 JSP를 추가해서 사용이 가능
	============ <%@ include file="파일명 지정" %>
	             각 JSP에서 공통으로 사용되는 파일이 있는 경우에 주로 사용
	             =========================
	              1. 메뉴
	              2. footer
	              3. 로고 / 검색창
	              => 사이트 : 파일 50~70개 => 고정 
	              => 정적 / 동적 (<jsp:include>)
	<%@ include file="파일명" %>
	
	a.jsp
	  <html>
	    <body>
	      <%
	        int a=100;
	      %>
	      <%@ include file="b.jsp"%>
	    </body>
	  </html>
	  
	  b.jsp
	   <html>
	     <body>
	     <%
	       int a=10;
	     %>
	     </body>
	   </html>
	   
	   <jsp:include page="b.jsp">
	   ==========================
	   a.jsp => 컴파일 html 변환
	   b.jsp => 컴파일 html 변환 ===> 변환된 html 통합 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
</head>
<body>
	<table class="table_content" width=800 height=700>
		<tr>
			<td colspan="2" height="100">
			<%@ include file="Header.jsp" %>
			</td>
		</tr>
		<tr>
			<td width="300" height="500">
			<%@ include file="Aside.jsp" %>
			</td>
			<td width="500" height="500">
			<%@ include file="Section.jsp" %>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="100">
			<%@ include file="Footer.jsp" %>
			</td>
		</tr>
	</table>
</body>
</html>