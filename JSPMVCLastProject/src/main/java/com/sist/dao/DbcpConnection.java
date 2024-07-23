package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
// DBCP => 관리 (톰캣) => 일반 프로그램에서는 사용(X) => 웹에서만 사용(O) 
public class DbcpConnection {
	public Connection getConnection() {
		Connection conn=null;
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
	public void disConnection(Connection conn,PreparedStatement ps) {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
}
