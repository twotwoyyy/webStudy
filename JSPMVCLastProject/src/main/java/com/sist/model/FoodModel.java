package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.service.*;
public class FoodModel {
	@RequestMapping("food/food_list.do")
	public String foodListData(HttpServletRequest request, HttpServletResponse response) {
		String msg="맛집 목록";
		request.setAttribute("msg", msg);
		return "food_list.jsp";
	}
	@RequestMapping("food/food_detail.do")
	public String foodDetailData(HttpServletRequest request, HttpServletResponse response) {
		String msg="맛집 상세보기";
		request.setAttribute("msg", msg);
		return "food_detail.jsp";
	}
}
