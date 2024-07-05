<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
    
    <%
    String no=request.getParameter("no");
    BoardDAO dao=BoardDAO.newInstance();
    BoardVO vo=dao.boardUpdateData(Integer.parseInt(no));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top:30px;
}
.row{
	margin:0px auto;
	width:600px;
}
h3{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>수정하기</h3>
		<div class="row">
			<form method="post" action="board_update_ok.jsp">
				<table class="table">
					<tr>
						<th width=25% class="text-right">이름</th>
						<td width=75%>
							<input type="text" size=20 class="input-sm" value="<%=vo.getName()%>" reqired name="name">
							<input type="hidden" name="no" value="<%=no%>"> <!--보이지않고 정보 넘김 no-->
						</td>
					</tr>
					<tr>
						<th width=25% class="text-right">제목</th>
						<td width=75%>
							<input type="text" size=55 class="input-sm" value="<%=vo.getSubject()%>" reqired name="subject">
						</td>
					</tr>
					<tr>
						<th width=25% class="text-right">내용</th>
						<td width=75%>
							<textarea rows="10" cols="56" required name="content"><%=vo.getContent() %></textarea>
						</td>
					</tr>
					<tr>
						<th width=25% class="text-right">비밀번호</th>
						<td width=75%>
							<input type="password" size=10 class="input-sm" required name="pwd">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" value="수정" class="btn-sm btn-success">
							<input type="button" value="취소" class="btn-sm btn-warning" onclick="javascript:history.back();">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>