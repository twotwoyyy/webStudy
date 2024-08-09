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
	width: 960px;
}
.dataTr:hover{
	background-color: #FC6;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$('.dataTr').click(function(){
			let mno=$(this).attr("data-mno")
			//alert("선택된 번호:"+mno)
			//let title=$(this).attr("data-title")
			//$('#dialog').attr("title",title)
			$.ajax({
				type:'post',
				url:'../music/detail.do',
				data:{"mno":mno},
				success:function(result){
					$('#movie').attr("src",result);
					$('#dialog').dialog({
						autoOpen:false,
						modal:true,
						width:500,
						height:500
					}).dialog("open")
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
		<h3 class="text-center">Music Top200</h3>
		<div class="row">
			<form method="post" action="list.do">
				<table class="table">
					<tr>
						<td>
							<select name="column" class="input-sm">
								<option value="title">곡명</option>
								<option value="singer">가수명</option>
								<option value="album">앨범</option>
							</select>
							<input type="text" name="ss" size="20" class="input-sm">
							<button class="btn-sm btn-primary">검색</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div style="height:20px"></div>
		<div class="row">
			<table class="table">
				<tr>
					<th class="text-center">순위</th>
					<th class="text-center"></th>
					<th class="text-center">곡명</th>
					<th class="text-center">가수명</th>
					<th class="text-center">앨범</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr class="dataTr" data-mno="${vo.mno }" data-title="${vo.title }">
						<td class="text-center">${vo.mno }</td>
						<td class="text-center">
							<img src="${vo.poster }" style="width:30px; height:30px">
						</td>
						<td>${vo.title }</td>
						<td>${vo.singer }</td>
						<td>${vo.album }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="dialog" title="동영상" style="display:none"></div>
	</div>
	<div id="dialog" title="이미지" style="display:none;">
		<img src="" style="width:450px; height:420px" id="movie">
		<%--<img embed="".. --%>
	</div>
</body>
</html>