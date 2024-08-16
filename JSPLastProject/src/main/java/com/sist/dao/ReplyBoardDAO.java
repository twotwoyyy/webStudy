package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class ReplyBoardDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
  }
  /*
   *   <!-- 목록 -->
	  <select id="replyBoardListData" resultType="ReplyBoardVO" parameterType="hashmap">
	    SELECT no,id,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,group_step,num
	    FROM (SELECT no,id,subject,name,regdate,hit,group_step,rownum as num 
	    FROM (SELECT no,id,subject,name,regdate,hit,group_step 
	    FROM project_replyboard ORDER BY group_id DESC , group_step ASC))
	    WHERE num BETWEEN #{start} AND #{end}
	  </select>
	  <!-- 등록 / 답변 -->
	  <insert id="replyBoardInsert" parameterType="ReplyBoardVO">
	   INSERT INTO project_replyboard(no,id,name,subject,content,pwd,group_id) 
	   VALUES(pr_no_seq.nextval,#{id},#{name},#{subject},#{content},#{pwd},
	    (SELECT NVL(MAX(group_id)+1,1) FROM project_replyboard)
	   )
	  </insert>
   */
  public static List<ReplyBoardVO> replyBoardListData(Map map)
  {
	  List<ReplyBoardVO> list=new ArrayList<ReplyBoardVO>();
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession();
		  list=session.selectList("replyBoardListData", map);
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
  public static void replyBoardInsert(ReplyBoardVO vo)
  {
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession(true);
		  session.insert("replyBoardInsert",vo);
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
   *   <select id="replyBoardRowCount" resultType="int">
		   SELECT COUNT(*) FROM project_replyboard
		  </select>
   */
  public static int replyBoardRowCount()
  {
	  int count=0;
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession();
		  count=session.selectOne("replyBoardRowCount");
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  if(session!=null)
			  session.close();
	  }
	  return count;
  }
  /*
   *  <select id="adminReplyBoardListData" resultType="ReplyBoardVO" parameterType="hashmap">
		    SELECT no,id,isreply,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,group_step,group_id,num
		    FROM (SELECT no,id,isreply,subject,name,regdate,hit,group_step,group_id,rownum as num 
		    FROM (SELECT no,id,isreply,subject,name,regdate,hit,group_step,group_id
		    FROM project_replyboard ORDER BY group_id DESC , group_step ASC))
		    WHERE num BETWEEN #{start} AND #{end}
		  </select>
		  <insert id="adminReplyBoardInsert" parameterType="ReplyBoardVO">
		   INSERT INTO project_replyboard(no,id,name,subject,content,group_id,group_step,isreply) 
		   VALUES(pr_no_seq.nextval,#{id},#{name},#{subject},#{content},
		    #{group_id},1,1
		   )
		  </insert>
   */
  public static List<ReplyBoardVO> adminReplyBoardListData(Map map)
  {
	  List<ReplyBoardVO> list=new ArrayList<ReplyBoardVO>();
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession();
		  list=session.selectList("adminReplyBoardListData", map);
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
  public static void adminReplyBoardInsert(int no,ReplyBoardVO vo)
  {
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession();
		  session.insert("adminReplyBoardInsert",vo);
		  session.update("adminReplyUpdate",no);
		  session.commit();
	  }catch(Exception ex)
	  {
		  session.rollback();// 트랜잭션 
		  ex.printStackTrace();
	  }
	  finally
	  {
		  if(session!=null)
			  session.close();
	  }
  }
  /*
   *   <select id="adminReplyInfoData" resultType="ReplyBoardVO" parameterType="int">
		    SELECT group_id,group_step FROM project_replyboard
		    WHERE no=#{no}
		  </select>
		  <update id="adminReplyUpdate" parameterType="int">
		    UPDATE project_replyboard SET 
		    isreply=1
		    WHERE no=#{no}
		  </update>
   */
  public static ReplyBoardVO adminReplyInfoData(int no)
  {
	  ReplyBoardVO vo=new ReplyBoardVO();
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession(true);
		  vo=session.selectOne("adminReplyInfoData",no);
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