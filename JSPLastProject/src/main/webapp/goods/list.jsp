<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>foodList</title>
</head>
<body>
	<main class="container clear"> 
	    <div class="content"> 
	      <div id="gallery">
	        <figure>
	          <header class="heading">${title }</header>
	          <ul class="nospace clear">
	         	<c:forEach var="vo" items="${gList }" varStatus="s"> 
	            	<li class="one_quarter ${s.index%4==0?'first':''}"><a href="../goods/detail.do?no=${vo.no}&cno=${cno}"><img src="${vo.goods_poster }" title="${vo.goods_name }"></a></li>
	         	</c:forEach>
	          </ul>
	          <figcaption>Gallery Description Goes Here</figcaption>
	        </figure>
	      </div>
	      <nav class="pagination">
	        <ul>
	        	<%--startPage는 맨 처음 1, 11, 21...(10씩 증가) --%>
	          <c:if test="${startPage>1 }">
	          	<li><a href="../goods/list.do?page=${startPage-1 }&cno=${cno}">&laquo; Previous</a></li>
	          </c:if>
	          <c:forEach var="i" begin="${startPage }" end="${endPage }">
	          	<li ${i==curpage?"class=current":"" }><a href="../goods/list.do?page=${i }&cno=${cno}">${i }</a></li>
	          </c:forEach>
	          <c:if test="${endPage<totalpage }">
	          	<li><a href="../goods/list.do?page=${endPage+1 }&cno=${cno}">Next &raquo;</a></li>
	          </c:if>
	        </ul>
	      </nav>
	    </div>
    </main>
</body>
</html>