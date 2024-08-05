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
/*		$('input[type="button"]').click(function(){
			let id=$('#id').val()
			let pwd=$('#pwd').val()
			let name=$('#name').val()
			alert("아이디: "+id+"\n"
					+"비밀번호: "+pwd+"\n"
					+"이름: "+name) */
		//let form=$('#frm')
		//let data=new FormData(form)
		//alert(data)
		//let data=new FormData($('#frm'))
		
		//console.log(data)
		$('#id').val("hong")
		$('#pwd').val("1234")
		$('#name').val("홍길동") // cookie에서 읽어서 => 값을 대입 (자동 로그인)
		$('input[type="button"]').click(function(){
			})
	})
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">회원 가입</h3>
		<div class="row">
			<form id=trm>
				<table class="table">
					<tr>
						<th width="15%" class="text-center">아이디</th>
						<td width="85%">
							<input type="text" id="id" class="input-sm" size="20">
						</td>
					</tr>
					<tr>
						<th width="15%" class="text-center">비밀번호</th>
						<td width="85%">
							<input type="password" id="pwd" class="input-sm" size="20">
						</td>
					</tr>
					<tr>
						<th width="15%" class="text-center">이름</th>
						<td width="85%">
							<input type="text" id="name" class="input-sm" size="20">
						</td>
					</tr>
					<tr>
						<td class="text-center" colspan="2">
							<input type="button" value="전송" class="btn-sm btn-danger"> 
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>