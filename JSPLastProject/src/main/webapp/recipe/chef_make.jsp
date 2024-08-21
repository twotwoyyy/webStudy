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
	<div class="wrapper row3">
		<main class="container clear">
			<div class="content">
				<div id="gallery">
					<figure>
						<header class="heading">${chef }님의 레시피 목록</header>
						<ul class="nospace clear">
							<c:forEach var="vo" items="${chefList }" varStatus="s">
								<li class="one_quarter ${s.index%4==0?'first':'' }">
								<a href="../recipe/recipe_detail.do?no=${vo.no }"> 
								<img src="${vo.poster }" title="${vo.title }">
								</a>
								</li>
							</c:forEach>
						</ul>
					</figure>
				</div>
				<div style="height:10px"></div>
				<div>
					<div class="text-center">
						<a href="../recipe/chef_make.do?chef=${chef }&page=${curpage>1?curpage-1:curpage}" class="btn btn-sm btn-success">이전</a>
							${curpage } page / ${totalpage } pages
						<a href="../recipe/chef_make.do?chef=${chef }&page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-sm btn-success">다음</a>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>