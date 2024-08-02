<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>html/text 차이</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		//let div=$('#aaa').html() // html 전부 읽기
		let div=$('#aaa').text() // html 태그 안 문자만 읽기
		
		alert(div)
	})
</script>
</head>
<body>
	<div id="aaa">
		<h1>Hello Jquery!!</h1>
		<h1>Hello Jquery!!</h1>
		<h1>Hello Jquery!!</h1>
	</div>
</body>
</html>