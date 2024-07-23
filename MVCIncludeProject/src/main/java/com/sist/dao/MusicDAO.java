package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dao.*;
public class MusicDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MusicDAO dao;
	private DbcpConnection dbConn=new DbcpConnection();
	public static MusicDAO newInstance() {
		if(dao==null) 
			dao=new MusicDAO();
		return dao;
	}
	
	public List<MusicVO> musicListData(int page){
		List<MusicVO> list=new ArrayList<MusicVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT mno, title, poster, singer, state, idcrement, num "
					  +"FROM (SELECT mno, title, poster, singer, state, idcrement, rownum as num "
					  +"FROM (SELECT mno, title, poster, singer,state,idcrement "
					  +"FROM genie_music ORDER BY mno ASC)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=20;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MusicVO vo=new MusicVO();
				vo.setMno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setSinger(rs.getString(4));
				vo.setState(rs.getString(5).trim());
				vo.setIdcrement(rs.getInt(6));
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
	public int musicTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/20.0) FROM genie_music";
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
	public MusicVO musicDetailData(int mno) {
		MusicVO vo=new MusicVO();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT mno,title,poster,singer,album,state,idcrement "
					  +"FROM genie_music "
					  +"WHERE mno="+mno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setMno(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setPoster(rs.getString(3));
			vo.setAlbum(rs.getString(4));
			vo.setAlbum(rs.getString(5));
			vo.setState(rs.getString(6));
			vo.setIdcrement(rs.getInt(7));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
}
