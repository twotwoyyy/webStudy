package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class AllJjimModel {
	@RequestMapping("all_jjim/insert.do")
	public void all_jjim_insert(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		String type=request.getParameter("type");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("cno", cno);
		map.put("type", type);
		map.put("id", id);
		String result="";
		try {
			AllJjimDAO.allJjimInsert(map);
			AllJjimDAO.JjimCountIncrement(map);
			result="OK";
		}catch(Exception ex) {
			result=ex.getMessage();
		}
		
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}	
	}
}
