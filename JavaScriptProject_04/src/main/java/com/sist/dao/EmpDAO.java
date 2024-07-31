package com.sist.dao;
import java.util.*;
import java.io.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import oracle.net.ns.SessionAtts;
public class EmpDAO {
	// XML을 파싱
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public static List<EmpVO> empListData(){
		List<EmpVO> list=new ArrayList<EmpVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("empListData");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close(); // Connection 반환
		}
		//return ssf.openSession().selectList("empListData"); // mapper에 있는 select id를 넣어야 한다 
		return list;
	}
	public static EmpVO empDetailData(int empno) {
		SqlSession session=null;
		EmpVO vo=new EmpVO();
		try {
			session=ssf.openSession();
			vo=session.selectOne("empDetailData",empno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close(); // Connection 반환
		}
		return vo;
	}
}
