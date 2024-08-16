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
<body>

	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">답변하기</h2>
			<form method=post action="../adminpage/reply_insert_ok.do">
				<table class="table">
					<tr>
						<th width=20% class="text-center">제목</th>
						<td width=80%><input type=text name=subject class="input-sm"
							size=50> <input type=hidden name=no value="${no }">
						</td>
					</tr>
					<tr>
						<th width=20% class="text-center">내용</th>
						<td width=80%><textarea rows="10" cols="50" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center inline">
							<button class="btn-sm btn-danger">등록</button> <input type=button
							value="취소" class="btn-sm btn-warning"
							onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</main>
	</div>
</body>
</html>