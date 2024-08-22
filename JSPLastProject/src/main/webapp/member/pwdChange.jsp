<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<form method="post" action="../member/pwd_change_ok.do">
		<table class="table">
			<tr>
				<th width="20%">비밀번호</th>
				<td width="80%"><input type="password" name="old_pwd" size="20" class="input-sm"></td>
			</tr>
			<tr>
				<th width="20%">새 비밀번호</th>
				<td width="80%"><input type="password" name="new_pwd" size="20" class="input-sm"></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center inline">
					<input type="submit" class="btn btn-sm btn-danger" value="비밀번호 변경">
					<input type="button" class="btn-sm btn-primary" value="취소" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>