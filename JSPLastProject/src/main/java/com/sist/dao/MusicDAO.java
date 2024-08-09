package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.dao.*;
import com.sist.vo.MusicVO;
public class MusicDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 * 	<select id="musicListData" resultType="MusicVO">
			SELECT mno,title,singer,poster,album,state,idcrement
			FROM genie_music
		</select>
		<select id="musicFindData" resultType="MusicVO" parameterType="java.util.Map">
			SELECT mno,title,singer,poster,album,state,idcrement
			FROM genie_music
			WHERE ${column} LIKE '%'||#{ss}||'%'
		</select>
	 */
	// 
	public static List<MusicVO> musicListData(){
		List<MusicVO> list=new ArrayList<MusicVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession(); // Connection 주소 얻기
			// MyBatis => DBCP (maxActive, maxIdle)
			list=session.selectList("musicListData");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close(); // POOL 반환 => 재사용 
		}
		return list;
	}
	public static List<MusicVO> musicFindData(Map map){
		List<MusicVO> list=new ArrayList<MusicVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession(); // Connection 주소 얻기
			// MyBatis => DBCP (maxActive, maxIdle)
			list=session.selectList("musicFindData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close(); // POOL 반환 => 재사용 
		}
		return list;
	}
	
	public static String musicDetailData(int mno) {
		String poster="";
		SqlSession session=null;
		try {
			session=ssf.openSession(); // Connection 주소 얻기
			// MyBatis => DBCP (maxActive, maxIdle)
			poster=session.selectOne("musicDetailData",mno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close(); // POOL 반환 => 재사용 
		}
		return poster;
				
	}
}
