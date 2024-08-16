package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
public class MypageModel {
	@RequestMapping("mypage/mypage_main.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp" );
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		CommonsModel.footerPrint(request);
		
		return "../main/main.jsp";
	}
	@RequestMapping("member/join_update.do")
	public String mypage_join_update(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		MemberVO vo=MemberDAO.memberUpdateData(id);
		String phone=vo.getPhone();
		phone=phone.substring(phone.indexOf(")")+1);
		vo.setPhone(phone);
		request.setAttribute("vo", vo);
		request.setAttribute("title", "회원 수정");
		request.setAttribute("mypage_jsp", "../member/join_update.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	@RequestMapping("member/join_update_ok.do")
	public String mypage_join_update_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String birthday=request.getParameter("birthday");
		String post=request.getParameter("post");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String email=request.getParameter("email");
		String content=request.getParameter("content");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setSex(sex);
		vo.setEmail(email);
		vo.setBirthday(birthday);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setContent(content);
		vo.setPhone(phone1+")"+phone2);
		
		boolean bCheck=MemberDAO.memberUpdate(vo);
		request.setAttribute("result", bCheck);
		
		return "../member/join_update_ok.jsp";
	}
	
}
