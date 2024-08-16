package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class AdminModel {
	private String[] types= {"","일반 공지","이벤트 공지","맛집 공지","여행 공지"};
	@RequestMapping("adminpage/adminpage_main.do")
	public String adminpage_main(HttpServletRequest request, HttpServletResponse response) {
		
		// 이중 
		request.setAttribute("admin_jsp", "../adminpage/admin_home.jsp");
		request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("adminpage/member_list.do")
	public String member_list(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("admin_jsp", "../adminpage/member_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("adminpage/notice_list.do")
	public String notice_list(HttpServletRequest request, HttpServletResponse response) {
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=15;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeVO> list=NoticeDAO.noticeListData(map);
		for(NoticeVO vo:list) {
			vo.setNotice_type(types[vo.getType()]);
		}
		int count=NoticeDAO.noticeRowCount();
		int totalpage=(int)(Math.ceil(count/15.0));
		count=count-((curpage*rowSize)-rowSize);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("noticeList", list);
		
		request.setAttribute("admin_jsp", "../notice/notice_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	@RequestMapping("adminpage/notice_insert.do")
	public String notice_insert(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("admin_jsp", "../notice/notice_insert.jsp");
		request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	@RequestMapping("adminpage/notice_insert_ok.do")
	public String notice_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		NoticeVO vo=new NoticeVO();
		vo.setType(Integer.parseInt(type));
		vo.setSubject(subject);
		vo.setContent(content);
		NoticeDAO.noticeInsert(vo);
		return "redirect:../adminpage/notice_list.do";
	}
	
	@RequestMapping("adminpage/notice_update.do")
	public String notice_update(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		NoticeVO vo=NoticeDAO.noticeUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("admin_jsp", "../notice/notice_update.jsp");
		request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/notice_update_ok.do")
	public String notice_update_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String no=request.getParameter("no"); //update,delete
		NoticeVO vo=new NoticeVO();
		vo.setType(Integer.parseInt(type));
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setNo(Integer.parseInt(no));
		// DB 연동
		NoticeDAO.noticeUpdate(vo);

		return "redirect:../adminpage/notice_list.do";
	}
	
	@RequestMapping("adminpage/notice_delete.do")
	public String notice_delete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		NoticeDAO.noticeDelete(Integer.parseInt(no));
		
		return "redirect:../adminpage/notice_list.do";
	}
	
	  @RequestMapping("adminpage/reply_list.do")
	   public String reply_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=15;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   map.put("start", start);
		   map.put("end", end);
		   
		   List<ReplyBoardVO> list=ReplyBoardDAO.adminReplyBoardListData(map);
		   int count=ReplyBoardDAO.replyBoardRowCount();
		   int totalpage=(int)(Math.ceil(count/15.0));
		   
		   request.setAttribute("arList", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("count", count);
		   
		   request.setAttribute("admin_jsp", "../adminpage/admin_reply_list.jsp");
		   request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		   CommonsModel.footerPrint(request);
		   return "../main/main.jsp";
	   }
	   @RequestMapping("adminpage/reply_insert.do")
	   public String reply_insert(HttpServletRequest request,HttpServletResponse response)
	   {
		   String no=request.getParameter("no");
		   request.setAttribute("no", no);
		   request.setAttribute("admin_jsp", "../adminpage/admin_reply_insert.jsp");
		   request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		   CommonsModel.footerPrint(request);
		   return "../main/main.jsp";
	   }
	   
	   @RequestMapping("adminpage/reply_insert_ok.do")
	   public String reply_insert_ok(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String no=request.getParameter("no");
		   String subject=request.getParameter("subject");
		   String content=request.getParameter("content");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   String name=(String)session.getAttribute("name");
		   ReplyBoardVO rvo=ReplyBoardDAO.adminReplyInfoData(Integer.parseInt(no));
		   
		   ReplyBoardVO vo=new ReplyBoardVO();
		   vo.setId(id);
		   vo.setSubject(subject);
		   vo.setContent(content);
		   vo.setName(name);
		   vo.setGroup_id(rvo.getGroup_id());
		   
		   ReplyBoardDAO.adminReplyBoardInsert(Integer.parseInt(no), vo);
		   
		   return "redirect:../adminpage/reply_list.do";
	   }
	   
}