package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class BoardModel {
	@RequestMapping("board/list.do")
		public String board_list(HttpServletRequest request, HttpServletResponse response) {
			String page=request.getParameter("page");
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			int rowSize=10;
			int start=(rowSize*curpage)-(rowSize-1);
			int end=rowSize*curpage;
			Map map=new HashMap();
			map.put("start", start);
			map.put("end", end);
			List<BoardVO> list=BoardDAO.boardListData(map);
			// 총페이지 
			int count=BoardDAO.boardRowCount();
			int totalpage=(int)(Math.ceil(count/10.0));
			count=count-((rowSize*curpage)-rowSize); // 페이지가 뒤로 가면 10씩 빼기 
			request.setAttribute("list", list);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("count", count);
			// Controller에서 JSP로 전송 => request 
			return "list.jsp";
		}
	// 메소드 => controller => 모든 메소드에 매개변수 request, response
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request, HttpServletResponse response) {
		
		return "insert.jsp";
	}
	@RequestMapping("board/insert_ok.do")
	public String board_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
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
		
		// DAO 연동
		BoardDAO.boardInsert(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping("board/detail.do") //Annotation => if 추가하는 과정 => 기능은 없다 / 찾기 가능 (메소드, 클래스, 멤버변수, 매개변수, 생성자)
	// Annotation (RequestMapping) => 모든 명칭을 자유롭게 사용 가능하다 
	public String board_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		return "detail.jsp"; // forward 기법 (request) // 초기화 하고 화면만 바뀌어주는 것이 sendRedirect 
	}
	
	@RequestMapping("board/delete.do")
	public void board_delete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		boolean bCheck=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
		String result="";
		if(bCheck==true) {
			result="yes";
		}else {
			result="no";
		}
		
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@RequestMapping("board/update.do")
	public String board_update(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		BoardVO vo=BoardDAO.boardUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		return "update.jsp";
	}
	@RequestMapping("board/update_ok.do")
	public void board_update_ok(HttpServletRequest request, HttpServletResponse response) {
		// void => 화면 이동이 없다 => javascript에서 처리 : Spring 
		
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
		
		// 데이터베이스 연동
		boolean bCheck=BoardDAO.boardUpdate(vo);
		// 자바 스크립트에 데이터 전송 => yes/no
		String result="";
		if(bCheck==true) {
			result="yes";
		}else {
			result="no";
		}
		
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
