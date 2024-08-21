package com.sist.model;
import com.sist.vo.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class CartModel {
	@RequestMapping("goods/cart_insert.do")
	public String cart_insert(HttpServletRequest request, HttpServletResponse response) {
		
		String gno=request.getParameter("gno");
		String type=request.getParameter("type");
		String price=request.getParameter("price");
		String account=request.getParameter("account");
		System.out.println("gno="+gno);
		System.out.println("type="+type);
		System.out.println("price="+price);
		System.out.println("account="+account);
		return "redirect:../mypage/mypage_cart.do";
	}
}
