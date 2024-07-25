package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;
// 맛집과 관련된 모든 기능을 처리하는 클래스 
public class FoodModel {
	private String[] guList = { "전체", "강서구", "양천구", "구로구", "마포구", "영등포구", "금천구",
			"은평구", "서대문구", "동작구", "관악구", "종로구", "중구", "용산구", "서초구", "강북구",
			"성북구", "도봉구", "동대문구", "성동구", "강남구", "노원구", "중랑구", "광진구", "송파구",
			"강동구" };
	// 1. 목록 출력
	@RequestMapping("food/list.do") // 밑에 있는 클래스, 변수, 메소드를 찾아주는 역할 
	public String food_list(HttpServletRequest request, HttpServletResponse response) {
		// 요청을 받는 경우 : request
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		FoodDAO dao=FoodDAO.newInstance();
		List<FoodVO> list=dao.foodListData(curpage);
		int totalpage=dao.foodTotalPage();
		// 응답 : response 
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage; 
		
		// JSP에서 출력에 필요한 데이터를 전송 
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// include되는 파일을 전송 
		request.setAttribute("main_jsp", "../food/list.jsp");
		CommonsModel.commonsData(request);
		return "../main/main.jsp"; // jsp 파일 지정 => include가 된 경우 : main.jsp로 이동 
	}
	@RequestMapping("food/before_detail.do")
	public String food_before_detail(HttpServletRequest request,HttpServletResponse response) {
		String fno=request.getParameter("fno");
		// 1. Cookie 생성 
		Cookie cookie=new Cookie("food_"+fno,fno);
		// 키가 중복되면 덮어쓴다 => Map 방식
		// 쿠키의 단점 => 보안 취약, 문자열만 저장이 가능 
		// 2. Cookie 저장 기간
		cookie.setMaxAge(60*60*24);
		// 3. Cookie 저장 위치
		cookie.setPath("/");
		// 4. response를 이용해서 브라우저로 전송
		response.addCookie(cookie);
		return "redirect:../food/detail.do?fno="+fno;
	}
	
	   @RequestMapping("food/detail.do")
	   public String food_detail(HttpServletRequest request,HttpServletResponse response)
	   {
		   // food/detail.do?fno=1
		   // 사용자가 보내준 요청값을 받는다 
		   String fno=request.getParameter("fno");
		   FoodDAO dao=FoodDAO.newInstance();
		   // Spring => 자체가 싱글턴 
		   FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
		   request.setAttribute("vo", vo);
		   // 명소 전송  서울 관악구 서원동 1637-8 호림빌딩 2층, 3층
		   String addr=vo.getAddress();
		   addr=addr.substring(addr.indexOf(" "));
		   System.out.println(addr);
		   String addr2=addr.trim();
		   addr2=addr2.substring(0,addr2.indexOf(" "));
		   System.out.println(addr2);
		   List<FoodVO> sList=dao.foodLoactionData(addr2);
		   request.setAttribute("addr", addr2);
		   request.setAttribute("sList", sList);
		   request.setAttribute("main_jsp", "../food/detail.jsp");
		   CommonsModel.commonsData(request);
		   return "../main/main.jsp";
	   }
	// 2. 맛집 검색
	   @RequestMapping("food/find.do")
	   public String food_find(HttpServletRequest request, HttpServletResponse response) {
		   String gu=request.getParameter("gu");
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   if(gu==null)
			   gu="4";
			int curpage=Integer.parseInt(page);
			FoodDAO dao=FoodDAO.newInstance();
			List<FoodVO> list=dao.foodFindData(curpage, guList[Integer.parseInt(gu)]);
			int totalpage=dao.foodFindTotalPage(guList[Integer.parseInt(gu)]);
			// 응답 : response 
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			
			if(endPage>totalpage)
				endPage=totalpage; 
			int count=dao.foodFindCount(guList[Integer.parseInt(gu)]);
			request.setAttribute("list", list);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("gu", gu);
			request.setAttribute("fd", guList[Integer.parseInt(gu)]);
			request.setAttribute("count", count);
			
			
		    request.setAttribute("main_jsp", "../food/find.jsp");
		    CommonsModel.commonsData(request);
		   return "../main/main.jsp";
	   }
	// 3. 맛집 예약
	// 4. 맛집 추천 

}
