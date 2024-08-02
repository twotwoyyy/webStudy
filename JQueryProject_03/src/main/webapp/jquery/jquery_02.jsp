<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>text/html</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		let h1=$('h1').text() // 일반 태그 .text 
		$('h2').text(h1)
		$('h3').html('<font color="blue">Hello Jquery</font>')
	})
	
	/*
		text() : 문자 읽기, text(값) : 데이터 첨부 => 문자만 가능 
		html() : 문자 => html을 읽어온다(getter), html(값) : 데이터 첨부 (setter)
		
		
	*/
</script>
</head>
<body>
	<h1>Hello Jquery!!</h1>
	<h2></h2>
	<h3></h3>
</body>
</html>