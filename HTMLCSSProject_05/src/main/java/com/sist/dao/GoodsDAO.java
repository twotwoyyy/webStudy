package com.sist.dao;
import java.util.*;
import java.sql.*;
public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static GoodsDAO dao;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	//드라이버 등록
	private GoodsDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	
	//오라클 연결
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	//오라클 해제
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	public static GoodsDAO newInstance() {
		if(dao==null)
			dao=new GoodsDAO();
		return dao;
	}
	/*
	 *  
	 NO                                        NOT NULL NUMBER(38)
	 GOODS_NAME                                         VARCHAR2(4000)
	 GOODS_SUB                                          VARCHAR2(4000)
	 GOODS_PRICE                                        VARCHAR2(26)
	 GOODS_DISCOUNT                                     NUMBER(38)
	 GOODS_FIRST_PRICE                                  VARCHAR2(26)
	 GOODS_DELIVERY                                     VARCHAR2(4000)
	 GOODS_POSTER                                       VARCHAR2(4000)
	 HIT                                                NUMBER(38)
	 */
	// 목록 => 50개
	public List<GoodsVO> goodsListData(){
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		try {
			//1. 연결
			getConnection();
			//2. 오라클에 전송할 sql 문장 제작
			String sql="SELECT no,goods_poster,goods_name,goods_price,rownum "
					+"FROM goods_all "
					+"WHERE rownum<=50";
			//3. 오라클 전송
			ps=conn.prepareStatement(sql);
			//4. 결과값 받기
			ResultSet rs=ps.executeQuery();
			//5. rs에 저장된 결과값을 list에 담는다
			while(rs.next()) {
				GoodsVO vo=new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setPrice(rs.getString(4));
				
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	//상세보기 => CSS적용 ====> ?no=1
	public GoodsVO goodsDetailData(int no) {
		GoodsVO vo=new GoodsVO();
		try {
			getConnection();
			String sql="SELECT no,goods_poster,goods_name,goods_price,goods_sub,goods_delivery,goods_discount, goods_first_price "
					  +"FROM goods_all "
					  + "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			//결과값
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
			vo.setFirst_price(rs.getString(8));
			String rp=price.replaceAll("[^0-9]", ""); // 숫자빼고 모두 지운다 
			vo.setRprice(Integer.parseInt(rp));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
	// 상세보기 => CSS를 적용
}
