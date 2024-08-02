<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 리스너</title>
<style type="text/css">
#box{
	width:200px;
	height:200px;
	border:1px solid black;
}
</style>
<script type="text/javascript">
	window.onload=function(){
		let div=document.querySelector("#box")
		div.addEventListener('mousedown',()=>{
			div.style.background='pink'
		}) // 태그 하나만 읽기 querySelector.. 
		div.addEventListener('mouseup',event=>{
			event.currentTarget.style.background='orange'
		}) // 태그 하나만 읽기 querySelector.. 
		// $('#box').mouseup(function(){}) => JQuery
		// $('#box').on('mouseup',function(){}) => JQuery
		// id명은 중복되면 안된다 
		// => 선택한 태그를 $(this)
	}
</script>
</head>
<body>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
	<div id="box"></div>
</body>
</html>