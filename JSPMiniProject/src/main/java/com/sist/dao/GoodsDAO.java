package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dao.DbcpConnection;
import com.sist.vo.*;
	public class GoodsDAO {
		private Connection conn;
		private PreparedStatement ps;
		private static GoodsDAO dao;
		private DbcpConnection dbConn=new DbcpConnection();
		
		public static GoodsDAO newInstance() {
			if(dao==null)
				dao=new GoodsDAO();
			return dao;
		}
		
		public List<GoodsVO> goodsTop12(){
			List<GoodsVO> list=new ArrayList<GoodsVO>();
			try {
				conn=dbConn.getConnection();
				String sql="SELECT no,goods_name,goods_poster,rownum "
						  +"FROM (SELECT no,goods_name,goods_poster "
						  +"FROM goods_all ORDER BY hit DESC) "
						  +"WHERE rownum<=12";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					GoodsVO vo=new GoodsVO();
					vo.setNo(rs.getInt(1));
					vo.setName(rs.getString(2));
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
