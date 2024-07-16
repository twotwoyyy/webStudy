package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*; // DataSource : 데이터베이스의 모든 정보를 갖고있다 
import javax.naming.*; // Context => 이름 => 객체 주소를 찾는다 => lookup() 
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	
	// 싱글턴 
	public static BoardDAO newInstance() {
		if(dao==null)
			dao=new BoardDAO();
		return dao;
	}
	// 미리 오라클을 연결해서 저장해 둔 Connection 주소를 얻어온다 
	public void getConnection() {
		
	}
	// 사용 후에는 반드시 반환
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	
	// 기능
	// 1. 목록 (페이지)
	// 2. 상세보기
	// 3. 글쓰기
	// 4. 수정
	///////////////////////
	// 5. 삭제
	// 6. 답변
	////////////////////// 트랜잭션 구현
	// 7. 검색
}
