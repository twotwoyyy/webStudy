package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

public class BoardListModel implements Model{
	   public String execute (HttpServletRequest request)
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
		   return "list.jsp";
	   }
}
