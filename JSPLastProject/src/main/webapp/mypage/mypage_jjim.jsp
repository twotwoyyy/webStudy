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
	<c:if test="${jjimCount==0 }">
		<table class="table">
			<tr>
				<td class="text-center">
					<h4>찜한 내용이 없습니다</h4>
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${jjimCount!=0 }">
		<table class="table">
			<tr>	
				<th class="text-center">번호</th>
				<th class="text-center"></th>
				<th class="text-center">업체명</th>
				<th class="text-center">전화</th>
				<th class="text-center"></th>
			</tr>
			<c:forEach var="vo" items="${allList }">
				<tr>
					<td class="text-center">${vo.jno }</td>
					<td class="text-center">
						<img src="http://www.menupan.com${vo.fvo.poster }" style="width:25px;height:25px">
					</td>
					<td class="text-center">${vo.fvo.name }</td>
					<td class="text-center">${vo.fvo.phone }</td>
					<td class="text-center">
						<a href="../mypage/mypage_jjim_cancel.do?jno=${vo.jno }" class="btn btn-xs btn-danger">취소</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>