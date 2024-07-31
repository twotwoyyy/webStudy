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
</head>
<body>
	<div class="container">
		<div class="row">
		<h2 class="text-center">수정하기</h2> 
		<form method="post" action="../board/update_ok.do">
			<table class="table">
				<tr>
					<th width="10%" class="text-right">이름</th>
					<td width="85%">
						<input type="text" name="name" size="20" class="input-sm" value="${vo.name }">
						<input type="hidden" name="no" value="${vo.no }">
					</td>
				</tr>
				<tr>
					<th width="15%" class="text-right">제목</th>
					<td width="85%">
						<input type="text" name="subject" size="60" class="input-sm" value="${vo.subject }">
					</td>
				</tr>
				<tr>
					<th width="15%" class="text-right">내용</th>
					<td width="85%">
						<textarea rows="10" cols="60" name="content">${vo.content }</textarea>
					</td>
				</tr>
				<tr>
					<th width="15%" class="text-right">비밀번호</th>
					<td width="85%">
						<input type="password" name="pwd" size="10" class="input-sm">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center inline">
						<button class="btn-danger btn-sm">수정</button>
						<input type="button" value="취소" class="btn-primary btn-sm" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
		</div>
</div>
</body>
</html>