<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 300px;
}
h3{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>Login</h3>
		<div class="row">
			<form method="post" action="login_ok.jsp">
				<table class="table">
					<tbody>
						<tr>
							<th width="20%" class="text-right">ID</th>
							<td width="80%">
								<input type="text" name="id" class="input-sm" size="20" required>
							</td>
						</tr>
						<tr>
							<th width="20%" class="text-right">Password</th>
							<td width="80%">
								<input type="password" name="pwd" class="input-sm" size="20" required>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<button class="btn-sm btn-danger">로그인</button>
								<input type="button" value="회원가입" class="btn-sm btn-primary">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>