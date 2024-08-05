package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class MusicModel {
	@RequestMapping("music/list.do")
	public String music_list(HttpServletRequest request, HttpServletResponse response) {
		List<MusicVO> list=MusicDAO.musicListData();
		request.setAttribute("list", list);
		return "list.jsp";
	}
	
}
