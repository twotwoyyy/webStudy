<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
	DiaryService dao=DiaryService.newInstance();
	DiaryVO vo=dao.diaryUpdateDate(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 500px;
}
h3{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>일정 수정</h3>
		<div class="row">
			<form method="post" action="update_ok.jsp">
				<table class="table">
					<tbody>
						<tr>
							<td colspan="2">년도:<input type="text" size="10" class="input-sm" name="year" 
							value="<%=vo.getYear()%>">&nbsp;
							    월:<input type="text" size="10" class="input-sm" name="month" 
							    value="<%=vo.getMonth()%>">&nbsp;
							    일:<input type="text" size="10" class="input-sm" name="day" 
							    value="<%=vo.getDay()%>">
							</td>
						</tr>
						<tr>
							<th width="10%">제목</th>
							<td width="90%">
								<input type="text" name="subject" class="input-sm" size="50" value="<%=vo.getSubject() %>">
								<input type="hidden" name="no" value="<%=vo.getNo() %>">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea rows="10" cols="60" name="msg"><%=vo.getMsg() %></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<button class="btn-sm btn-primary">수정</button>
								<input type="button" class="btn-sm btn-info" value="취소" onclick="javascript:history.back()">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>