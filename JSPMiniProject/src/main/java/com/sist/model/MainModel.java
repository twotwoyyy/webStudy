package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.controller.*;
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request, HttpServletResponse response) {
		FoodDAO fDao=FoodDAO.newInstance();
		List<FoodVO> fList=fDao.foodTop12();
		
		SeoulDAO sDao=SeoulDAO.newInstance();
		List<LocationVO> sList=sDao.SeoulTop12();
		
		GoodsDAO gDao=GoodsDAO.newInstance();
		List<GoodsVO> gList=gDao.goodsTop12();
		
		request.setAttribute("gList", gList);
		request.setAttribute("fList", fList);
		request.setAttribute("sList", sList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
