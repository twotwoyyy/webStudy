<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hide(), show()</title>
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
<%-- 댓글 --%>
	let i=0;
	$(function(){
		$('#showBtn').click(function(){
			if(i===0){
				i=1;
				$('#aaa').show("slow")
				$('#showBtn').val("취소")
			}else{
				i=0;
				$('#aaa').hide()
				$('#showBtn').val("삭제")
			}
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h1 class="text-center">hide(), show()</h1>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-right">
						<input type="button" id="showBtn" value="삭제" class="btn-sm btn-danger">
					</td>
				</tr>
				<tr style="display:none" id="aaa">
					<td class="text-right">
						비밀번호: <input type="password" class="input-sm" id="pwd">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>