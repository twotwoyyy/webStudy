package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class RecipeDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	// 목록
	public static List<RecipeVO> recipeListData(Map map){
		List<RecipeVO> list=new ArrayList<RecipeVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("recipeListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	// 총페이지
	public static int recipeTotalCount() {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("recipeTotalCount");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	// 상세보기
	public static RecipeDetailVO recipeDetailData(int no) {
		RecipeDetailVO vo=new RecipeDetailVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("recipeHitIncrement",no); // 조회수 증가
			session.commit();
			vo=session.selectOne("recipeDetailData",no); // 상세 데이터
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
		
	}
	// chef
	// 1. 목록 출력
	public static List<ChefVO> recipeChefListData(Map map){
		List<ChefVO> list=new ArrayList<ChefVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("recipeChefListData",map); 
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	// 2. 목록 총 페이지
	public static int recipeChefTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("recipeChefTotalPage"); 
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
		return total;
	}
	
	public static List<RecipeVO> recipeChefMakeData(Map map){
		List<RecipeVO> list=new ArrayList<RecipeVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("recipeChefMakeData",map); 
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static int recipeChefMakeTotalPage(String chef) {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("recipeChefMakeTotalPage",chef); 
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
}
