package com.sist.dao;
import java.util.*;
import java.sql.*;
public class HallDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static HallDAO dao;
	private final String URL="jdbc:oracle:thin:@211.238.142.124:1521:XE";
	
	// 드라이버 등록
	public HallDAO() { 
		try {
			Class.forName("oracle.jbdc.driver.OracleDriver");
		} catch (Exception ex) {}
	}

	// 연결
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr1", "happy");
		} catch (Exception ex) {}
	}

	// 해제
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {}
	}

	// 싱글턴
	public static HallDAO newInstance() {
		if (dao == null)
			dao = new HallDAO();
		return dao;
	}

	//기능
	/*
	 *  이름                                      널?      유형
		 ----------------------------------------- -------- ----------------------------
		 HNO                                       NOT NULL NUMBER
		 NAME                                      NOT NULL VARCHAR2(2000)
		 ADDR                                      NOT NULL VARCHAR2(2000)
		 POINT                                     NOT NULL VARCHAR2(4000)
		 TYPE                                      NOT NULL VARCHAR2(1000)
		 MENU                                      NOT NULL VARCHAR2(2000)
		 MEALCOST                                  NOT NULL VARCHAR2(2000)
		 MAP                                       NOT NULL VARCHAR2(2000)
		 HOMEPAGE                                  NOT NULL VARCHAR2(2000)
		 IMAGE1                                             VARCHAR2(4000)
		 IMAGE2                                             VARCHAR2(4000)
	 */
	public void hallInsert(HallVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO hall(hno, name, addr, point, type, menu, mealcost, map, homepage, image) "
			           + "VALUES(hall_hno_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getAddr());
			ps.setString(3, vo.getPoint());
			ps.setString(4, vo.getType());
			ps.setString(5, vo.getMenu());
			ps.setString(6, vo.getMealcost());
			ps.setString(7, vo.getMap());
			ps.setString(8, vo.getHomepage());
			ps.setString(9,"https://i-do.kr/"+ vo.getImage());
			
			ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();


		}finally {
			disConnection();
		}
	}

}
