<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
	SeoulDAO dao=SeoulDAO.newInstance();
	LocationVO vo=dao.seoulDetailData(Integer.parseInt(no));
	
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
	width: 960px;
}

</style>
</head>
<body>
	<div class="container">
		<h3 class="text-center"><%=vo.getTitle() %></h3>
		<div class="row">
		<table class="table table-striped">	
			<tbody>
				<tr>
					<td class="text-center">
						<img src="<%=vo.getPoster() %>" style="width:600px; height:400px">
					</td>
				</tr>
				<tr>
					<td><%=vo.getMsg() %></td>
				</tr>
				<tr>
					<td><address><%=vo.getAddress() %></address></td>
				</tr>
				<tr>
					<td class="text-right">
						<a href="list.jsp" class="btn btn=xs btn-danger">돌아가기</a>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>
</body>
</html>