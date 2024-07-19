package com.sist.dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;

import com.sist.vo.FoodVO;

import javax.naming.*;

public class FoodDAO {
	  private Connection conn;
	   private PreparedStatement ps;
	   private static FoodDAO dao;
	   
	   public static FoodDAO newInstance()
	   {
		   if(dao==null)
			   dao=new FoodDAO();
		   return dao;
	   }
	   
	   // Connection 주소 얻기 
	   public void getConnection()
	   {
		   try
		   {
			   // 탐색기 => POOL구조가 탐색시 형식 => JNDI 
			   // 1. 탐색시 열기 
			   Context init=new InitialContext();
			   // 2. C드라이버에 접근 
			   Context c=(Context)init.lookup("java://comp/env");
			   // 3. 원하는 폴더 선택 
			   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			   // 4. conn의 주소를 얻어온다
			   conn=ds.getConnection();
		   }catch(Exception ex) 
		   {
			   ex.printStackTrace();
		   }
	   }
	   // 사용후에 반환 => 반복 (메소드화)
	   // 메소드 => 1. 한개의 기능에 해당되는 명령문을 모우기 
	   //         2. 반복적인 명령문이 있는 경우 
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex) {}
	   }
	   
	   public List<FoodVO> foodListData(int page){
		   List<FoodVO> list=new ArrayList<FoodVO>();
		   try {
			   getConnection();
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
			   disConnection();  
		   }
		   return list;
	   }
		public int foodTotalPage() {
			int total=0;
			try {
				getConnection();
				String sql="SELECT CEIL(COUNT(*)/12.0) FROM food_house";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				disConnection();
			}
			return total;
		}

		
}
