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
	private final int ROWSIZE=20;
	
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
	
	public List<LocationVO> seoulListData(int page) {
		List<LocationVO> list = new ArrayList<LocationVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no,title,poster,num " 
						+ "FROM (SELECT no,title,poster,rownum as num "
						+ "FROM (SELECT no,title,poster " 
						+ "FROM seoul_location ORDER BY no ASC)) "
						+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int start = (ROWSIZE * page) - (ROWSIZE - 1);
			int end=ROWSIZE*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				LocationVO vo=new LocationVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int seoulTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/"+ROWSIZE+") FROM seoul_location";
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