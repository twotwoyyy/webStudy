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
}
