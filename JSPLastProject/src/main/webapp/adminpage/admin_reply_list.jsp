<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.adminRow {
	width: 800px;
}
</style>
</head>
<body>

	<div class="wrapper row3">
		<main class="container clear">
			<div class="adminRow">
				<h2 class="sectiontitle">묻고 답하기</h2>
				<table class="table">
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="35%" class="text-center">제목</th>
						<th width="15%" class="text-center">작성자</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="10%" class="text-center">조회수</th>
						<th width=10% class="text-center"></th>
					</tr>
					<c:set var="count" value="${count }" />
					<c:forEach var="vo" items="${arList }">
						<tr>
							<td width="10%" class="text-center">${count }</td>
							<td width="35%"><c:if test="${vo.group_step>0 }">
        &nbsp;&nbsp;
        <img src="../replyboard/re_icon.png">
								</c:if> ${vo.subject}</td>
							<td width="15%" class="text-center">${vo.name }</td>
							<td width="20%" class="text-center">${vo.dbday }</td>
							<td width="10%" class="text-center">${vo.hit }</td>
							<td width="10%" class="text-center"><c:if
									test="${vo.isreply==0 }">
									<a href="../adminpage/reply_insert.do?no=${vo.no }"
										class="btn btn-sm btn-danger">답변대기</a>
								</c:if> <c:if test="${vo.isreply!=0 }">
									<span class="btn btn-sm btn-default">답변완료</span>
								</c:if></td>
						</tr>
						<c:set var="count" value="${count-1}" />
					</c:forEach>
				</table>
				<table class="table">
					<tr>
						<td class="text-center"><a href="#"
							class="btn btn-sm btn-info">이전</a> ${curpage } page / ${totalpage }
							pages <a href="#" class="btn btn-sm btn-info">다음</a></td>
					</tr>
				</table>
			</div>
		</main>
	</div>
</body>
</html>