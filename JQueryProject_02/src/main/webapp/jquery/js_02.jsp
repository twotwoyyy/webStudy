<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	for(let i=1;i<=7;i++){
		let img=document.createElement('img') // <img> => react 
		img.src='m'+i+'.jpg'
		img.width=120
		img.height=200
		img.title='영화명'
		// <img src="" width="" height="" title=""> 
		document.body.appendChild(img)
	}
}
</script>
</head>
<body>

</body>
</html>