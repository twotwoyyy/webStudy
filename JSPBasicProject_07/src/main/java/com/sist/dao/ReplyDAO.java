package com.sist.dao;
import java.sql.*;
import java.util.*;
import com.sist.database.*;
public class ReplyDAO {
   private Connection conn;
   private PreparedStatement ps;
   private static ReplyDAO dao;
   private DataBaseConnection dbConn=new DataBaseConnection();
   
   public static ReplyDAO newInstance() {
      if(dao==null) {
         dao=new ReplyDAO();
      }
      return dao;
   }
   
   /*
       try {
         conn=dbConn.getConnection();
      }catch(Exception ex) {
         ex.printStackTrace();
      }finally {
         dbConn.disConnection(conn, ps);
      } 
    */
   // 댓글 추가
   public void replyInsert(ReplyVO vo) {
      try {
         conn=dbConn.getConnection();
         String sql="INSERT INTO food_reply VALUES("
               + "fr_rno_seq.nextval, ?, ?, ?, ?, ?, SYSDATE)";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, vo.getType());
         ps.setInt(2,vo.getFno());
         ps.setString(3, vo.getId());
         ps.setString(4, vo.getName());
         ps.setString(5, vo.getMsg());
         ps.executeUpdate();
      }catch(Exception ex) {
         ex.printStackTrace();
      }finally {
         dbConn.disConnection(conn, ps);
      }
   }
   // 데이터 읽기
   public List<ReplyVO> replyListData(int fno,int type){
      List<ReplyVO> list=new ArrayList<ReplyVO>();
       try {
         conn=dbConn.getConnection();
         String sql="SELECT /*+ INDEX_DESC(food_reply fr_rno_pk)*/rno, fno, id, name, msg, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') "
               + "FROM food_reply "
               + "WHERE fno="+fno+" and type="+type;
         ps=conn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         while(rs.next()) {
            ReplyVO vo=new ReplyVO();
            vo.setRno(rs.getInt(1));
            vo.setFno(rs.getInt(2));
            vo.setId(rs.getString(3));
            vo.setName(rs.getString(4));
            vo.setMsg(rs.getString(5));
            vo.setDbday(rs.getString(6));
            list.add(vo);
         }
         rs.close();
      }catch(Exception ex) {
         ex.printStackTrace();
      }finally {
         dbConn.disConnection(conn, ps);
      } 
      return list;
   }
   
   // 댓글 삭제
   public void replyDelete(int rno) {
       try {
         conn=dbConn.getConnection();
         String sql="DELETE FROM food_reply "
               + "WHERE rno="+rno;
         ps=conn.prepareStatement(sql);
         ps.executeUpdate();
      }catch(Exception ex) {
         ex.printStackTrace();
      }finally {
         dbConn.disConnection(conn, ps);
      } 
   }
   // 댓글 수정 
   public void replyUpdate(ReplyVO vo) {
	   try {
		   conn=dbConn.getConnection();
		   String sql="UPDATE food_reply SET "
				     +"msg=? "
				     +"WHERE rno=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getMsg());
		   ps.setInt(2, vo.getRno());
		   ps.executeUpdate();
		   
	   }catch(Exception ex) {
		   ex.printStackTrace();
	   }finally {
		   dbConn.disConnection(conn, ps);
	   }
   }
}
