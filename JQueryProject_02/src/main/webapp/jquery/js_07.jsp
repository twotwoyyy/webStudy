<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 리스너 Jquery</title>
<style type="text/css">
.box{
	width:200px;
	height:200px;
	border:1px solid black;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	//window.onload=function(){}를 대체
	$(function(){
		$('.box').on('mousedown',function(){
			$(this).css("background","pink")
		})// 리스너 방식 
		$('.box').mouseup(function(){
			$(this).css("background","orange")
		})// 고전적인 방식
	})
</script>
</head>
<body>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
</body>
</html>