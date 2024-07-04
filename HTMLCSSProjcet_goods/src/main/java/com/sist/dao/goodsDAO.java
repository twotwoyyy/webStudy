package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
public class goodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static goodsDAO dao;
	private String[] mode= {"","goods_all","goods_best","goods_new","goods_special"};
	private DataBaseConnection dbConn=new DataBaseConnection();
	
	public static goodsDAO newInstance() {
		if(dao==null)
			dao=new goodsDAO();
		return dao;
	}
	
	
	
	
	public List<goodsVO> goodsListData(int type, int page) {
	    List<goodsVO> list = new ArrayList<>();
	    try {
	        conn = dbConn.getConnection();
	        String sql = "SELECT no, goods_poster, goods_name " +
	                     "FROM (SELECT no, goods_poster, goods_name, rownum as rnum " +
	                     "FROM (SELECT no, goods_poster, goods_name " +
	                     "FROM " + mode[type] + ")) " +
	                     "WHERE rnum BETWEEN ? AND ?";
	        ps = conn.prepareStatement(sql);

	        int rowSize = 12;
	        int start = (rowSize * page) - (rowSize - 1);
	        int end = rowSize * page;

	        ps.setInt(1, start);
	        ps.setInt(2, end);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            goodsVO vo = new goodsVO();
	            vo.setNo(rs.getInt("no"));
	            vo.setPoster(rs.getString("goods_poster"));
	            vo.setName(rs.getString("goods_name"));
	            list.add(vo);
	        }
	        rs.close();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbConn.disConnection(conn, ps);
	    }
	    return list;
	}

	
	public int goodsListTotalPage(int type) {
	    int total = 0;
	    try {
	        conn = dbConn.getConnection();
	        String sql = "SELECT CEIL(COUNT(*)/12.0) " +
	                     "FROM " + mode[type];
	        ps = conn.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            total = rs.getInt(1);
	        }
	        rs.close();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbConn.disConnection(conn, ps);
	    }
	    return total;
	}

	
	////////////////////////검색
	public List<goodsVO> goodsFindData(String name,int page){
		List<goodsVO> list=new ArrayList<goodsVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no,goods_name,goods_poster,num "
					  +"FROM (SELECT no,goods_name,goods_poster,rownum as num "
					  +"FROM (SELECT no,goods_name,goods_poster "
					  +"FROM goods_all WHERE goods_name LIKE '%'||?||'%')) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps.setString(1, name);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				goodsVO vo=new goodsVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int goodsFindTotalPage(String name) {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					  +"FROM goods_all "
					  +"WHERE name LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
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
	
	
	/////////////////////////////////////
	public goodsVO goodsDetailData(int no,int type) {
	    goodsVO vo = new goodsVO();
	    try {
	        conn = dbConn.getConnection();
	        // 조회수 증가 쿼리
	        String sql = "UPDATE goods_all SET hit = hit + 1 WHERE no=?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, no);
	        ps.executeUpdate();
	        
	        // 상품 정보 조회 쿼리
	        sql = "SELECT no, goods_poster, goods_name, goods_price, goods_sub, goods_delivery, goods_discount, goods_first_price " +
	              "FROM " + mode[type] + " WHERE no=?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, no);
	        
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            vo.setNo(rs.getInt(1));
	            vo.setPoster(rs.getString(2));
	            vo.setName(rs.getString(3));
	            vo.setPrice(rs.getString(4));
	            vo.setSub(rs.getString(5));
	            vo.setDelivery(rs.getString(6));
	            vo.setDiscount(rs.getInt(7));
	            vo.setFirst_price(rs.getString(8));
	            
	            // 가격에서 숫자만 추출하여 정수로 변환
	            String price = rs.getString(4);
	            String rp = price.replaceAll("[^0-9]", "");
	            vo.setRprice(Integer.parseInt(rp));
	        }
	        rs.close();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        dbConn.disConnection(conn, ps);
	    }
	    return vo;
	}

	
	
}
