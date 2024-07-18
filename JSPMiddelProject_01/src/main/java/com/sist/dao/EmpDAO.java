package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class EmpDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   private static EmpDAO dao;
	   
	   public static EmpDAO newInstance() {
	      if(dao==null) {
	         dao=new EmpDAO();
	      }
	      return dao;
	   }

	   public void getConnection() {
	      try {
	         Context init=new InitialContext(); //탐색기 열기
	         Context c=(Context)init.lookup("java://comp/env"); // C드라이버에 접근 
	         DataSource ds=(DataSource)c.lookup("jdbc/oracle"); // 원하는 폴더 선택
	         conn=ds.getConnection(); //파일읽기(주소열기)
	      }catch(Exception ex) {
	         ex.printStackTrace();
	      }
	   }
	   public void disConnection() {
	      try {
	         if(ps!=null) {
	            ps.close();
	         }
	         if(conn!=null) {
	            conn.close();
	         }
	      }catch(Exception ex) {}
	   }
	   
	   public List<EmpVO> empListdata(){
		   List<EmpVO> list=new ArrayList<EmpVO>();
		   try {
			   getConnection();
			   String sql="SELECT empno,ename,job,sal,hiredate "
					     +"FROM emp";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next()) {
				   EmpVO vo=new EmpVO();
				   vo.setEmpno(rs.getInt(1));
				   vo.setEname(rs.getString(2));
				   vo.setJob(rs.getString(3));
				   vo.setSal(rs.getInt(4));
				   vo.setHiredate(rs.getDate(5));
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
	
}
