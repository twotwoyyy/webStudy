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
	<div class="wrapper row4">
		<footer id="footer" class="clear">
			<div class="one_third first">
				<h6 class="title">공지사항</h6>
				<ul class="nospace linklist">
				<c:forEach var="vo" items="${footerNList }">
					<li><a href="#">${vo.subject }</a></li>
				</c:forEach>
				</ul>
			</div>
			<div class="one_third">
				<h6 class="title">이벤트</h6>
				<ul class="nospace linklist">
					<li><a href="#">Home Page</a></li>
					<li><a href="#">Blog</a></li>
					<li><a href="#">Gallery</a></li>
					<li><a href="#">Portfolio</a></li>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>
			<div class="one_third">
				<h6 class="title">맛집뉴스</h6>
				<ul class="nospace linklist">
					<li><a href="#">Home Page</a></li>
					<li><a href="#">Blog</a></li>
					<li><a href="#">Gallery</a></li>
					<li><a href="#">Portfolio</a></li>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>
		</footer>
	</div>
	<div class="wrapper row5">
		<div id="copyright" class="clear">
			<p class="fl_right">
				프로젝트 by <a target="_blank" href="#" title="1차 JSP 프로젝트">D 강의장</a>
			</p>
		</div>
	</div>
</body>
</html>