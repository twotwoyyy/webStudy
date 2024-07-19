<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="model" class="com.sist.model.BoardModel"/>
<% model.boardListData(request); // 모델에 처리 메소드 호출 => 자동화 처리 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>board list</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 960px;
}
h3{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>자유 게시판</h3>
		<div class="row">
			<table class="table">
			<tr>
				<td colspan="5">
					<a href="insert.jsp" class="btn btn-sm btn-warning">새 글</a>
				</td>
			</tr>
				<tr class="danger">
					<th width="10%" class="text-center">번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">이름</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td width="10%" class="text-center">${vo.no }</td>
						<td width="45%"><a href="detail.jsp?no=${vo.no }">${vo.subject }</a>
						&nbsp;<c:if test="${today==vo.dbday }">
								<sup><img src="new.gif"></sup>
							</c:if>
						</td>
						<td width="15%" class="text-center">${vo.name }</td>
						<td width="20%" class="text-center">${vo.dbday }</td>
						<td width="10%" class="text-center">${vo.hit }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" class="text-center">
						<a href="list.jsp?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-success">이전</a>
							${curpage } page/ ${totalpage } pages
						<a href="list.jsp?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-info">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>