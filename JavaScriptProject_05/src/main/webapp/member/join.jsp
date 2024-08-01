<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
    margin-top: 50px;
}
.row {
    margin: 0px auto;
    width: 600px;
}
</style>
<script type="text/javascript">
function postfind(){
	window.open("post.do","postfind","width=450,height=400,scrollbars=yes")
}
function idcheck()
{
	window.open("idcheck.do","idcheck","width=380,height=300,scrollbars=yes")
}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">회원 가입</h3>
		<div class="row">
			<form name="frm">
				<table class="table">
					<tr>	
						<th class="text-center" width="20%">아이디</th>
						<td width="80%">
							<input type="text" name="id" class="input-sm" size="15" readonly>
							<input type="button" value="아이디 중복 체크" class="btn-sm btn-primary" onclick="idcheck()">
						</td>
					</tr>
					<tr>	
						<th class="text-center" width="30%">우편번호</th>
						<td width="70%">
							<input type="text" name="post" class="input-sm" size="15" readonly>
							<input type="button" value="우편번호 검색" class="btn-sm btn-danger" id="postFindBtn" onclick="postfind()">
						</td>
					</tr>
					<tr>	
						<th class="text-center" width="20%">주소</th>
						<td width="80%">
							<input type="text" name="address" class="input-sm" size="45" readonly>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>