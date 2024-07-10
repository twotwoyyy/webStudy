package com.sist.dao;
import java.sql.*;
import java.util.*;
import com.sist.database.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	private DataBaseConnection dbConn=new DataBaseConnection();
	
	// 싱글턴
	public static FoodDAO newInstance() {
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	
	// 목록 출력
	public List<FoodVO> foodListData(int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT fno,poster,name,num "
					  +"FROM (SELECT fno,poster,name,rownum as num "
					  +"FROM (SELECT /*+ INDEX_ASC(food_house fh_fno_pk)*/fno,poster,name "
					  +"FROM food_house)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setPoster(rs.getString(2).replace("https", "http"));
				vo.setName(rs.getString(3));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int foodTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM food_house";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
}
