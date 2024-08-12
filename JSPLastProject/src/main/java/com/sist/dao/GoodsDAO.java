package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class GoodsDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<GoodsVO> goodsListData(Map map){
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("goodsListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int goodsTotalPage(Map map){
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("goodsTotalPage",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	
	public static GoodsVO goodsDetailData(Map map) {
		GoodsVO vo=new GoodsVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("goodsHitIncrement",map);
			session.commit();
			vo=session.selectOne("goodsDetailData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
}
