package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;
import com.sist.vo.*;

import java.util.*;

public class FoodModel {
	public String foodListData(HttpServletRequest request) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		FoodDAO dao=FoodDAO.newInstance();
		List<FoodVO> list=dao.foodListData(curpage);
		int totalpage=dao.foodTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		
		return "food_list.jsp";
	}
	
	public String foodDetailData(HttpServletRequest request) {
		request.setAttribute("msg", "상세보기 출력");
		return "food_detail.jsp";
	}
}
