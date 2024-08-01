package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class JoinModel {
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request, HttpServletResponse response) {
		
		return "join.jsp";
	}
	@RequestMapping("member/post.do")
	public String member_post(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("count", 0);
		return "post.jsp";
	}
	@RequestMapping("member/post_ok.do")
	public String member_post_ok(HttpServletRequest request, HttpServletResponse response) {
		try {  
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String dong=request.getParameter("dong");
		List<ZipcodeVO> list=MemberDAO.postFind(dong);
		int count=MemberDAO.postFindCount(dong);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		return "post.jsp";
	}
	@RequestMapping("member/idcheck.do")
	public String member_idcheck(HttpServletRequest request, HttpServletResponse response) {
		return "idcheck.jsp";
	}
	@RequestMapping("member/idcheck_ok.do")
	public void member_idcheck_ok(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		int count=MemberDAO.idCheck(id);
		try {
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		}catch(Exception ex) {}
	}
}
