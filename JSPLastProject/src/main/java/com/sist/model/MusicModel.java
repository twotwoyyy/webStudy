package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class MusicModel {
	@RequestMapping("music/list.do")
	public String music_list(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String column=request.getParameter("column");
		String ss=request.getParameter("ss");
		List<MusicVO> list=new ArrayList<MusicVO>();
		// list.do => null
		// list.do?ss ==> ""
		// list.do?ss=aaa ==> aaa 
		if(ss==null || ss.equals("")) {
			list=MusicDAO.musicListData();
		}else {
			Map map=new HashMap();
			map.put("column", column);
			map.put("ss", ss);
			list=MusicDAO.musicFindData(map);
		}
		request.setAttribute("list", list);
		return "list.jsp";
	}
	@RequestMapping("music/detail.do")
	public void music_detail(HttpServletRequest request, HttpServletResponse response) {
		String mno=request.getParameter("mno");
		// 데이터베이스 전송
		String poster=MusicDAO.musicDetailData(Integer.parseInt(mno));
		// Ajax로 값 전송
		try {
			PrintWriter out=response.getWriter(); // 브라우저로 전송
			out.write(poster);
		}catch(Exception ex) {}
	}
}
