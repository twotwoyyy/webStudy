<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.database.*"%>
<%
	DataBaseConnection dbconn=new DataBaseConnection();
	Connection conn=dbconn.getConnection();
	String sql="SELECT * FROM dept";
	PreparedStatement ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
%>
<%--
	contentType
	import
	pageEncoding
	errorPage
	isErrorPage
	buffer
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
	<%
		while(rs.next()){
	%>
		<li><%=rs.getInt(1) %>-<%=rs.getString(2) %>-<%=rs.getString(3) %>
	<%
		}
	rs.close();
	dbconn.disConnection(conn, ps);
	%>
	
	</ul>
</body>
</html>