package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class BoardReplyDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 * 	<select id="replyListData" resultType="BoardReplyVO" parameterType="int">
			SELECT rno,bno,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday
			FROM project_board_reply
			WHERE bno=#{bno}
			ORDER BY rno DESC
		</select>
	*/
	// 목록 출력
	public static List<BoardReplyVO> replyListData(int bno){
		List<BoardReplyVO> list=new ArrayList<BoardReplyVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("replyListData",bno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	/*
		<insert id="replyInsert" parameterType="BoardReplyVO">
			INSERT INTO project_board_reply VALUES(
				(SELECT NVL(MAX(rno)+1,1) FROM project_board_reply),
				#{bno},#{id},#{name},#{msg},SYSDATE
			);
		</insert>
	 */
	// 추가
	public static void replyInsert(BoardReplyVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("replyInsert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	/*
	 * 	<delete id="replyDelete" parameterType="int">
			DELETE FROM project_board_reply
			WHERE rno=#{rno}
		</delete>
	 */
	// 삭제
	public static void replyDelete(int rno) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("replyDelete",rno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	// 수정
	public static void replyUpdate(BoardReplyVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("replyUpdate",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
}
