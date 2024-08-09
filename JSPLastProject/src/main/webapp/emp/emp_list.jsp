<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('#findBtn').click(function(){
			let names=[]
			$('input[name="names"]').each(function(){
				if($(this).is(":checked")){
					//console.log($(this).val())
					names.push($(this).val()) // 배열에 값을 담는다
					// $(this) => 선택된 체크박스 읽기 
				}
			})
			console.log(names)
			$.ajax({
				type:'post',
				url:'../emp/emp_find.do',
				data:{"names":names},
				success:function(result){
					$('#print').html(result)  // 인크루드
				},
				error:function(request,status,error){
					console.log(error)
				}
			})
		})
	})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-center">
					<c:forEach var="name" items="${list }">
						<input type="checkbox" value="${name }" name="names">${name }
					</c:forEach>
						
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<input type="button" class="btn-sm btn-danger" id="findBtn" value="검색">
					</td>
				</tr>
			</table>
		</div>
		<div style="height:20px"></div>
		<div class="row" id="print">
			
		</div>
	</div>
</body>
</html>