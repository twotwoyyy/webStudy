<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	자바문법 사용 
	제어문 
	  if / if~else / if~else if~else
	  => 관리자와 일반 사용자 구분할 때 자주 사용 
	     if(admon==1) => 관리자 페이지 
	     else => 일반 사용자 (마이페이지) 
	  while / for / break 
 	  while => 무한스크롤
 	  for => 목록, 페이지
 	  break => 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 1~100까지 => 짝수의 합 / 홀수의 합 / 전체 합 
		int sum=0, even=0, odd=0;
 		for(int i=1;i<=100;i++){
 			sum+=i;
 			if(i%2==0)
 				even+=i;
 			else
 				odd+=i;
 		}
	%>
	<%="1~100까지 총합:"+sum %><br>
	<%="1~100까지 짝수합:"+even %><br>
	<%="1~100까지 홀수합:"+odd %><br>
</body>
</html>