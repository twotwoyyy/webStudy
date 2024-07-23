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
	<div class="row">
		<h3 class="text-center">뮤직 Top200</h3>
		<table class="table">
			<tr class="success">
				<th class="text-center">순위</th>
				<th class="text-center"></th>
				<th class="text-center"></th>
				<th class="text-center">곡명</th>
				<th class="text-center">가수명</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td class="text-center">${vo.mno }</td>
					<td class="text-center">
						<c:choose>
							<c:when test="${vo.state=='유지' }"><span style="color:gray">-</span></c:when>
							<c:when test="${vo.state=='상승' }"><span style="color:blue">▲</span>&nbsp;${vo.idcrement }</c:when>
							<c:when test="${vo.state=='하강' }"><span style="color:red">▼</span>&nbsp;${vo.idcrement }</c:when>
						</c:choose>
					</td>
					<td class="text-center">
						<img src="${vo.poster }" style="width: 30px; height: 30px">
					</td>
					<td><a href="../music/detail.do?mno=${vo.mno }">${vo.title }</a></td>
					<td>${vo.singer }</td>
				</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td class="text-center">
					<a href="../music/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-success">이전</a>
					${curpage } page / ${totalpage } pages
					<a href="../music/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-success">다음</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>