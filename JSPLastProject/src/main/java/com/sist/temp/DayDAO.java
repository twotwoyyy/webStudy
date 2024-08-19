package com.sist.temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.naming.spi.DirStateFactory.Result;
public class DayDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	// ssf=new SqlSessionBuilder().bulid("Config.xml")
	public DayDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	// session=ssf.openSession()
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	// session.close()
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	// SelectList
	public List<Integer> foodGetFno(){
		List<Integer> list=new ArrayList<Integer>();
		try {
			getConnection();
			String sql="SELECT fno FROM project_food_house "
					  +"ORDER BY fno ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
	public void foodRdaysUpdate(int fno,String rdays) {
		try {
			getConnection();
			String sql="UPDATE project_food_house SET "
					  +"rdays=? "
			          +"WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, rdays);
			ps.setInt(2, fno);
			ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
	
	public void timeInsert(int dno, String time) {
		try {
			getConnection();
			String sql="INSERT INTO reserve_date VALUES(?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dno);
			ps.setString(2, time);
			ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
}
