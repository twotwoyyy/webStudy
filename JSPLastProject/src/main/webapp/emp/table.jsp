<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	padding: 1.5em;
	background: #f5f5f5;
}
table{
	border: 1px #ededed solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0,0,0,.25);
	width: 100%;
	border-radius: 5px;
	overflow: hidden;
	border-collapse: collapse;
}
th{
	text-align: left;
}
thead{
	font-weight: bold;
	color: #fff;
	background: #73685d;
}
td,th{
	padding: 1em .5em;
	vertical-align: middle;
}
td{
	border-bottom: 1px solid rgba(0,0,0,1);
	background: #fff;
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>주소</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>홍길동</td>
				<td>서울</td>
				<td>남자</td>
			</tr>
		</tbody>
	</table>
</body>
</html>