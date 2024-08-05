<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[type="button"]').click(function(){
			let msg='<h3>Hello Jquery</h3>'
//			$('#print').html(msg) // innerHTML
			$('#print').append(msg) // innerHTML (계속 추가, 생성)
			// append => 증가 (덮어쓰기 x)
			// html => 덮어쓰기, 한번만 사용 가능 (증가 x)
			// text() => textContent => html 번역이 안된다 => 외부에서 데이터를 가지고 온다 
		})
	})
</script>
</head>
<body>
	<input type="button" value="클릭">
	<p>
	<span id="print"></span>
</body>
</html>