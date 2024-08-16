<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<style>
.container{
	margin-top:50px;
}
.row{
	margin:0px auto;
	width:300px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('#idBtn').click(function(){
			let id=$('#id').val()
			if(id.trim()===""){
				$('#id').focus()
				return
			}
				/*
					서버로 전송(데이터) => GET/POST
					표시 없이 전송 => GET
					POST : 1) <form> 2) ajax
					      ==================== 나머지는 GET => ?
					      JavaScript : location.href
					      Java       : sendRedirect()
					      ============================ GET만 사용 가능
				*/
			$.ajax({
				type:'post',
				url: '../member/idcheck_ok.do',
				data:{"id":id},
				success:function(result){
					let count=Number(result.trim())
					if(count===0){
						$('#ok').show()
						$('#res').html(
							'<span style="color:blue">'
							+id+'는(은) 사용가능한 아이디입니다 </span>' 
						)
						$('#id').prop('disabled',true)
					}else{
						$('#ok').hide()
						$('#res').html(
							'<span style="color:red">'
							+id+'는(은) 이미 사용 중인 아이디입니다 </span>' 
						)
						$('#id').val("")
						$('#id').focus()
					}
				},
				error:function(request,status,error){
					console.log(error)
				}
			})
			$('#okBtn').click(function(){
				parent.frm.id.value=$('#id').val()
				parent.Shadowbox.close()
			})
		})
	})
</script>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>	
					<td> ID : <input type="text" name="id" id="id" size="15" class="input-sm">
					<input type="button" value="중복체크" class="btn-sm btn-warning" id="idBtn">
					</td>
				</tr>
				<tr>
					<td class="text-center" id="res"></td>
				</tr>
				<tr id="ok" style="display: none">
					<td class="Text-cneter">
						<input type="button" value="확인" id="okBtn" class="btn-sm btn-success">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>