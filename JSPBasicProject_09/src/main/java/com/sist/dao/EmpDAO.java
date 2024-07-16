package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*; //이름으로 Connection 주소 찾기
/*
 *  DBCP (DataBase Connection Pool) : 연결하는 부분만 처리
 *  
 *  Pool : 연결된 Connection을 저장하는 공간
 *   
 */
public class EmpDAO {
   private Connection conn;
   //AWS - 어떤 위치든 상관없이 실행가능, 호스팅
   private PreparedStatement ps;
   private static EmpDAO dao;
   
   //싱글턴
   public static EmpDAO newInstance() {
      if(dao==null) {
         dao=new EmpDAO();
      }
      return dao;
   }
   /*
    *  1. DBCP - 웹에서만 사용가능
    *     미리 일정 갯수의 Connection을 만들어서 Pool에 저장
    *     - 저장 개수 : maxIdle
    *     - 인원초과시 최대 Connection : maxActive
    *     - 사용자가 요청을 하면 Connection 주소를 제공해서 사용가능하게 만든다
    *     - 사용이 종료가 되면 Pool안으로 Connection을 반환, 재사용 가능
    *     
    *     1) 데이터베이스 연결에 소모되는 시간을 줄일 수 있다
    *     2) Connection을 일정 개수로 관리할 수 있다
    *     3) 동시 접속자가 많아도 쉽게 다운되지 않는다
    *     
    *     동작 - 톰캣이 Connection을 POOL에 저장하고 시작
    *           1. POOL안에 Connection 객체를 가지고 온다
    *           2. Connection 객체를 이용해서 DB작업을 수행
    *           3. 수행이 종료되면 다시 재사용을 위해서 반환
    *           
    *     ============= POOL ===============
    *           주소 : java://comp/env
    *     ---------- maxIdle="5" -----------
    *     jdbc/oracle new Connection() false
    *     jdbc/oracle new Connection() false
    *     jdbc/oracle new Connection() false
    *     jdbc/oracle new Connection() false
    *     jdbc/oracle new Connection() false => 사용=true / 반환=false
    *     ==================================
    *     
    *     JDBC => DBCP => ORM(MyBatis) => DataSet(JPA)
    */
   public void getConnection() {
      //미리 오라클 연결해서 저장된 Connection의 주소를 얻어온다
      try {
         // 1. POOL에 연결 => JNDI (Java Naming Directory Interface)
         // 이름형식으로 탐색기 제작
         Context init=new InitialContext(); //탐색기 열기
         Context c=(Context)init.lookup("java://comp/env"); // C드라이버에 접근 
         DataSource ds=(DataSource)c.lookup("jdbc/oracle"); // 원하는 폴더 선택
         conn=ds.getConnection(); //파일읽기(주소열기)
      }catch(Exception ex) {
         ex.printStackTrace();
      }
   }
   public void disConnection() {
      //반환 - 사용후 반환
      try {
         if(ps!=null) {
            ps.close();
         }
         if(conn!=null) {
            conn.close();
         }
      }catch(Exception ex) {}
   }
   //목록
   public List<EmpVO> empListData(){
      List<EmpVO> list=new ArrayList<EmpVO>();
      try {
         getConnection();
         String sql="SELECT empno, ename, job, hiredate, comm "
               + "FROM emp "
               + "ORDER BY empno ASC";
         ps=conn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         while(rs.next()) {
            EmpVO vo=new EmpVO();
            vo.setEmpno(rs.getInt(1));
            vo.setEname(rs.getString(2));
            vo.setJob(rs.getString(3));
            vo.setHiredate(rs.getDate(4));
            vo.setComm(rs.getInt(5));
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
   
   /*
    *	JOIN / SubQuery
    *
    *	JOIN
    *	=> INNER JOIN
    *      Oracle 조인
    *        SELECT A.col, B.col
    *        FROM A,B
    *        WHERE A.col=B.col
    *        AND 다른 조건
    *        
    *      ANSI JOIN
    *        SELECT A.col,B.col
    *        FROM A JOIN B
    *        ON A.col=B.col
    *        AND 다른 조건
    *        
    *   SUBQUERY
    *     인라인뷰 => SELECT으로 테이블 대체
    *       SELECT ~
    *       FROM (SELECT ~~) => 페이지를 나누는 경우 rownum 
    *     스칼라 서브쿼리 => SELECT으로 컬럼 대체
    *       SELECT 컬럼명, (SELECT ~~)
    *                     ========== 무조건 컬럼 1개의 값만 처리 
    *       FROM table_name 
    */
   public EmpVO empDetailData(int empno) {
      EmpVO vo=new EmpVO();
      try {
         getConnection();
         String sql="SELECT empno, ename, job, hiredate, sal, comm, dname, loc, grade "
               + "FROM emp JOIN dept "
               + "ON emp.deptno=dept.deptno "
               + "AND empno="+empno
               + " JOIN salgrade "
               + "ON sal BETWEEN losal AND hisal";
         ps=conn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         rs.next();
         vo.setEmpno(rs.getInt(1));
         vo.setEname(rs.getString(2));
         vo.setJob(rs.getString(3));
         vo.setHiredate(rs.getDate(4));
         vo.setSal(rs.getInt(5));
         vo.setComm(rs.getInt(6));
         vo.getDvo().setDname(rs.getString(7));
         vo.getDvo().setLoc(rs.getString(8));
         vo.getSvo().setGrade(rs.getInt(9));
         rs.close();
      }catch(Exception ex) {
         ex.printStackTrace();
      }finally {
         disConnection();
      }
      return vo;
   }
   
   public List<EmpVO> empSubqueryData(){
	   List<EmpVO> list=new ArrayList<EmpVO>();
	   try {
		   getConnection(); // 미리 연결된 Connection 주소를 얻어온다 
		   String sql="SELECT empno,ename,job,hiredate,"
				     +"(SELECT dname FROM dept WHERE deptno=emp.deptno),"
				     +"(SELECT loc FROM dept WHERE deptno=emp.deptno) "
				     +"FROM emp";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next()) {
			   EmpVO vo=new EmpVO();
			   vo.setEmpno(rs.getInt(1));
			   vo.setEname(rs.getString(2));
			   vo.setJob(rs.getString(3));
			   vo.setHiredate(rs.getDate(4));
			   vo.getDvo().setDname(rs.getString(5));
			   vo.getDvo().setLoc(rs.getString(6));
			   list.add(vo);
			   
		   }
	   }catch(Exception ex) {
		   ex.printStackTrace();
	   }finally {
		   disConnection();
	   }
	   return list;
   }
}
