package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class FoodDAO {
	private static SqlSessionFactory ssf;
	
	static {
		try {
			// ssf에 대한 초기화
			Reader reader=Resources.getResourceAsReader("config.xml");
			// classpath => 자동 인식 => src/main/java 
			// XML 파싱한 데이터를 첨부
			ssf=new SqlSessionFactoryBuilder().build(reader);
			// sql, id 저장 
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public static List<FoodVO> foodListData(Map map){
		List<FoodVO> list=new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int foodTotalPage(String type) {
		int total=0;
		SqlSession session=null;
		try {
			try {
				session=ssf.openSession();
				total=session.selectOne("foodTotalPage",type);
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
} 
