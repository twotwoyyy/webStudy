package com.sist.model;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;

// 요청 처리를 하고 결과값을 JSP로 전송해주는 역할 => Model
// 오라클 연결 / 데이터를 모음 / 전송
//  DAO         VO       Model => Model (Back-End) 
/*
 *	1. GIT
 *  2. 데이터베이스 설계 => 정규화
 *  3. ERD
 *  4. 유스케이스 다이어그램
 *  5. UI => 화면
 *  6. 구현
 *  7. 테스팅 
 *  8. 배포 ==> AWS 
 * 
 */
/*
 *	JSP 파일 시작 
 *  <%@ page ~ %>
 *  <% 데이터 읽기 %> => 자바 파일로 제작 
 */
/*
 *    JSP =====> Java : URL 주소로 Java는 호출이 불가능
 *        request 객체를 전송
 *    JSP =====> JSP : URL 주소로 값 전송이 가능 
 *    JSP =====> Servlet : URL 주소로 값 전송이 가능 
 */
public class BoardModel {
	   // request에 값을 담아주는 역할 => 요청처리하는 부분 
	   public void boardListData(HttpServletRequest request)
	   {
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   
		   int curpage=Integer.parseInt(page);
		   
		   BoardDAO dao=BoardDAO.newInstance();
		   List<BoardVO> list=dao.boardListData(curpage);
		   int totalpage=dao.boardTotalPage();
		   
		   // list.jsp로 출력에 필요한 데이터 전송 
		   request.setAttribute("list", list);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("curpage", curpage);
		   // 오늘 날짜 전송 
		   request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	   }
	   // 글쓰기 처리 
	   public void boardInsertOk(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			    request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   
		   String name=request.getParameter("name");
		   String subject=request.getParameter("subject");
		   String content=request.getParameter("content");
		   String pwd=request.getParameter("pwd");
		   
		   BoardVO vo=new BoardVO();
		   vo.setName(name);
		   vo.setSubject(subject);
		   vo.setContent(content);
		   vo.setPwd(pwd);
		   
		   BoardDAO dao=BoardDAO.newInstance();
		   dao.boardInsert(vo);
		   
		   // 화면 이동 
		   try
		   {
		      response.sendRedirect("list.jsp");
		   }catch(Exception ex) {}
	   }
	   // 상세보기 
	   public void boardDetailData(HttpServletRequest request)
	   {
		   String no=request.getParameter("no");
		   BoardDAO dao=BoardDAO.newInstance();
		   BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		   
		   request.setAttribute("vo", vo);
	   }
	   // 수정하기 
	   public void boardUpdateData(HttpServletRequest request)
	   {
		   // update.jsp?no=1
		   String no=request.getParameter("no");
		   BoardDAO dao=BoardDAO.newInstance();
		   BoardVO vo=dao.boardUpdateData(Integer.parseInt(no));
		   request.setAttribute("vo", vo);
		   
	   }
	   public void boardUpdateOk(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			    request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   
		   String name=request.getParameter("name");
		   String subject=request.getParameter("subject");
		   String content=request.getParameter("content");
		   String pwd=request.getParameter("pwd");
		   String no=request.getParameter("no");
		   
		   BoardVO vo=new BoardVO();
		   vo.setName(name);
		   vo.setSubject(subject);
		   vo.setContent(content);
		   vo.setPwd(pwd);
		   vo.setNo(Integer.parseInt(no));
		   
		   BoardDAO dao=BoardDAO.newInstance();
		   boolean bCheck=dao.boardUpdate(vo);
		   
		 try
		 {
		   if(bCheck==true)
		   {
			   // 화면 이동 
			   response.sendRedirect("detail.jsp?no="+no);
		   }
		   else
		   {
			   // HTML 전송 
			   PrintWriter out=response.getWriter();
			   out.write("<script>");
			   out.write("alert(\"비밀번호가 틀립니다\");");
			   out.write("history.back();");
			   out.write("</script>");
		   }
		 }catch(Exception ex) {}
	   }
	   
	   public void boardDeleteOk(HttpServletRequest request,HttpServletResponse response)
	   {
		   String no=request.getParameter("no");
		   String pwd=request.getParameter("pwd");
		   
		   BoardDAO dao=BoardDAO.newInstance();
		   boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
		   
		   try
		   {
		    if(bCheck==true)
		    {
			   response.sendRedirect("list.jsp");
		    }
		    else
		    {
		    	   PrintWriter out=response.getWriter();
				   out.write("<script>");
				   out.write("alert(\"비밀번호가 틀립니다\");");
				   out.write("history.back();");
				   out.write("</script>");
		    }
		   }catch(Exception ex) {}
	   }
	}



