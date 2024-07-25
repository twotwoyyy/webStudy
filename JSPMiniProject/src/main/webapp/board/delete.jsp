<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.brow{
	margin: 0px auto;
	width: 350px;
}
</style>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<div class="brow">
			<h2 class="sectiontitle">삭제하기</h2>
			<form method="post" action="../board/delete_ok.do">
				<table class="table">
					<tr>	
						<td class="text-center inline" >
							비밀번호:  <input type="password" name="pwd" size="15" class="input-sm">
							<input type="hidden" name="no" value="${no }"> 
						</td>	
					</tr>
					<tr>
						<td class="text-center inline">
							<button class="btn btn-sm btn-danger">삭제</button>
							<input type="button" value="취소" class="btn-primary btn-sm" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
			</div>
		</main>
	</div>
</body>
</html>