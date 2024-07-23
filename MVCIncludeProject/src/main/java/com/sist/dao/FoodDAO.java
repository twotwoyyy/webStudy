package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.dao.*;

public class FoodDAO {
	  private Connection conn;
	   private PreparedStatement ps;
	   private static FoodDAO dao;
	   DbcpConnection dbConn=new DbcpConnection();
	   
	     
	   public static FoodDAO newInstance()
	   {
		   if(dao==null)
			   dao=new FoodDAO();
		   return dao;
	   }
	   

	   public List<FoodVO> foodListData(int page){
		   List<FoodVO> list=new ArrayList<FoodVO>();
		   try {
			   conn=dbConn.getConnection();
			   String sql="SELECT fno,name,poster,num "
						  +"FROM (SELECT fno,name,poster,rownum as num "
						  +"FROM (SELECT /*+ INDEX_ASC(food_house fh_fno_pk)*/fno,name,poster "
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
					vo.setName(rs.getString(2));
					vo.setPoster(rs.getString(3).replace("https", "http"));
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
		public FoodVO foodDetailData(int fno) {
			FoodVO vo=new FoodVO();
			try {
				conn=dbConn.getConnection();
				String sql="UPDATE food_house SET "
						  +"hit=hit+1 "
						  +"WHERE fno=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, fno);
				ps.executeUpdate();
				/////////////////////////// 조회수 증가
				sql="SELECT fno,name,type,phone,address,theme,poster,content,score "
				   +"FROM food_house "
				   +"WHERE fno=?";
				ps=conn.prepareStatement(sql);
				// ?에 값을 채운다
				ps.setInt(1, fno);
				// 실행 요청 => 결과값 받기
				ResultSet rs=ps.executeQuery();
				rs.next(); // 커서를 데이터가 출력되는 위치로 이동
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setType(rs.getString(3));
				vo.setPhone(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setTheme(rs.getString(6));
				vo.setPoster(rs.getString(7).replace("https", "http"));
				vo.setContent(rs.getString(8));
				vo.setScore(rs.getDouble(9));
				//메모리 닫기
				rs.close();
			}catch(Exception ex) {
				System.out.println("====== foodDetailData() 오류 ========");/*디버깅 방법*/
				ex.printStackTrace();
			}finally {
				dbConn.disConnection(conn, ps);
			}
			return vo;
		}
		
}
