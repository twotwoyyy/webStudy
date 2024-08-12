<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear"> 
			<h2 class="sectiontitle">상세 보기</h2>
			<table class="table">
				<tr>
					<td width="30%" class="text-center" rowspan="5">
						<img src="${vo.goods_poster}" style="width:100%">
					</td>
					<td colspan="2">
						<h4 id="h4">${vo.goods_name }</h4>
					</td>
				</tr>
			</table>
		</main>
	</div>
</body>
</html>