<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setInterval() : 계속 수행 </title>
<script type="text/javascript">
	let index=1
	window.onload=()=>{
		setInterval('show()',1000) // 1000 => 1초마다 한번 씩 수행하게 만든다 
	}
	function show(){
		index++;
		if(index>7)
			index=1
		let img=document.querySelector('img')
		img.src='m'+index+'.jpg'
	}
</script>
</head>
<body>
	<center>
		<img src="m1.jpg" width="350" height="450">
	</center>
</body>
</html>