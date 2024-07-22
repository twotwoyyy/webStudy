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
		<h3>답변하기</h3>
		<%-- 답변은 insert : group_step, group_id, group_tab  --%>
		<div class="row">
			<form method="post" action="reply_ok.do">
				<table class="table">
					<tr>
						<th width="20%" class="text-right">이름</th>
						<td width="80%">
							<input type="text" name="name" size="20" class="input-sm" required>
							<input type="hidden" name="pno" value="${no }"><%--pno : 답변대상에 대한 번호(상위 게시글 번호) --%>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-right">제목</th>
						<td width="80%">
							<input type="text" name="subject" size="60" class="input-sm" required>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-right">내용</th>
						<td width="80%">
							<textarea rows="10" cols="60" name="content" required></textarea>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-right">비밀번호</th>
						<td width="80%">
							<input type="password" name="pwd" size="10" class="input-sm" required>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<button class="btn-sm btn-danger">답변</button>
							<input type="button" value="취소" class="btn-sm btn-primary" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>