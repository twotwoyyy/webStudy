<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear"> 
			<h2 class="sectiontitle">상세 보기</h2>
			<table class="table">
				<tr>
					<td class="text-center" colspan="3">
						<img src="${vo.poster }" style="width: 800px; height: 450px;">
					</td>
				</tr>
				<tr>	
					<td colspan="3" class="text-center" style="color:black; font-weight: bold;"><h4>${vo.title }</h4></td>
				</tr>
				<tr>
					<td colspan="3" class="text-left">${vo.content }</td>
				</tr>
				<tr>
					<td class="text-center"><img src="../recipe/icon/a1.png"></td>
					<td class="text-center"><img src="../recipe/icon/a2.png"></td>
					<td class="text-center"><img src="../recipe/icon/a3.png"></td>
				</tr>
				<tr>
					<td class="text-center">${vo.info1 }</td>
					<td class="text-center">${vo.info2 }</td>
					<td class="text-center">${vo.info3 }</td>
				</tr>
			</table>
			<div style="height:5px"></div>
			<table class="table">
				<caption><h4 style="color:black">[재료]</h4></caption>
				<tr>
					<td>
						<ul style="list-style-type: none">
						<c:forTokens items="${vo.data }" delims="," var="d">
							<li>${d }</li>
						</c:forTokens>
						</ul>
					</td>
				</tr>
			</table>
			<div style="height:5px"></div>
			<table class="table">
				<caption><h4 style="color:black">[조리순서]</h4></caption>
				<c:forEach var="fm" items="${foodsList }" varStatus="s" >
					<tr>
						<td width="80%"><b style="color:black">${fm }</b></td>
						<td width="20%"><img src="${imgList[s.index] }" style="width:100%"></td>
					</tr>
				</c:forEach>
			</table>			
			<div style="height:5px"></div>
			<table class="table">
				<caption><h4 style="color:black">[레시피 작성자]</h4></caption>
				<tr>
					<td rowspan="2" class="text-center" width="15%">
						<img src="${vo.chef_poster }" style="width: 100px; height: 100px" class="img-circle">
					</td>
					<td width="85%">${vo.chef }</td>
				</tr>
				<tr>
					<td width="85%">${vo.chef_profile }</td>
				</tr>
			</table>
		</main>
	</div>
</body>
</html>