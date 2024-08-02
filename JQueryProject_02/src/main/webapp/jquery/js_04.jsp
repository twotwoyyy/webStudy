<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고전적인 이벤트 모델</title>
<script type="text/javascript">
	// 고전적인 이벤트 처리 
	window.onload=()=>{
		let img=document.querySelector("img");
		img.onmouseover=function(){
			img.style.opacity=0.3 // 반투명 모드
		}
		img.onmouseout=function(){
			img.style.opacity=1.0
		}
		
		let btn=document.querySelector("button")
		btn.onclick=function(){
			alert("버튼 클릭")
		}
	}
</script>
</head>
<body>
	<img src="m1.jpg" width="200" height="250">
	<p>
	<button>클릭</button>
</body>
</html>