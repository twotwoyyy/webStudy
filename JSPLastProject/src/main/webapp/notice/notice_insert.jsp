<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 class="sectiontitle">공지 등록</h2>
	<form method="post" action="../adminpage/notice_insert_ok.do">
		<table class="table">
			<tr>
				<th width="20%" class="text-center">구분</th>
				<td width="80%">
					<select class="input-sm" name="type">
						<option value="1">일반 공지</option>
						<option value="2">이벤트 공지</option>
						<option value="3">맛집 공지</option>
						<option value="4">여행 공지</option>
					</select>
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-center">제목</th>
				<td width="80%">
					<input type="text" name="subject" class="input-sm" size="50" required>
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-center">내용</th>
				<td width="80%">
					<textarea rows="10" cols="50" name="content" required></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center inline">
					<button class="btn-sm btn-success">등록</button>
					<input type="button" class="btn-sm btn-info" value="취소" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>