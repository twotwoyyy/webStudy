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
		$('img').click(function(){
			let src=$('img').attr("src")
			alert(src)
			
			$('img').attr("src","m2.jpg") // 클릭 시 그림을 바꿔준다 (setter)
			// 예약하기
			// val = text = attr = html = append
			// 모든 태그의 이벤트가 가능 => ajax
		})
	})
</script>
</head>
<body>
	<img src="m1.jpg" style="width:150px; height:200px">
</body>
</html>