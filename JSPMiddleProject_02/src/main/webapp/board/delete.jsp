<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 600px;
}
h3{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<form method="post" action="delete_ok.jsp">
				<table class="table">
					<tr>	
						<td class="text-center">비밀번호:<input type="password" name="pwd" size="20" class="input-sm">
						<input type="hidden" name="no" value="${param.no}">
						<%--
							${requestScope.key명} => request.getAttribute(key명)
							==================== 생략이 가능
							${sessionScope.key명} => session.getAttribute(key명)
							${param.key명} => request.getParameter()
						 --%>
						</td>
					</tr>
					<tr>
						<td class="text-center">
							<button class="btn-sm btn-primary">삭제</button>
							<input type="button" value="취소" class="btn-sm btn-primary" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>