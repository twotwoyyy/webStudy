<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sist.dao.*" %>
<%--
	food_detail.jsp?fno=1
	                ===== 맛집 1번에 대한 상세보기 요청 
	                  | 
	          String fno=request.getParameter("fno");
	          fno=1
	          => 모든 전송된 데이터는 문자열 (String)
 --%>
<%
FoodDAO dao=FoodDAO.newInstance();
String fno=request.getParameter("fno");
FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
//     == vo에 저장된 데이터 출력 => 상세보기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 960px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table table-striped">
				<tr>
					<td width="30%" class="text-center" rowspan="6"><img
						src="<%=vo.getPoster()%>" style="width: 100%" class="img-rounded">
					</td>
					<td colspan="2"><h3><%=vo.getName()%></h3></td>

				</tr>
				<tr>
					<th>음식종류</th>
					<td><%=vo.getType()%></td>
				</tr>
				<tr>
					<th>전화</th>
					<td><%=vo.getAddress()%></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><%=vo.getAddress()%></td>
				</tr>
				<tr>
					<th>평점</th>
					<td><%=vo.getScore()%></td>
				</tr>
				<tr>
					<th>테마</th>
					<td><%=vo.getTheme()%></td>
				</tr>
				<tr>
					<td colspan="2" class="text-right"><input type=button
						value="찜하기" class="btn-xs btn-primary"> <input type=button
						value="좋아요" class="btn-xs btn-success"> <input type=button
						value="예약" class="btn-xs btn-info"> <input type=button
						value="목록" class="btn-xs btn-warning"
						onclick="javascript:history.back()"></td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td><pre
							style="white-space: pre-wrap; border: none; background-color: white;"> <%=vo.getContent()%>
						</pre></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

