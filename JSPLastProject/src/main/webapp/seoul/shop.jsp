<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑</title>
</head>
<body>
	<main class="container clear"> 
	    <div class="content"> 
	      <div id="gallery">
	        <figure>
	          <header class="heading">쇼핑</header>
	          <ul class="nospace clear">
	         	<c:forEach var="vo" items="${sList }" varStatus="s"> 
	            	<li class="one_quarter ${s.index%4==0?'first':''}"><a href="../seoul/shop_detail.do?no=${vo.no}"><img src="${vo.poster}" title="${vo.title}"></a></li>
	         	</c:forEach>
	          </ul>
	          <figcaption>Gallery Description Goes Here</figcaption>
	        </figure>
	      </div>
	      <nav class="pagination">
	        <ul>
	        	<%--startPage는 맨 처음 1, 11, 21...(10씩 증가) --%>
	          <c:if test="${startPage>1 }">
	          	<li><a href="../seoul/shop.do?page=${startPage-1 }">&laquo; Previous</a></li>
	          </c:if>
	          <c:forEach var="i" begin="${startPage }" end="${endPage }">
	          	<li ${i==curpage?"class=current":"" }><a href="../seoul/shop.do?page=${i }">${i }</a></li>
	          </c:forEach>
	          <c:if test="${endPage<totalpage }">
	          	<li><a href="../seoul/shop.do?page=${endPage+1 }">Next &raquo;</a></li>
	          </c:if>
	        </ul>
	      </nav>
	    </div>
    </main>
</body>
</html>