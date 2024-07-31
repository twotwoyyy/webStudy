package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dao.DbcpConnection;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	private DbcpConnection dbConn=new DbcpConnection();  
	private final int ROWSIZE=20;
	
	public static FoodDAO newInstance() {
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	
	// 상세보기
	public FoodVO foodDetailData(int fno) {
		FoodVO vo=new FoodVO();
		try {
			conn=dbConn.getConnection();
			String sql="UPDATE food_house SET "
					  +"hit=hit+1 "
					  +"WHERE fno="+fno;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
			sql="SELECT fno,name,type,phone,address,theme,poster,content,score "
				+"FROM food_house "
				+"WHERE fno="+fno;
			ps=conn.prepareStatement(sql); // 오라클 전송
			ResultSet rs=ps.executeQuery(); // 실행 후에 결과값을 메모리에 저장 
			rs.next(); // 데이터를 출력하는 위치에 커서 이동
			vo.setFno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setType(rs.getString(3));
			vo.setPhone(rs.getString(4));
			vo.setAddress(rs.getString(5));
			vo.setTheme(rs.getString(6));
			vo.setPoster(rs.getString(7).replace("https","http"));
			vo.setContent(rs.getString(8));
			vo.setScore(rs.getDouble(9));
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	// seoul => 명소 => 6개 

	   public List<FoodVO> foodFindData(int page,String addr){
		   List<FoodVO> list=new ArrayList<FoodVO>();
		   try {
			   conn=dbConn.getConnection();
			   String sql="SELECT fno,name,poster,address,num "
					     +"FROM(SELECT fno,name,poster,address,rownum as num "
					     +"FROM(SELECT fno,name,poster,address "
					     +"FROM food_house "
					     +"WHERE address LIKE '%'||?||'%')) "
					     +"WHERE num BETWEEN ? AND ?";
			   ps=conn.prepareStatement(sql);
			   int start=(ROWSIZE*page)-(ROWSIZE-1);
			   int end=ROWSIZE*page;
			   ps.setString(1, addr);
			   ps.setInt(2, start);
			   ps.setInt(3, end);
			   
			   ResultSet rs=ps.executeQuery();
			   while(rs.next()) {
				   FoodVO vo=new FoodVO();
				   vo.setFno(rs.getInt(1));
				   vo.setName(rs.getString(2));
				   vo.setPoster(rs.getString(3));
				   vo.setAddress(rs.getString(4));
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
	   
		public int foodFindTotalPage(String addr) {
			int total=0;
			try {
				conn=dbConn.getConnection();
				String sql="SELECT CEIL(COUNT(*)/"+ROWSIZE+") FROM food_house WHERE address LIKE '%'||?||'%'";
				ps=conn.prepareStatement(sql);
				ps.setString(1, addr);
				// selectOne()
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
		
		public int foodFindCount(String addr) {
			int total=0;
			try {
				conn=dbConn.getConnection();
				String sql="SELECT COUNT(*) FROM food_house WHERE address LIKE '%'||?||'%'";
				ps=conn.prepareStatement(sql);
				ps.setString(1, addr);
				// selectOne()
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

}
