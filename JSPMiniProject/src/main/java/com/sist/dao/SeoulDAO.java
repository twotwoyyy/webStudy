package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dao.DbcpConnection;
import com.sist.vo.*;

public class SeoulDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static SeoulDAO dao;
	private DbcpConnection dbConn=new DbcpConnection();
	
	public static SeoulDAO newInstance() {
		if(dao==null)
			dao=new SeoulDAO();
		return dao;
	}
	
	public List<LocationVO> SeoulTop12(){
		List<LocationVO> list=new ArrayList<LocationVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no,title,poster,rownum "
					  +"FROM (SELECT no,title,poster "
					  +"FROM seoul_location) "
					  +"WHERE rownum<=12";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				LocationVO vo=new LocationVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
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
