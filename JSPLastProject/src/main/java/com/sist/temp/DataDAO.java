
package com.sist.temp;
import java.util.*;
import java.sql.*;
public class DataDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   private static DataDAO dao;
   // 드라이버 등록 
   public DataDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex){}
   }
   // 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
   }
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 싱글턴 => DAO를 한번만 사용이 가능 (메모리 공간을 1개만 생성) = 재사용
   // 스프링에서는 기본 (싱글턴) => 필요시에는 여러개 객체 생성 => prototype
   public static DataDAO newInstance()
   {
	   if(dao==null)
		   dao=new DataDAO();
	   return dao;
   }
   public void recipeDetailInsert(RecipeDetailVO vo)
   {
	   try
	   {
		   getConnection();
		   String sql="INSERT INTO recipeDetail VALUES("
				   +"?,?,?,?,?,?,?,?,?,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, vo.getNo());
		   ps.setString(2, vo.getPoster());
		   ps.setString(3, vo.getTitle());
		   ps.setString(4, vo.getChef());
		   ps.setString(5, vo.getChef_poster());
		   ps.setString(6, vo.getChef_profile());
		   ps.setString(7, vo.getInfo1());
		   ps.setString(8, vo.getInfo2());
		   ps.setString(9, vo.getInfo3());
		   ps.setString(10, vo.getContent());
		   ps.setString(11, vo.getFoodmake());
		   ps.setString(12, vo.getData());
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
   }
}
