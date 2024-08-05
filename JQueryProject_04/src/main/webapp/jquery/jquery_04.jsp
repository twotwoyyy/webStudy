<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 700px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('td').css('cursor','pointer')
		$('td').click(function(){
			let data=$(this).text() // 태그와 태그 사이 값 읽어오기, 매개변수가 없는 경우 => getter 
			alert(data)
			$('h3').text(data+" 선택") // 값을 집어넣을 수 있다 , 매개변수 있는 경우 => setter 
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">사원 목록</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td>홍길동</td>
					<td>사원</td>
					<td>서울</td>
				</tr>
				<tr>
					<td>심청이</td>
					<td>부장</td>
					<td>부산</td>
				</tr>
				<tr>
					<td>박문수</td>
					<td>대리</td>
					<td>제주</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>