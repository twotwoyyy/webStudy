package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.database.*;
public class FoodDAO {
	private Connection conn; //연결만 담당
	private PreparedStatement ps; // SQL문장 송수신 => SQL문장 전송 / 결과값 받기 
	private static FoodDAO dao; //싱글톤

	private DataBaseConnection dbConn=new DataBaseConnection();
	//라이브러리 형식 (.jar) => 보안
	//싱글톤 
	public static FoodDAO newInstance() {
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	
	// 기능
	// 메소드 => return (결과값) 브라우저로 넘겨 실행 => 사용자 요청은 무엇인가
	// 사용자가 페이지를 선택하면 오라클에 저장된 데이터 중에 페이지에 해당되는 데이터를 보낸다
	// => List, FoodVO, int, String, void
	// 화면 목록 출력 => List
	// 상세보기 => VO
	
	public List<FoodVO> foodListData(int page){ //사용자가 페이지를 보내면 페이지에 해당되는 맛집을 보내겠다 
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT fno,poster,name,num "
					  +"FROM (SELECT fno,poster,name,rownum as num "
					  +"FROM (SELECT /*+ INDEX_ASC(food_house fh_fno_pk)*/fno,poster,name "
					  +"FROM food_house)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1); // 1부터 시작
			int end=rowSize*page; // 12까지
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
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
	// Bootstrap Pagination
	public int foodTotalPage() { //총페이지
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM food_house";
			//전송
			ps=conn.prepareStatement(sql);
			//결과값 받기
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
	/*
	 * 1. 데이터 설계 => DDL (CREATE, ALTER, RENAME, DROP, TRUNCATE)
	 * 2. 프로그램 구현
	 *      SELECT : 목록 출력 / 상세보기 / 데이터 검색
	 *               =======           ========
	 *                  |                 |
	 *                  ================== 페이징 (인라인뷰)
	 *               => 예약 / 구매 => JOIN / SUBQUERY
	 *                  사용자 ========= 맛집
	 *                           |
	 *                          예약
	 *      UPDATE :
	 *      
	 */
	// 상세보기 
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
