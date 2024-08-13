package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class AllReplyDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 * 	<insert id="allReplyInsert" parameterType="AllReplyVO">
			INSERT INTO all_reply VALUES(
				(SELECT NVL(MAX(rno)+1,1) FROM all_reply),
				#{cno},#{type},#{id},#{name},#{msg},SYSDATE
			)
		</insert>

	 */
	public static void allReplyInsert(AllReplyVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			// insert / delete / update => autocommit()
			// update + select => commit()
			// insert + update => commit() => transaction 트랜잭션
			session.insert("allReplyInsert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	/*
	 * 	<select id="allReplyListData" resultType="AllReplyVO" parameterType="java.util.Map">
			SELECT rno,cno,type,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday
			FROM all_reply
			WHERE cno=#{cno} AND type=#{type}
			ORDER BY rno DESC
		</select>
	 */
	public static List<AllReplyVO> allReplyListData(Map map){
		List<AllReplyVO> list=new ArrayList<AllReplyVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("allReplyListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static void allReplyDelete(int rno) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			// insert / delete / update => autocommit()
			// update + select => commit()
			// insert + update => commit() => transaction 트랜잭션
			session.delete("allReplyDelete",rno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	/*
	 * 	<update id="allReplyUpdate" parameterType="java.util.Map">
		UPDATE all_reply SET 
		msg=#{msg}
		WHERE rno=#{rno}
	</update>
	 */
	// 업데이트
	public static void allReplyUpdate(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("allReplyUpdate",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
}
