package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class CartDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 장바구니 담기
	public static void cartInsert(CartVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.insert("cartInsert",vo);
			session.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	// 장바구니 목록 
	public static List<CartVO> cartListData(String id){
		List<CartVO> list=new ArrayList<CartVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("cartListData",id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static int cartGetGnoCount(Map map) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("cartGetGnoCount",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	public static int cartGetGno(Map map) {
		int cno=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			cno=session.selectOne("cartGetGno",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return cno;
	}
	public static void cartGnoUpdate(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("cartGnoUpdate",map);
			session.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	// 바로 구매
	public static void buyInsert(CartVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.insert("buyInsert",vo);
			session.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	public static List<CartVO> buyListData(String id){
		List<CartVO> list=new ArrayList<CartVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("buyListData",id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static int buyTotalPrice(String id) {
	    Integer total = null;
	    SqlSession session = null;
	    try {
	        session = ssf.openSession();
	        total = session.selectOne("buyTotalPrice", id);
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        if(session != null)
	            session.close();
	    }
	    // total이 null인 경우 0을 반환
	    return (total != null) ? total.intValue() : 0;
	}
	
	public static void cartCancel(int cno) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("cartCancel",cno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
	}
	
	public static void cartBuyUpdate(int cno) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("cartBuyUpdate",cno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
}
