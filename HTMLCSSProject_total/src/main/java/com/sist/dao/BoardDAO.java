package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	private String[] mode= {"","",};
	private DataBaseConnection dbConn=new DataBaseConnection();
	//싱글턴
	public static BoardDAO newInstance(){
		if(dao==null)
			dao=new BoardDAO();
		return dao;
	}
	//기능
	//1. 목록 => SELECT (페이지 나누기)
	public List<BoardVO> boardListData(int page){
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num "
					  +"FROM(SELECT no,subject,name,regdate,hit,rownum as num "
					  +"FROM(SELECT /*+ INDEX_DESC(board board_no_pk)*/no,subject,name,regdate,hit "
					  +"FROM board)) "
					  +"WHERE num BETWEEN ? AND ?";
			          // INDEX_ASC(테이블명 PK명칭) => index는 pk,uk 자동 생성 (정렬)
			// 오라클로 전송
			ps=conn.prepareStatement(sql);
			// 실행 전 ? 값 채우기
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			//실행을 요청하고 결과값을 받는다
			ResultSet rs=ps.executeQuery();
			while(rs.next()) { // 데이터 출력의 첫 번째 위치에 커서 이동 => 첫 번째 줄부터 한 줄씩 읽어온다
				BoardVO vo=new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDb_day(rs.getString(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex) {
			System.out.println("=======boardListData에서 에러발생==========");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	
	//1-2 총페이지
	public int boardTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT COUNT(*) FROM board";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			System.out.println("=======boardTotalPage에서 에러발생==========");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	//2. 상세보기 => SELECT (WHERE) => <table>
	public BoardVO boardDetailData(int no) {
		// 반드시 
		BoardVO vo=new BoardVO();
		try {
			conn=dbConn.getConnection();
			String sql="UPDATE board SET "
					  +"hit=hit+1 "
					  +"WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate(); // 조회수 증가 => 자동으로 commit 
			
			sql="SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
			   +"FROM board "
			   +"WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDb_day(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		}catch(Exception ex) {
			System.out.println("=======boardDetailData에서 에러발생==========");
			ex.printStackTrace();
			
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	//3. 글쓰기 => input
	public void boardInsert(BoardVO vo) {
		try {
			conn=dbConn.getConnection();
			String sql="INSERT INTO board VALUES (board_no_seq.nextval,?,?,?,?,SYSDATE,0)";
			ps=conn.prepareStatement(sql);
			//?에 값 채우기
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			//실행 요청
			ps.executeUpdate();
		}catch(Exception ex) {
			System.out.println("=======boardInsert에서 에러발생==========");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
	}
	//4. 수정하기 => input
	public BoardVO boardUpdateData(int no) {
	      BoardVO vo=new BoardVO();
	      try {
	         conn=dbConn.getConnection();
	         String sql="SELECT no, name, subject, content "
	               + "FROM board "
	               + "WHERE no="+no;
	         ps=conn.prepareStatement(sql);
	         ResultSet rs=ps.executeQuery();
	         rs.next();
	         vo.setNo(rs.getInt(1));
	         vo.setName(rs.getString(2));
	         vo.setSubject(rs.getString(3));
	         vo.setContent(rs.getString(4));
	         rs.close();
	      }catch(Exception ex) {
	         System.out.println("===== boardUpdateData(int no)에서 오류 =====");
	         ex.printStackTrace();
	      }finally {
	         dbConn.disConnection(conn, ps);
	      }
	      return vo;
	   }
	
	public boolean boardUpdate(BoardVO vo) {
		boolean bCheck=false;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT pwd FROM board WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(vo.getPwd())) {
				bCheck=true;
				sql="UPDATE board SET name=?,subject=?,content=? WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
			}else {
				bCheck=false;
			}
			
		}catch(Exception ex) {
			System.out.println("===== boardUpdateData(int no)에서 오류 =====");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
	//5. 삭제하기 => input
	public boolean boardDelete(int no,String pwd) {
		boolean bCheck=false;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT pwd FROM board "
					  +"WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			if(db_pwd.equals(pwd)) {
				bCheck=true;
				sql="DELETE FROM board WHERE no="+no;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
			}else {
				bCheck=false;
			}
		}catch(Exception ex) {
			System.out.println("========== boardDelete(int no,String pwd) 오류 ========");
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
	//6. 검색 => <select>
	public List<BoardVO> boardFindData(String fd, String ss){
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
				     +"FROM board "
				     +"WHERE "+fd+" LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				 BoardVO vo=new BoardVO();
				   vo.setNo(rs.getInt(1));
				   vo.setSubject(rs.getString(2));
				   vo.setName(rs.getString(3));
				   vo.setDb_day(rs.getString(4));
				   vo.setHit(rs.getInt(5));
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
	public int boardFindCount(String fd, String ss){
		int count=0;
		try {
			conn=dbConn.getConnection();
			 String sql="SELECT COUNT(*) "
				     +"FROM board "
				     +"WHERE "+fd+" LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, ss);   
			   // 실행을 요청하고 결과값을 받는다 
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   count=rs.getInt(1);
			   rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			dbConn.disConnection(conn, ps);
		}
		return count;
	}
}
