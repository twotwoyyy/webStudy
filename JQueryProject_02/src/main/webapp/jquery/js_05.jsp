<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 리스너</title>
<script type="text/javascript">
	window.onload=function(){
		let h1=document.querySelector("#h1")
		let gBtn=document.querySelector("#green")
		let bBtn=document.querySelector("#blue")
		let rBtn=document.querySelector("#red")
		
		gBtn.addEventListener('click',function(){
			h1.style.color='green'
		})
		bBtn.addEventListener('click',function(){
			h1.style.color='blue'
		})
		rBtn.addEventListener('click',function(){
			h1.style.color='red'
		})
		// $().on('click',function(){}) 로 간단히 변경 ! 
		
	}
</script>
</head>
<body>
	<h1 id="h1">제목</h1>
	<button id="green">Green</button>
	<button id="blue">Blue</button>
	<button id="red">Red</button>
</body>
</html>