<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 900px;
}
.a{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({ // 처음 화면을 띄울 때 처리
			type:'post',
			url:'type.do',
			success:function(result){
				$('#print').html(result)
			}
		})
		$('.typeBtn').click(function(){ // 버튼을 눌렀을 때 타입별로 출력 처리
			let no=$(this).attr("data-type")
			$.ajax({
				type:'post',
				url:'type.do',
				data:{"type":no},
				success:function(result){
					$('#print').html(result) // responseText => 실행된 HTML을 읽어 온다 
					// ajax => 가라 ajax
				}
			})
		})
	})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<button class="btn btn-lg btn-success typeBtn" data-type="1">한식</button>
				<button class="btn btn-lg btn-info typeBtn" data-type="2">중식</button>
				<button class="btn btn-lg btn-danger typeBtn" data-type="3">양식</button>
				<button class="btn btn-lg btn-primary typeBtn" data-type="4">일식</button>
				<button class="btn btn-lg btn-warning typeBtn" data-type="5">분식</button>
			</div>
		</div>
		<div style="height:20px"></div>
		<div id="print"></div>
	</div>
</body>
</html>