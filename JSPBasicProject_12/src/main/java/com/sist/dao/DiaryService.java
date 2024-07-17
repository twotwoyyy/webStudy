package com.sist.dao;
/*
 *	table => VO, DAO
 *	===== table 여러 개 혼합 => Service
 *                          ======== board / reply
 *                          ======== food / jjim / like
 *  C/S
 *               request(JSP) 
 * 		브라우저 ================> 서버
 *            <================ 
 *               response(HTML)
 *  
 *                 SQL 문장
 *     클라이언트 ================> 오라클
 *             <===============
 *             실제 저장된 데이터  PreparedStatement=> OutputStream, BufferedReader
 */
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import javax.naming.spi.DirStateFactory.Result;
public class DiaryService {
	private Connection conn;
	private PreparedStatement ps;
	private static DiaryService dao;
	
	public static DiaryService newInstance() {
		if(dao==null)
			dao=new DiaryService();
		return dao;
	}
	// 미리 콤탯에 의해 생성된 Connection 주소를 읽어온다 
	/*  => JNDI new InitialContext()
	 *   ============java://comp/env===============
	 *    =======================================
	 *      new Connection() false jdbc/oracle
	 *                       ======
	 *                        true
	 *    =======================================
	 *      new Connection() false jdbc/oracle
	 *    =======================================
	 *  ===========================================
	 * 
	 * 
	 */
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	// 다시 Connection 관리 영역(POOL)으로 반환 => 연결에 소모되는 시간을 절약하기 위해
	// Connection을 일정하게 관리할 수 있다 
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
	// 1. 로그인 기능 => Session => 사용자 정보 저장 
	public MemeberVO isLogin(String id,String pwd) {
		MemeberVO vo=new MemeberVO();
		try {
			getConnection();
			// 1. 아이디 존재 여부 확인
			String sql="SELECT COUNT(*) FROM member "
					  +"WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			// 실행 결과
			ResultSet rs=ps.executeQuery();
			rs.next(); // 데이터 출력 위치로 커서를 이동 
			int count=rs.getInt(1);
			rs.close();
			
			if(count==0) { // ID가 없는 상태
				vo.setMsg("NOID");
			}else { // ID가 존재하는 상태 
				// 2. 비밀번호 확인	
				sql="SELECT pwd,name,sex FROM member WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				String name=rs.getString(2);
				String sex=rs.getString(3);
				rs.close();
				
				if(db_pwd.equals(pwd)) {
					// 포그인 된 상태
					vo.setId(id);
					vo.setName(name);
					vo.setSex(sex); // Session에 저장 
					vo.setMsg("OK");
					
				}else {
					// 비밀번호가 틀린 상태 
					vo.setMsg("NOPWD");
				}
			}
			
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection(); // 반환(재사용)
		}
		return vo;
	}
	/*
	 *	로그인 => 매개변수 (사용자가 보내준 값 : id,pwd)  
	 *		    리턴형 => 결과값 
	 *          ==== 경우의 수 =>  경우의 수 1 => List/VO/int
	 *                          경우의 수 2 => boolean
	 *                          경우의 수 여러 개 => String 
	 */
	// 2. ID별로 일정 관리 (개인 일정 관리)
	// 2-1 일정 등록
	public void diaryInsert(DiaryVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO diary VALUES("
					  +"diary_no_seq.nextval,?,?,?,?,?,?,SYSDATE)";	
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getMsg());
			ps.setInt(4, vo.getYear());
			ps.setInt(5, vo.getMonth());
			ps.setInt(6, vo.getDay());
			ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
	// 2-2 일정 출력
	public List<DiaryVO> diaryListData(DiaryVO vo){
		List<DiaryVO> list=new ArrayList<DiaryVO>();
		try {
			getConnection();
			String sql="SELECT no,subject,TO_CHAR(regdate,'YYYY-MM-DD'),msg,year,month,day "
					  +"FROM diary "
					  +"WHERE id=? AND year=? AND month=? AND day=? "
					  +"ORDER BY no DESC";
			// 인덱스 이용해 정렬할 때는 검색이 많은 경우, 데이터가 많은 경우 
			// 수정, 삭제 추가가 많은 경우에는 INDEX를 계속 rebuild하기 때문에 속도가 느려진다 => 가급적 ORDER BY 
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getYear());
			ps.setInt(3, vo.getMonth());
			ps.setInt(4, vo.getDay());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				DiaryVO dvo=new DiaryVO();
				dvo.setNo(rs.getInt(1));
				dvo.setSubject(rs.getString(2));
				dvo.setDbday(rs.getString(3));
				dvo.setMsg(rs.getString(4));
				dvo.setYear(rs.getInt(5));
				dvo.setMonth(rs.getInt(6));
				dvo.setDay(rs.getInt(7));
				list.add(dvo);
			}
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection(); // 반환 (재사용) => Connection을 관리하기 편리, 일정 개수 유지 
		}
		return list;
	}
	// 2-3 달력에 일정 표시
	public int diaryCheck(String id, int year, int month, int day) {
		int bCheck=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM diary WHERE id=? AND year=? AND month=? AND day=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, year);
			ps.setInt(3, month);
			ps.setInt(4, day);
			ResultSet rs=ps.executeQuery();
			rs.next();
			bCheck=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return bCheck;
	}
	// 2-4-1 일정 수정(데이터 불러오기) 
	public DiaryVO diaryUpdateDate(int no) {
		DiaryVO vo=new DiaryVO();
		try {
			getConnection();
			String sql="SELECT no,subject,msg,year,month,day "
					  +"FROM diary "
					  +"WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setSubject(rs.getString(2));
			vo.setMsg(rs.getString(3));
			vo.setYear(rs.getInt(4));
			vo.setMonth(rs.getInt(5));
			vo.setDay(rs.getInt(6));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
	// 2-4-2 일정 수정
	public void diaryUpdate(DiaryVO vo) {
		try {
			getConnection();
			String sql="UPDATE diary SET "
					  +"subject=?,msg=?,year=?,month=?,day=?,regdate=SYSDATE "
					  +"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getSubject());
			ps.setString(2, vo.getMsg());
			ps.setInt(3, vo.getYear());
			ps.setInt(4, vo.getMonth());
			ps.setInt(5, vo.getDay());
			ps.setInt(6, vo.getNo());
			ps.executeUpdate();

		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
	// 2-5 일정 취소
	public void diaryDelete(int no) {
		try {
			getConnection();
			String sql="DELETE FROM diary WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();

		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
	// 3. 장바구니 : session => 제공하는 메서드 정리 
	// 3-1. 상품 출력 
	// 3-2. 장바구니 등록 => session 
	// 3-3. 장바구니 상품 취소
	// 3-4. 구매 => 데이터베이스에 저장 
}
