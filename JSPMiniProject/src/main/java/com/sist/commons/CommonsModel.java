package com.sist.commons;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;
import com.sist.vo.FoodVO;
public class CommonsModel {
	public static void commonsData(HttpServletRequest request) {
		FoodDAO fDao=FoodDAO.newInstance();
		List<FoodVO> foodList=fDao.foodFooterData();
		request.setAttribute("foodList", foodList);
	}
}
