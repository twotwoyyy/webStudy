package com.sist.model;
import java.util.*;
import java.io.PrintWriter;
import java.text.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.ReserveVO;

public class ReserveModel {
	@RequestMapping("reserve/reserve_main.do") //if와 동일한 역할
	public String reserve_main(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../reserve/reserve_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/date_info.do")
	public String date_info(HttpServletRequest request, HttpServletResponse response) {
		
		String strYear=request.getParameter("year");
		String strMonth=request.getParameter("month");
		String strDay="";
		String strFno=request.getParameter("fno");
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		String today=sdf.format(date);
		StringTokenizer st=new StringTokenizer(today,"-");
		String sy=st.nextToken();
		String sm=st.nextToken();
		strDay=st.nextToken();
		
		//////////////////////////오늘 날짜만 저장
		String tday=strDay;
		String tyear=sy;
		String tmonth=sm;
		//////////////////////
		
		if(strYear==null) {
			strYear=sy;
		}
		if(strMonth==null) {
			strMonth=sm;
		}
		
		int year=Integer.parseInt(strYear);
		int month=Integer.parseInt(strMonth);
		int day=Integer.parseInt(strDay);
		
		//요일 구하기, 마지막 날 구하기
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONDAY, month-1); // 0부터 시작하기에
		cal.set(Calendar.DATE, 1);
		
		int week=cal.get(Calendar.DAY_OF_WEEK); // 요일
		week=week-1;
		int lastday=cal.getActualMaximum(Calendar.DATE); // 마지막 날
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday);
		request.setAttribute("fno", strFno);
		
		// 예약 가능한 날짜 
		 if(strFno!=null){
	        String rdays=FoodDAO.foodReserveDayData(Integer.parseInt(strFno));
	        st=new StringTokenizer(rdays,",");
	        int[] reserveDays=new int[32];
	        if(month==Integer.parseInt(tmonth) && year==Integer.parseInt(tyear)){
	           st=new StringTokenizer(rdays,",");
	           while(st.hasMoreTokens()) {
	              int d=Integer.parseInt(st.nextToken());
	              if(d>=day){
	                 reserveDays[d]=1;
	              }              
	           }
	        }else {
	           st=new StringTokenizer(rdays,",");
	           while(st.hasMoreTokens()) {
	              int d=Integer.parseInt(st.nextToken());
	              reserveDays[d]=1;
	           }
	        }
	        request.setAttribute("rday", reserveDays);
	     }

		String[] weeks= {"일","월","화","수","목","금","토"};
		request.setAttribute("weeks", weeks);
		return "../reserve/date_info.jsp";
	}
	
	@RequestMapping("reserve/food_info.do")
	public String reserve_food_type(HttpServletRequest request, HttpServletResponse response) {
		String type=request.getParameter("type");
		if(type==null)
			type="한식";
		List<FoodVO> list=FoodDAO.foodTypeAllData(type);
		request.setAttribute("fList", list);
		return "../reserve/food_info.jsp";
	}
	
	@RequestMapping("reserve/time_info.do")
	public String reserve_time_info(HttpServletRequest request, HttpServletResponse response) {
		String day=request.getParameter("day");
		// 데이터베이스 연동
		String times=FoodDAO.foodReserveTimeData(Integer.parseInt(day));
		List<String> tList=new ArrayList<String>();
		StringTokenizer st=new StringTokenizer(times,",");
		while(st.hasMoreTokens()) {
			String time=FoodDAO.foodTimeSelectData(Integer.parseInt(st.nextToken()));
			tList.add(time);
		}
		request.setAttribute("tList", tList);
		return "../reserve/time_info.jsp";
	}
	
	@RequestMapping("reserve/inwon_info.do")
	public String reserve_inwon_info(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "../reserve/inwon_info.jsp";
	}
	
	@RequestMapping("mypage/mypage_reserve.do")
	public String mypage_reserve(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		List<ReserveVO> list=FoodDAO.reserveMyPageData(id);
		request.setAttribute("recvList", list);
		request.setAttribute("mypage_jsp", "../mypage/mypage_reserve.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/reserve_ok.do")
	public String reserve_ok(HttpServletRequest request, HttpServletResponse response) {
		
		// 예약 정보 출력 
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String fno=request.getParameter("fno");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		String inwon=request.getParameter("inwon");
		System.out.println("맛집번호:"+fno);
		System.out.println("예약일:"+date);
		System.out.println("예약시간:"+time);
		System.out.println("예약인원:"+inwon);
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		ReserveVO vo=new ReserveVO();
		vo.setFno(Integer.parseInt(fno));
		vo.setId(id);
		vo.setInwon(inwon);
		vo.setTime(time);
		vo.setDay(date);
		
		FoodDAO.reserveInsert(vo);
		//request.setAttribute("main_jsp","../mypage/mypage_main.jsp");
		return "redirect:../mypage/mypage_reserve.do";
	}
	
	@RequestMapping("adminpage/admin_reserve.do")
	public String admin_reserve(HttpServletRequest request, HttpServletResponse response) {
		List<ReserveVO> recvList=FoodDAO.reserveAdminPageData();
		request.setAttribute("recvList", recvList);
		request.setAttribute("admin_jsp", "../adminpage/admin_reserve.jsp");
		request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/admin_reserve_ok.do")
	public String admin_reserve_ok(HttpServletRequest request, HttpServletResponse response) {
		
		String rno=request.getParameter("rno");
		// 데이터 베이스 연동 => 모든 데이터가 오라클에 존재 
		FoodDAO.reserveOK(Integer.parseInt(rno));
		return "redirect:../adminpage/admin_reserve.do";
	}
	
	@RequestMapping("mypage/mypage_reserve_cancel.do")
	public String mupage_reserve_cancel(HttpServletRequest request, HttpServletResponse response) {
		
		String rno=request.getParameter("rno");
		// 데이터베이스 연동 => 삭제 
		FoodDAO.reserveCancel(Integer.parseInt(rno));
		return "redirect:../mypage/mypage_reserve.do";
	}
	
	@RequestMapping("mypage/mypage_reserve_info.do")
	public void mupage_reserve_info(HttpServletRequest request, HttpServletResponse response) {
		
		String rno=request.getParameter("rno");
		// 데이터베이스 연동 => 삭제 
		/*
		 * rno,day,pr.time,inwon,pf.name,pf.poster,pf.address,phone,theme,score,content,
				       TO_CHAR(regdate,'YYYY-MM-DD HH:24:MI:SS') as dbday
		 */
		ReserveVO vo=FoodDAO.mypageReserveInfoData(Integer.parseInt(rno));
		// {rno:1..} => JSON:JavaScript Object Notation
		// 자바 = 자바스크립트 호환 => RestFul
		JSONObject obj=new JSONObject();
		obj.put("rno", vo.getRno());
		obj.put("day", vo.getDay());
		obj.put("time", vo.getTime());
		obj.put("inwon", vo.getInwon());
		obj.put("name", vo.getFvo().getName());
		obj.put("poster", "http://www.menupan.com"+vo.getFvo().getPoster());
		obj.put("theme", vo.getFvo().getTheme());
		obj.put("phone", vo.getFvo().getPhone());
		obj.put("address", vo.getFvo().getAddress());
		obj.put("score", vo.getFvo().getScore());
		obj.put("content", vo.getFvo().getContent());
		obj.put("regdate", vo.getDbday());
		
		
		// ajax로 값을 전송
		try {
			response.setContentType("text/plain;charset=UTF-8");
			// => text/html, text/xml, text/plain(JSON)
			PrintWriter out=response.getWriter();
			out.write(obj.toString());
		}catch(Exception ex) {}
	}
	
}
