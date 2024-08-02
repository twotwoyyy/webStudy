<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setTimeout() ok => main 자동이동</title>
<script type="text/javascript">
	window.onload=()=>{
		let btn=document.querySelector("button")
		btn.addEventListener('click',()=>{
			show()
		})
	}
	function show(){
		location.href='ok.jsp'
	}
</script>
</head>
<body>
	<button>회원가입</button>
</body>
</html>