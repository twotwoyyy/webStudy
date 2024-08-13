package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class AllJjimDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static void allJjimInsert(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("allJjimInsert",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	// 찜하기
	public static int allJjiCheck(Map map) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			count=session.selectOne("allJjimCheck",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
}
