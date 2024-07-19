package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;

public class GoodsModel {
	public void goodsListData(HttpServletRequest request) {
		// 1. 사용자가 요청한 값을 받는다
		String strPage=request.getParameter("page");
		if(strPage==null){
			strPage="1"; // default page
		}
		int curpage=Integer.parseInt(strPage); // 현재 페이지
		GoodsDAO dao=GoodsDAO.newInstance();
		List<GoodsVO> list=dao.goodsListData(curpage);
		int totalpage=dao.goodsTotalPage();
		
		// BLOCK별 처리
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1; // 1~10 => 1 11~20 => 11
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 1~10 => 10 11~20 => 20 
		
		if(endPage>totalpage){
			endPage=totalpage;
		}
		// JSP에 출력할 데이터 전송
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
	}
}
