package com.sist.dao;

import java.sql.*;
import java.util.*;
import com.sist.database.*;

public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static GoodsDAO dao;
	private DataBaseConnection dbConn=new DataBaseConnection();
	
	
	public static GoodsDAO newInstance() {
		if(dao==null)
			dao=new GoodsDAO();
		return dao;
	}

	public List<GoodsVO> goodsListData(int page){
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no,goods_poster,goods_name,num "
					  +"FROM (SELECT no,goods_poster,goods_name,rownum as num "
					  +"FROM (SELECT /*+ INDEX_ASC(goods_all goods_no_pk)*/ no,goods_poster,goods_name "
					  +"FROM goods_all)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1,start);
			ps.setInt(2,end);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				GoodsVO vo=new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn,ps);
		}
		return list;
	}
	
	public int goodsTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods_all";
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
	//상세보기
	public GoodsVO goodsDetailData(int no) {
		GoodsVO vo=new GoodsVO();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no,goods_poster,goods_name,goods_price,goods_sub,goods_delivery,goods_discount,goods_first_price "
					  +"FROM goods_all "
					  +"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setPoster(rs.getString(2));
			vo.setName(rs.getString(3));
			String price=rs.getString(4);
			vo.setPrice(price);
			vo.setSub(rs.getString(5));
			vo.setDelivery(rs.getString(6));
			vo.setDiscount(rs.getInt(7));
			String rp=price.replaceAll("[^0-9]", "");
			vo.setRprice(Integer.parseInt(rp));
			vo.setFirst_price(rs.getString(8));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	
}
