package com.sist.model;
import com.sist.vo.*;

import java.io.PrintWriter;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class CartModel {
	/*
	 * 데이터베이스 : 컬럼명 
	 * 사용자 
	 * = 1. 상세보기 => primary key(no) => detail.do?no=1
	 *      서버 처리
	 *       => INSERT * FROM table_name
	 *          WEHRE no=1
	 *   2. 목록 => page
	 *      => WHERE num BETWEEN 1 AND 10
	 *   3. insert 
	 *      => 데이터 전송 : id, name ... <form>
	 *      
	 */
	@RequestMapping("goods/cart_insert.do")
	public String cart_insert(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");
		//String type=request.getParameter("type");
		String price=request.getParameter("price");
		String account=request.getParameter("account");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println("gno="+gno);
		//System.out.println("type="+type);
		System.out.println("price="+price);
		System.out.println("account="+account);
		// 데이터베이스 연동 
		CartVO vo=new CartVO();
		vo.setGno(Integer.parseInt(gno));
		vo.setAccount(Integer.parseInt(account));
		vo.setPrice(Integer.parseInt(price));
		vo.setId(id);
		
		Map map=new HashMap();
		map.put("gno", gno);
		map.put("id", id);
		int gnoCount=CartDAO.cartGetGnoCount(map);
		
		if(gnoCount==0) {
			CartDAO.cartInsert(vo);
		}else {
			int cno=CartDAO.cartGetGno(map);
			Map map1=new HashMap();
			map1.put("cno", cno);
			map1.put("account", account);
			CartDAO.cartGnoUpdate(map1);
		}
		return "redirect:../mypage/mypage_cart.do";
	}
	
	@RequestMapping("mypage/mypage_cart.do")
	public String mypage_cart(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<CartVO> list=CartDAO.cartListData(id);
		request.setAttribute("cartList", list);
		request.setAttribute("count", list.size());
		request.setAttribute("mypage_jsp", "../mypage/mypage_cart.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("goods/buy_insert.do")
	public void buy_insert(HttpServletRequest request, HttpServletResponse response) {
		String gno=request.getParameter("gno");
		//String type=request.getParameter("type");
		String price=request.getParameter("price");
		String account=request.getParameter("account");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println("gno="+gno);
		//System.out.println("type="+type);
		System.out.println("price="+price);
		System.out.println("account="+account);
		// 데이터베이스 연동 
		CartVO vo=new CartVO();
		vo.setGno(Integer.parseInt(gno));
		vo.setAccount(Integer.parseInt(account));
		vo.setPrice(Integer.parseInt(price));
		vo.setId(id);
		
		CartDAO.buyInsert(vo);
		
		//JSON
		String name=(String)session.getAttribute("name");
		String email=(String)session.getAttribute("email");
		String address=(String)session.getAttribute("address");
		String post=(String)session.getAttribute("post");
		String phone=(String)session.getAttribute("phone");
		
		JSONObject obj=new JSONObject();
		obj.put("name", name);
		obj.put("email", email);
		obj.put("address", address);
		obj.put("post", post);
		obj.put("phone", phone);
		
		PrintWriter out=null;
		try
		{
			out=response.getWriter();
			out.write(obj.toJSONString());
		}catch(Exception ex)
		{
			out.write("FAIL");
		}
		
	}
	@RequestMapping("mypage/mypage_buy.do")
	public String mypage_buy(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<CartVO> list=CartDAO.buyListData(id);
		int total=CartDAO.buyTotalPrice(id);
		request.setAttribute("buyList", list);
		request.setAttribute("count", list.size());
		request.setAttribute("total", total);
		request.setAttribute("mypage_jsp", "../mypage/mypage_buy.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/mypage_cart_cancel.do")
	public String mypage_cart_cancel(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		// db연동 
		CartDAO.cartCancel(Integer.parseInt(cno));
		return "redirect:../mypage/mypage_cart.do";
	}
	
	  @RequestMapping("mypage/mypage_cart_buy.do")
	  public void mypage_cart_buy(HttpServletRequest request,HttpServletResponse response)
	  {
		  String cno=request.getParameter("cno");
		  CartDAO.cartBuyUpdate(Integer.parseInt(cno));
		  HttpSession session=request.getSession();
		  String name=(String)session.getAttribute("name");
		  String email=(String)session.getAttribute("email");
		  String address=(String)session.getAttribute("address");
		  String post=(String)session.getAttribute("post");
		  String phone=(String)session.getAttribute("phone");
		  
		  JSONObject obj=new JSONObject();
		  obj.put("name", name);
		  obj.put("email", email);
		  obj.put("address", address);
		  obj.put("post", post);
		  obj.put("phone", phone);
		  
		  PrintWriter out=null;
		  try
		  {
			  out=response.getWriter();
			  out.write(obj.toJSONString());
		  }catch(Exception ex)
		  {
			  out.write("FAIL");
		  }
	  }
}
