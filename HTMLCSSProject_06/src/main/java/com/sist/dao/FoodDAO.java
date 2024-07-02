package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
public class FoodDAO {
	private PreparedStatement ps;
	private Connection conn;
	private static FoodDAO dao;
	private DataBaseConnection dbConn=new DataBaseConnection();
	
	
	public static FoodDAO newInstance() {
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	// 기능
	public List<FoodVO> foodListData(){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT fno,name,poster,type,rownum "
					  +"FROM (SELECT fno,name,poster,type "
					  +"FROM food_house ORDER BY fno ASC) "
					  +"WHERE rownum<=50";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setType(rs.getString(4));
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
}
