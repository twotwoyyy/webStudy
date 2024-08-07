package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.*;
public class BoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 * 	<insert id="boardInsert" parameterType="BoardVO">
			<selectKey keyProperty="no" resultType="int" order="BEFORE">
				SELECT NVL(MAX(no)+1,1) as no FROM project_board
			</selectKey>
			INSERT INTO project_board(no,name,subject,content,pwd)
			VALUES(#{no},#{name},#{subject},#{content},#{pwd})
		</insert>
		
		parameterType : 매개변수
		resultType : 리턴형
	 */
	public static void boardInsert(BoardVO vo) {
		SqlSession session=null;
		try {
			// 연결 => Connection 주소값 얻기 => DBCP : 미리 Connection 개체를 여러 개 생성 
			// Connection => 오라클 연결 시간이 오래 걸리는 단점 => Connection (연결에 소모되는 시간을 줄일 수 있다)
			// Connection 개체를 조절할 수 있다
			// => openSession() => autoCommit(false) => SELECT
			// => openSession(true) => autoCommit(true) => INSERT,UPDATE,DELETE
			session=ssf.openSession(true);
			session.insert("boardInsert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	/*
	 * 	<select id="boardListData" resultType="BoardVO" parameterMap="hashmap">
			SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num
			FROM (SELECT no,subject,name,regdate,hit,rownum as num
			FROM (SELECTno,subject,name,regdate,hit
			FROM project_board))
			WHERE num BETWEEN #{start} AND #{end}
		</select>
	 */
	public static List<BoardVO> boardListData(Map map){
		List<BoardVO> list=new ArrayList<BoardVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("boardListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	/*
	 * 	<select id="boardRowCount" resultType="int">
			SELECT COUNT(*) FROM project_board
		</select>
	 */
	// 총 페이지
	public static int boardRowCount() {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("boardRowCount");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	// 상세보기
	/*
	 * 	<update id="hitIncrement" parameterType="int">
		UPDATE project_board SET
		hit=hit+1
		WHERE no=#{no}
	</update>
	<!-- 
		parameterType="string" parameterType="java.lang.String"
		parameterType="hashmap" parameterType="java.util.Map" => 인식 못하면 후자로 써야 한다 
		parameterType="int" parameterType="java.lang.Integer" => 인식 못하면 후자로 써야 한다 
	 -->
	<select id="boardDetailData" resultType="BoardVO" parameterType="int">
		SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,hit
		FROM project_board
		WHERE no=#{no}
	</select>
	 */
	public static BoardVO boardDetailData(int no) {
		BoardVO vo=new BoardVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("hitIncrement",no);
			session.commit();
			vo=session.selectOne("boardDetailData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	public static BoardVO boardUpdateData(int no) {
		BoardVO vo=new BoardVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("boardDetailData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	public static String boardUpdate(BoardVO vo) {
		String result="no";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String db_pwd=session.selectOne("boardGetPassword",vo.getNo());
			if(db_pwd.equals(vo.getPwd())) {
				result="yes";
				session.update("boardUpdate",vo);
				session.commit();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return result;
	}
	/*
	 * 	<delete id="boardDelete" parameterType="int">
			DELETE FROM project_board
			WHERE no=#{no}
		</delete>
	 */
	public static String boardDelete(int no,String pwd) {
		String result="no";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String db_pwd=session.selectOne("boardGetPassword",no);
			if(db_pwd.equals(pwd)) {
				result="yes";
				session.update("boardDelete",no);
				session.commit();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return result;
	}
}
