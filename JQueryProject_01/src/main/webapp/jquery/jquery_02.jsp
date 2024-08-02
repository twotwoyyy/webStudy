<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	Back : java,python,c/c++
	=========================
	       Web : JSP
	       MVC : spring (자바) / Django (파이썬)
	       DB : Oracle / MySQL / MariaDB
	       Mapper : MyBatis / JPA
	Front : JavaScript / TypeScript
	       Web : 라이브러리 사용 
	             Jquery (Ajax)
	             VueJS / ReactJS
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#aaa span').css("color","red")
	$('#bbb span').css("color","green")
	$('#ccc span').css("color","blue")
})
</script>
</head>
<body>
	<div id="aaa">
		<span>Hello~~</span>
	</div>
	<div id="bbb">
		<span>Hello~~</span>
	</div>
	<div id="ccc">
		<span>Hello~~</span>
	</div>
</body>
</html>