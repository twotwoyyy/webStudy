<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%-- HTML문법  --%>
  <%
      // 자바 코딩 영역 => 자바 문법을 사용 
      for(int i=1;i<=10;i++)
      {
  %>
         <%= i %><br> 
  <%
      }
  %>
</body>
</html>