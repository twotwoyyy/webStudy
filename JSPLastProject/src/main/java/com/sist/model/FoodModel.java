package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class FoodModel {
	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		// 사용자 요청값 받기
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		
		List<FoodVO> fList=FoodDAO.foodListData(map);
		
		int totalpage=FoodDAO.foodTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		request.setAttribute("fList", fList);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		int count=FoodDAO.foodListCount();
		// DB 연동 => 출력할 데이터 전송
		request.setAttribute("count", count);
		request.setAttribute("main_jsp", "../food/list.jsp");
		return "../main/main.jsp";
	}
	// 쿠키
	@RequestMapping("food/detail_before.do")
	public String food_detail_before(HttpServletRequest request,HttpServletResponse response) {
		String fno=request.getParameter("fno");
		String type=request.getParameter("type");
		// 쿠키 
		Cookie cookie=new Cookie("food_"+fno,fno);
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		// 브라우저로 전송
		response.addCookie(cookie);
		return "redirect:../food/detail.do?fno="+fno+"&type="+type;
	}
	// 상세보기
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request,HttpServletResponse response) {
		// 사용자가 보내준 데이터를 받는다 => fno,type(좋아요,찜,댓글)
		String fno=request.getParameter("fno");
		String type=request.getParameter("type");
		// 데이터베이스 연동 
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
		String addr=vo.getAddress();
		String addr1=addr.substring(addr.indexOf(" ")+1); // 서울 종로구 명륜 2가~ 공백 뒤부터 자름
		String addr2=addr1.substring(0,addr1.indexOf(" ")); // 종로구 이후 지우기 
		
		List<FoodVO> nList=FoodDAO.foodNearListData(addr2);
		request.setAttribute("nList", nList);
		request.setAttribute("vo", vo);
		request.setAttribute("type", type);
		/*
		 * 맛집(1) / 레시피(2) / 서울여행(3) / 상품(4) 
		 */
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}
	// 검색
	// _ok.do => redirect (이전에 존재하는 화면 이동)
	// ajax => void : 자체 파일에서 처리 
	// 일반 => main.jsp
	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String ss=request.getParameter("ss");
		if(ss==null)
			ss="마포";
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("ss", ss);
		// 데이터 읽기
		List<FoodVO> fList=FoodDAO.foodFindListData(map);
		// 총페이지 읽기
		int totalpage=FoodDAO.foodFindTotalPage(ss);
		// BLOCK별 처리
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("fList", fList);
		request.setAttribute("ss", ss);
		request.setAttribute("main_jsp", "../food/find.jsp");
		return "../main/main.jsp";
	}
}