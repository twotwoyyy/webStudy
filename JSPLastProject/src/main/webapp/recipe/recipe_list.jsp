<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
          <header class="heading">총 <span style="font-size:25px; font-weight: bold; color: green;"><fmt:formatNumber value="${count }" pattern="###,###"/></span>개의 맛있는 레시피가 있습니다</header>
          <ul class="nospace clear">
          <c:forEach var="vo" items="${recipeList }" varStatus="s">          
            <li class="one_quarter ${s.index%4==0?'first':'' }"><a href="../recipe/recipe_detail.do?no=${vo.no }"><img src="${vo.poster }" title="${vo.title }"></a></li>
          </c:forEach>
          </ul>
          <figcaption>Gallery Description Goes Here</figcaption>
        </figure>
      </div>
      <nav class="pagination">
        <ul>
          <c:if test="${startPage>1 }">
          <li><a href="../recipe/recipe_list.do?page=${startPage-1 }">&laquo; Previous</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <li ${i==curpage?'class=current':'' }><a href="../recipe/recipe_list.do?page=${i }">${i }</a></li>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
          <li><a href="../recipe/recipe_list.do?page=${endPage+1 }">Next &raquo;</a></li>
          </c:if>
        </ul>
      </nav>
    </div>
    <div class="clear"></div>
  </main>
</div>
</body>
</html>