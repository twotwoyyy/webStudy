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
			<h2 class="sectiontitle">Chef 목록</h2>
			<table class="table">
				<tr>
					<td>
					<c:forEach var="vo" items="${chefList }">
						<table class="table">
							<tr>
								<td width="30%" class="text-center" rowspan="2">
									<a href="../recipe/chef_make.do?chef=${vo.chef }">
										<img src="${vo.poster }" style="width:100px; height: 100px" class="img-circle">
									</a>
								</td>
								<td colspan="4">
									<a href="../recipe/chef_make.do?chef=${vo.chef }">
									<h4 style="color:orange">${vo.chef }</h4>
									</a>
								</td>
							</tr>
							<tr>
								<td class="text-center"><img src="../recipe/icon/m1.png">&nbsp;${vo.mem_cont1 }</td>
								<td class="text-center"><img src="../recipe/icon/m2.png">&nbsp;${vo.mem_cont3 }</td>
								<td class="text-center"><img src="../recipe/icon/m3.png">&nbsp;${vo.mem_cont7 }</td>
								<td class="text-center"><img src="../recipe/icon/m4.png">&nbsp;${vo.mem_cont2 }</td>
							</tr>
						</table>
					</c:forEach>
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<a href="../recipe/chef_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger">이전</a>
							${curpage } page / ${totalpage } pages
						<a href="../recipe/chef_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-danger">다음</a>
					</td>
				</tr>
			</table>
		</main>
	</div>
</body>
</html>