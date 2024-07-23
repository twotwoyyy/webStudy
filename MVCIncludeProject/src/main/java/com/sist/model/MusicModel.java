package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.MusicDAO;
import com.sist.dao.MusicVO;

public class MusicModel {
	@RequestMapping("music/list.do")
	public String music_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		MusicDAO dao=MusicDAO.newInstance();
		List<MusicVO> list=dao.musicListData(curpage);
		int totalpage=dao.musicTotalPage();
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../music/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("music/detail.do")
	public String music_detail(HttpServletRequest request, HttpServletResponse response) {
		String mno=request.getParameter("mno");
		MusicDAO dao=MusicDAO.newInstance();
		MusicVO vo=dao.musicDetailData(Integer.parseInt(mno));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../music/detail.jsp");
		return "../main/main.jsp";
	}
}
