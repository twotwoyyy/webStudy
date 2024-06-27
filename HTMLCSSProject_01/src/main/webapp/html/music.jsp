<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
// DAO로부터 데이터 받는다 
MusicDAO dao = MusicDAO.newInstance();
List<MusicVO> list = dao.musicAllData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style type="text/css">
table {
	margin: 0px auto;
	width: 800px;
}

h1 {
	text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#keyword').keyup(function () {
		let k=$('#keyword').val();
		$('#user-table>tbody>tr').hide(); /* 자손 선택자 > > */
		let temp=$ ('#user-table>tbody>tr>td:nth-child(5n+4):contains("'+k+'")');
		$(temp).parent().show()
	})
})
</script>
</head>
<body>
	<h1>뮤직 Top200</h1>
	<table class="table_content">
		<tr>
			<td><input type=text size=25 id=keyword></td>
		</tr>
	</table>
	<table class="table_content" id="user-table">
		<thead>
			<tr>
				<th width=10%>순위</th>
				<th width=10%></th>
				<th width=20%></th>
				<th width=30%>곡명</th>
				<th width=30%>가수명</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (MusicVO vo : list) {
			%>
			<tr>
				<td width="10%" align="center"><%=vo.getMno()%></td>
				<td width="10%" align="center">
					<%
					String temp = "";
					if (vo.getState().trim().equals("유지"))
						temp = "-";
					else if (vo.getState().trim().equals("상승"))
						temp = "<font color=blue>▲</font>&nbsp;" + vo.getIdcrement();
					else if (vo.getState().trim().equals("하강"))
						temp = "<font color=red>▼</font>&nbsp;" + vo.getIdcrement();
					%> <%=temp%>
				</td>
				<td width="20%" align="center"><img src="<%=vo.getPoster()%>"
					width=30 height="30"></td>
				<td width="30%"><%=vo.getTitle()%></td>
				<td width="30%"><%=vo.getSinger()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>