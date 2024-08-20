package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 * 	<select id="foodHitTopData">
		SELECT fno,name,poster,rownum
		FROM (SELECT fno,name,poster
		FROM project_food_house ORDER BY hit DESC)
		WHERE rownum&lt;=12
	</select>
	<select id="foodLikeTopData">
		SELECT fno,name,poster,rownum
		FROM (SELECT fno,name,poster
		FROM project_food_house ORDER BY likecount DESC)
		WHERE rownum&lt;=12
	</select>
	<select id="foodJjimTopData">
		SELECT fno,name,poster,rownum
		FROM (SELECT fno,name,poster
		FROM project_food_house ORDER BY jjimcount DESC)
		WHERE rownum&lt;=12
	</select>
	 */
	// hit가 많은 맛집
	public static List<FoodVO> foodHitTopData(){
		List<FoodVO> list=new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodHitTopData");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	// like가 많은 맛집
	public static List<FoodVO> foodLikeTopData(){
		List<FoodVO> list=new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodLikeTopData");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	// jjim이 많은 맛집 
	public static List<FoodVO> foodJjimTopData(){
		List<FoodVO> list=new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodJjimTopData");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	/*
	 * 	<select id="foodListCount" resultType="int">
		SELECT COUNT(*) FROM project_food_house
		</select>
	 */
	public static int foodListCount() {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("foodListCount");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	/*
	 * 	<select id="foodListData" resultType="foodVO" parameterType="java.util.Map">
			SELECT fno,name,poster,num
			FROM (SELECT fno,name,poster,rownum as num
			FROM (SELECT fno,name,poster
			FROM project_food_house))
			WHERE num BETWEEN #{start} AND #{end}
		</select>
		<select id="foodTotalPage" resultType="int">
			SELECT CEIL COUNT(*)/20.0 FROM project_food_house
		</select>
	 */
	// 목록 출력
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
	//총 페이지 나누기
	public static int foodTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("foodTotalPage");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	/*
	 * 	<update id="foodHitIncrement" parameterType="int">
			UPDATE project_food_house SET
			hit=hit+1
			WHERE fno=#{fno}
		</update>
	 */
	// 조회수 증가
	/*
	 * 	<select id="foodDetailData" resultType="FoodVO" parameterType="int">
			SELECT fno,name,type,phone,address,score,theme,poster,images,time,parking,content
			FROM project_food_house
			WHERE fno=#{fno}
		</select>
	 */
	// 목록 출력
	public static FoodVO foodDetailData(int fno) {
		FoodVO vo=new FoodVO();
		SqlSession session=null;
		try {
			// 조회수 증가
			session=ssf.openSession();
			session.selectOne("foodHitIncrement",fno);
			session.commit();
			// 데이터 읽기
			vo=session.selectOne("foodDetailData",fno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}		
		return vo;
	}
	// 맛집 검색
	public static List<FoodVO> foodFindListData(Map map){
		List<FoodVO> list=new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodFindListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int foodFindTotalPage(String ss) {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("foodFindTotalPage",ss);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	/*
	 * 	<select id="foodNearListData" resultType="FoodVO" parameterType="string">
			SELECT fno,name,poster,rownum
			FROM (SELECT fno,name,poster
			FORM project_food_house WHERE address LIKE '%'||#{ss}||'%' ORDER BY fno ASC)
			WHERE rownum&lt;=6
		</select>
	 */
	// 인근 맛집 출력
	public static List<FoodVO> foodNearListData(String ss){
		List<FoodVO> list=new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodNearListData",ss);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	// 예약
	public static List<FoodVO> foodTypeAllData(String type){
		List<FoodVO> list=new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodTypeAllData",type);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static String foodReserveDayData(int fno) {
		String rdays="";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			rdays=session.selectOne("foodReserveDayData",fno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return rdays;
	}
	
	public static String foodReserveTimeData(int dno) {
		String times="";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			times=session.selectOne("foodReserveTimeData",dno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
		return times;
	}
	
	public static String foodTimeSelectData(int tno) {
		String times="";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			times=session.selectOne("foodTimeSelectData",tno);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		
		return times;
	}
	
	// 예약 
	public static void reserveInsert(ReserveVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("reserveInsert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	public static List<ReserveVO> reserveMyPageData(String id){
		List<ReserveVO> list=new ArrayList<ReserveVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("reserveMyPageData",id);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	/*
	    * <select id="reserveAdminPageData" resultMap="reserveMap">
	      SELECT rno,pr.fno,id,day,pr.time,inwon,isok,pf.name,pf.poster,pf.address,pf.phone,
	             TO_CHAR(regdate,'YYYY-MM-DD') as dbday
	      FROM project_reserve pr,project_food_house pf
	      WHERE pr.fno=pf.fno
	      ORDER BY rno DESC
	     </select>
	    */
	   public static List<ReserveVO> reserveAdminPageData()
	   {
	      List<ReserveVO> list=new ArrayList<ReserveVO>();
	      SqlSession session=null; //Connection
	      try
	      {
	         session=ssf.openSession(true);
	         list=session.selectList("reserveAdminPageData");
	      }catch(Exception ex)
	      {
	         ex.printStackTrace();
	      }
	      finally
	      {
	         if(session!=null)
	            session.close();
	      }
	      return list;
	   }
	   
	   public static void reserveOK(int rno) {
		   List<ReserveVO> list=new ArrayList<ReserveVO>();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("reserveOK",rno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   
	   }
	   
	   /*
	    * 	<delete id="reserveCancel" parameterType="int">
			DELETE FROM project_reserve
			WHERE rno=#{rno}
			</delete>
	    */
	   public static void reserveCancel(int rno) {
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession(true);
			   session.delete("reserveCancel",rno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   /*
	    * 	<select id="mypageReserveInfoData" resultMap="reserveMap" parameterType="int">
				SELECT rno,day,pr.time,inwon,pf.name,pf.poster,pf.address,phone,theme,score,content,
				       TO_CHAR(regdate,'YYYY-MM-DD HH:24:MI:SS') as dbday
				FROM project_reserve pr, project_food_house pf
				WHERE pr.fno=pf.fno AND rno=#{rno} 
			</select>
	    */
	   public static ReserveVO mypageReserveInfoData(int rno) {
		   ReserveVO vo=new ReserveVO();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   vo=session.selectOne("mypageReserveInfoData",rno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return vo;
	   }
}
