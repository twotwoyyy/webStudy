package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
/*
 * 	1. 오라클 연결 => TCP
 *     Connection : Socket
 *                  ====== IP,PORT
 *  2. SQL 문장 전송 / 수신
 *     PreparedStatement : BufferedReader / OutputStream 
 *                               |                |
 *                           ResultSet  executeQuery, executeUpdate
 *                           브라우저 전송
 *                           List / VO
 *     =============================================================
 *                 요청 ===> 요청값 받기 (request>
 *     브라우저 <============> 서버 (DAO,JSP)  
 *                 응답 (HTML)
 *              response: OutputStream
 *     
 *     인터페이스는 특별한 경우를 제외하고 new를 쓰지 않는다 
 *     
 *     
 *     1. JSP
 *        ===
 *        1) 오라클로부터 데이터 읽기 
 *           <%
 *           
 *           %>
 *        2) 데이터를 HTML로 출력
 *        
 */
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private DataBaseConnection dbConn=new DataBaseConnection();
	private static FoodDAO dao;
	private String[] mode= {"","한식","중식","양식","일식"}; // 1=> 한식
	public static FoodDAO newInstance() {
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	public List<FoodVO> foodFindData(String addr,int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
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
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int foodFindTotalPage(String addr) {
		int total=0;
		try {
			conn = dbConn.getConnection();
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
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	
	// 종류별 분리
	public List<FoodVO> foodListData(int type,int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
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
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	
	   public int foodListTotalPage(int type)
	   {
		   int total=0;
		   try
		   {
			   conn=dbConn.getConnection();
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
			   dbConn.disConnection(conn, ps);
		   }
		   return total;
	   }
	
	/////////////////디테일
	
	
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

