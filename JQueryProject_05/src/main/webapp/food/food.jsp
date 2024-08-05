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
	<div class="container">
		<div class="row">
			<c:forEach var="vo" items="${list }">
				<div class="col-sm-3">
					<a href="#">
						<div class="thumbnail">
							<img src="${vo.poster }" style="width:100%">
							<p class="a">${vo.name }</p>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<div style="height:20px"></div>
		<div class="row">
			<div class="text-center">
				<a href="#" class="btn btn-sm btn-success">이전</a>
					${curpage } page / ${totalpage } pages
				<a href="#" class="btn btn-sm btn-info">다음</a>
			</div>
		</div>
	</div>
</body>
</html>