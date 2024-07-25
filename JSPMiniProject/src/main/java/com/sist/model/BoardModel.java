package com.sist.model;
/*
 *            HTTP요청 (URL)    웹 컨테이너 (톰캣)
 *	웹 브라우저 =============    ========================================
 *                             Controller
 *                             -----------
 *                             1. 요청을 받는다 getRequestURI()
 *                             2. URI를 이용해서 요청 내용 확인 => list.do, insert.do
 *                             3. 요청에 대한 처리 => Model이 가지고 있는 메소드 호출
 *                             4. 
 *   
 *   1. 브라우저 => URL을 이용해서 서버 연동 (주소창)
 *   2. URL을 이용해서 서버연결이 되면 => Controller (URL을 읽을 수 있는 프로그램 : JSP, Servlet)
 *      => 요청을 받아서 처리 => JSP로 결과값 전송 
 *         =============================== 화면 출력 없이 연결 (Servlet)
 *         JSP : Front-End (결과값을 받아 출력만) 
 *   3. MVC 단점 : Controller 집중적 
 *      --------------------------- MVVM, MVP ...
 *   4. Controller : 역할 (고정) => 소스 수정이 거의 없다
 *                   => 필요한 데이터는 파일을 만들어서 전송
 *                      ==========================
 *                      | XML, Properties
 *                   => 요청 받기
 *                   => Model 클래스 / Model안에 메소드 호출
 *                                   ================= 구분자 (Annotation) => 최종 : Spring 
 *  
 */
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;

import java.io.PrintWriter;
import java.text.*;
public class BoardModel {
	/*
	 *   Spring 
	 *   @Autowired => 자동 메모리 주소 주입 => 싱글턴 (new 사용하지 않는다)
	 *   private BoardDAO dao;
	 * 
	 */
	private BoardDAO dao=BoardDAO.newInstance(); // 전역변수로 
	@RequestMapping("board/list.do")
	public String board_list(HttpServletRequest request, HttpServletResponse response) {
		// page 받기
		String page=request.getParameter("page");
		if(page==null)
			page="1"; // 정수형 변환해야 처리 가능
		int curpage=Integer.parseInt(page);
		List<BoardVO> list=dao.boardListData(curpage);
		/*
		 *  URL
		 *  ===
		 *   list.do =============> null => if(page==null)
		 *   list.do?page= =======> ""   => if(page.equals(""))
		 *   list.do?page=1 ======> "1"  
		 */
		int count=dao.boardRowCount(); // 총 게시물 개수
		int totalpage=(int)(Math.ceil(count/10.0));
		// 총 페이지 
		count=count-((curpage*10)-10);
		// list.jsp로 출력 데이터 전송 
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		// 오늘 날짜 => new 
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd");
		String today=sdf.format(date);
		// new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		request.setAttribute("today",today);
		request.setAttribute("main_jsp", "../board/list.jsp");
		// main.jsp에 include가 되는 파일 지정 
		CommonsModel.commonsData(request);
		return "../main/main.jsp";
	}
	/*
	 *   JSP <a> => Controller => Model => JSP
	 *   MVVM => VueJS
	 *           ===== ReactJS
	 */
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../board/insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/insert_ok.do")
	public String board_insert_ok(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		BoardVO vo=new BoardVO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		// 데이터베이스 연동 => DAO 호출 
		dao.boardInsert(vo);
		return "redirect:../board/list.do"; // sendRedirect => _ok나올 경우
	}
	
	@RequestMapping("board/detail.do")
	public String board_detail(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		// DAO에서 상세보기 값을 얻어온다 
		BoardVO vo=dao.boardDetailDate(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/detail.jsp");
		CommonsModel.commonsData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("board/update.do")
	public String board_update(HttpServletRequest request, HttpServletResponse response) {
		
		String no=request.getParameter("no");
		BoardVO vo=dao.boardUpdateDate(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/update.jsp");
		CommonsModel.commonsData(request);
		return "../main/main.jsp";
		
	}
	@RequestMapping("board/update_ok.do")
	public void board_update_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		BoardVO vo=new BoardVO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		String no=request.getParameter("no");
		vo.setNo(Integer.parseInt(no));
		
		boolean bCheck=dao.boardUpdate(vo);
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			if(bCheck==true) {
				out.write("<script>");
				out.write("location.href=\"../board/detail.do?no="+no+"\"");
				out.write("</script>");
			}else {
				out.write("<script>");
				out.write("alert(\"비밀번호가 틀립니다!!\");");
				out.write("history.back();");
				out.write("</script>");
			}
		}catch(Exception ex) {ex.printStackTrace();}
	}
	
	
    @RequestMapping("board/delete.do")
    public String board_delete(HttpServletRequest request,HttpServletResponse response)
    {
    	request.setAttribute("no", request.getParameter("no"));
    	request.setAttribute("main_jsp", "../board/delete.jsp");
    	CommonsModel.commonsData(request);
    	return "../main/main.jsp";
    }
    @RequestMapping("board/delete_ok.do")
    public void board_delete_ok(HttpServletRequest request,HttpServletResponse response)
    {
    	String no=request.getParameter("no");
    	String pwd=request.getParameter("pwd");
    	
    	// DAO연동 
    	boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
    	// => 이동 
    	try
    	{
    	    // Ajax 처리 
    		response.setContentType("text/html;charset=UTF-8");
    		PrintWriter out=response.getWriter();
    		
	    	if(bCheck==true)// 비밀번호가 맞는 경우
	    	{
	    		out.write("<script>");
	    		out.write("location.href=\"../board/list.do\"");
	    		out.write("</script>");
	    	}
	    	else
	    	{
	    		out.write("<script>");
	    		out.write("alert(\"비밀번호가 틀립니다!!\");");
	    		out.write("history.back();");
	    		out.write("</script>");
	    	}
    	}catch(Exception ex){}
    }
}
