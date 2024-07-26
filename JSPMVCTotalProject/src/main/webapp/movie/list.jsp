<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
	margin: 0px auto;
	width: 960px;
}
h3{
	text-align: center;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // main => window.onload=function(){}
	$('.dataTr').hover(function(){
		let poster=$(this).attr("data-poster");
		$('#poster').html('<img src="'+poster+'"style="width:100%">');
		$(this).css("cursor","pointer").css("backgroundColor","#999");
	},function(){
		$('#poster').html('');
		$(this).css("backgroundColor","#FFF");
	})
})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<a href="list.do?type=1" class="btn btn-lg btn-success">일별 박스오피스</a>
				<a href="list.do?type=2" class="btn btn-lg btn-info">실시간 예매율</a>
				<a href="list.do?type=3" class="btn btn-lg btn-warning">좌석 점유율</a>
			</div>
			<h3>${title }</h3>
		</div>
		<div class="col-sm-4">
			<table class="table">
				<tr>
					<td class="text-center" id="poster">
						
					</td>
				</tr>
			</table>
		</div>
		<div class="col-sm-8">
			<table class="table">
				<tr>
					<th class="text-center">순위</th>
					
					<th class="text-center">영화명</th>
					<th class="text-center">감독</th>
					<th class="text-center">장르</th>
					<th class="text-center">등급</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr class="dataTr" data-poster="${vo.poster }">
						<td class="text-center">${vo.rank }</td>
						<td>${vo.title }</td>
						<td>${vo.director }</td>
						<td>${vo.genre }</td>
						<td>${vo.grade }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>