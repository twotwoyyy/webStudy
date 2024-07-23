<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 960px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table table-striped">
				<tr>
					<td width="30%" class="text-center" rowspan="6"><img
						src="${vo.poster }" style="width: 100%" class="img-rounded">
					</td>
					<td colspan="2"><h3>${vo.name }</h3></td>

				</tr>
				<tr>
					<th>음식종류</th>
					<td>${vo.type }</td>
				</tr>
				<tr>
					<th>전화</th>
					<td>${vo.phone }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${vo.address }</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>${vo.score }</td>
				</tr>
				<tr>
					<th>테마</th>
					<td>${vo.theme }</td>
				</tr>
				<tr>
					<td colspan="2" class="text-right"><input type=button
						value="찜하기" class="btn-xs btn-primary"> <input type=button
						value="좋아요" class="btn-xs btn-success"> <input type=button
						value="예약" class="btn-xs btn-info"> <input type=button
						value="목록" class="btn-xs btn-warning"
						onclick="javascript:history.back()"></td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td><pre
							style="white-space: pre-wrap; border: none; background-color: white;"> ${vo.content }
						</pre></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>