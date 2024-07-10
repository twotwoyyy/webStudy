<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
	margin: 0px auto;
	width: 500px; 
}
</style>
</head>
<body>
	<div class="row row1">
		<h1 class="text-center">개인정보 전송</h1>
		<form method="post" action="action_include.jsp?mode=6">
			<table class="table">
				<tr>
					<th width="20%">이름</th>
					<td width="80%">
						<input type="text" name=name size=20 class="input-sm">
					</td>
				</tr>
				<tr>
					<th width="20%">성별</th>
					<td width="80%">
						<input type="radio" value="남자" checked name="sex">남자
						<input type="radio" value="여자" name="sex">여자
					</td>
				</tr>
				<tr>
					<th width="20%">주소</th>
					<td width="80%">
						<input type="text" name=address size=50 class="input-sm">
					</td>
				</tr>
				<tr>
					<th width="20%">전화</th>
					<td width="80%">
						<input type="text" name=phone size=20 class="input-sm">
					</td>
				</tr>
				<tr>
     				 <td colspan="2" class="text-center">
       					<button class="btn-sm btn-danger">전송</button>
    				 </td>
   			    </tr>
			</table>
		</form>
	</div>
</body>
</html>