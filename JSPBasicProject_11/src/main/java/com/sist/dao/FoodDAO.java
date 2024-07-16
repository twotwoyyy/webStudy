package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	private String[] mode= {"","한식","중식","양식","일식"}; // 1=> 한식
	public static FoodDAO newInstance() {
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp//env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void disConnection() {
		try {
			if(ps!=null)
				ps.close();
			if(conn!=null)
				conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<FoodVO> foodFindData(String addr,int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql="SELECT fno,name,poster,num "
					  +"FROM (SELECT fno,name,poster,rownum as num "
					  +"FROM (SELECT fno,name,poster "
					  +"FROM food_house WHERE address LIKE '%'||?||'%')) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps.setString(1, addr);
			ps.setInt(2, start);
			ps.setInt(3, end);
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
			System.out.println("foodFindData()에서 오류 발생===============");
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
	public int foodFindTotalPage(String addr) {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					  +"FROM food_house "
					  +"WHERE address LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, addr);
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
	
	// 종류별 분리
	public List<FoodVO> foodListData(int type,int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql="SELECT fno,name,poster,num "
					  +"FROM (SELECT fno,name,poster,rownum as num "
					  +"FROM (SELECT fno,name,poster "
					  +"FROM food_house WHERE type LIKE '%'||?||'%')) "
					  +"WHERE num BETWEEN ? AND ?";
		/*
		 * String sql="SELECT fno,name,poster,num "
					  +"FROM (SELECT fno,name,poster,rownum as num "
					  +"FROM (SELECT fno,name,poster "
					  +"FROM food_house WHERE REGEXP_LIKE (type,?)) "
					  +"WHERE num BETWEEN ? AND ?";
		 */
			//rownum은 Top-N => 처음부터, 중간은 자르지 못한다 => 반드시 인라인뷰 활용 
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			//?에 값을 채운다
			ps.setString(1, mode[type]);
			ps.setInt(2, start);
			ps.setInt(3, end);
			// 전체, 베스트, 특가, 신상품 
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
	
	   public int foodListTotalPage(int type)
	   {
		   int total=0;
		   try
		   {
			   getConnection();
			   String sql="SELECT CEIL(COUNT(*)/12.0) "
					     +"FROM food_house "
					     +"WHERE type LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, mode[type]);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   total=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return total;
	   }
	
	/////////////////디테일
	
	
	public FoodVO foodDetailData(int fno) {
		FoodVO vo=new FoodVO();
		try {
			getConnection();
			String sql="UPDATE food_house SET "
					  +"hit=hit+1 "
					  +"WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ps.executeUpdate();
			/////////////////////////// 조회수 증가
			sql="SELECT fno,name,type,phone,address,theme,poster,content,score "
			   +"FROM food_house "
			   +"WHERE fno="+fno;
			ps=conn.prepareStatement(sql);
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
			disConnection();
		}
		return vo;
	}
	
}

