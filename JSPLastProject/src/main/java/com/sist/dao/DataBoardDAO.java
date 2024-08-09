package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class DataBoardDAO {
	public static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	// 기능
	public static void databoardInsert(DataboardVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("databoardInsert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	public static List<DataboardVO> databoardListData(Map map){
		List<DataboardVO> list=new ArrayList<DataboardVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("databoardListData", map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int databoardRowCount() {
		/*
		 * SqlSession session=ssf.openSsesion();
		 * int count=session.selectOne("databoardRowCount");
		 * session.close();
		 * return count;
		 */
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("databoardRowCount");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	// 상세 보기
	/*
	 * 	 <update id="databoardHitIncrement" parameterType="int">
	 		UPDATE project_databoard SET 
	 		hit=hit+1
	 		WHERE no=#{no}
	 	</update>
	 	<select id="databoardDetailData" resultType="DataboardVO" parameterType="int">
			SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,hit,filename,filesize
			FROM project_databoard
			WHERE no=#{no}	 
	 	</select>
	 */
	public static DataboardVO databoardDetailData(int no) {
		DataboardVO vo=new DataboardVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("databoardHitIncrement",no);
			session.commit(); // update,delete,insert
			vo=session.selectOne("databoardDetailData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	/*
	 * 	 <select id="databoardGetPassword" resultType="string">
	 		SELECT pwd FROM databoard WHERE no=#{no}
	 	</select>
	 	<select id="databoardFileInfoData" resultType="DataboardVO" parameterType="int">
	 		SELECT filename,filesize FROM databoard WHERE no=#{no}
	 	</select>
	 	<delete id="databoardDelete" parameterType="int">
	 		DELETE FROM databoard WHERE no=#{no}
	 	</delete>
	 */
	public static DataboardVO databoardFileInfoData(int no) {
		// 폴더에서 파일 삭제 
		DataboardVO vo=new DataboardVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("databoardFileInfoData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	// 실제 삭제 
	/*
    *  <delete id="databoardReplyDelete" parameterType="int">
	    	DELETE FROM project_board_reply
	    	WHERE bno=#{no}
	   </delete>
    */
	public static String databoardDelete(int no,String pwd) {
		String result="no";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String db_pwd=session.selectOne("databoardGetPassword",no);
			if(db_pwd.equals(pwd)) {
				result="yes";
				session.delete("databoardReplyDelete",no);
				session.delete("databoardDelete",no);
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
	public static DataboardVO databoardUpdateData(int no) {
		DataboardVO vo=new DataboardVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("databoardHitIncrement",no);
			session.commit(); // update,delete,insert
			vo=session.selectOne("databoardDetailData",no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	public static String databoardGetPassword(int no) {
		String pwd="";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			pwd=session.selectOne("databoardGetPassword",no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return pwd;
	}
	public static void databoardUpdate(DataboardVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("databoardUpdate",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	public static List<DataboardVO> databoardFindData(Map map){
		List<DataboardVO> list=new ArrayList<DataboardVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			list=session.selectList("databoardFindData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
}
