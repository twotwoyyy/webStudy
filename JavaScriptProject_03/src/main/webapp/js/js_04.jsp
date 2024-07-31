<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
    margin-top: 50px;
}
.row {
    margin: 0px auto;
    width: 960px;
}

</style>
<script type="text/javascript">
window.onload=()=>{
	//let img=document.querySelector("img"); 한 개의 태그만 적용
	let img=document.querySelectorAll("img"); 
	for(let i=0;i<img.length;i++){
		img[i].style.border="3px solid red"
		img[i].style.width="120px"
		img[i].style.height="150px"
		img[i].style.opacity=0.3
	}
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<img src="m1.jpg" style="width:100%">
			<img src="m2.jpg" style="width:100%">
			<img src="m3.jpg" style="width:100%">
			<img src="m4.jpg" style="width:100%">
			<img src="m5.jpg" style="width:100%">
			<img src="m6.jpg" style="width:100%">
			<img src="m7.jpg" style="width:100%">
		</div>
	</div>

</body>
</html>