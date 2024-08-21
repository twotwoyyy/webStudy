package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class GoodsModel {
	private String[] tables={"","goods_all","goods_best","goods_new","goods_special"};
	private String[] titles= {"","전체 상품","베스트 상품","신상품","특가 상품"};
	@RequestMapping("goods/list.do")
	public String goods_list(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		if(cno==null)
			cno="1"; // 참조 NO => tables
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=20;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		map.put("table_name", tables[Integer.parseInt(cno)]);
		map.put("start", start);
		map.put("end", end);
		List<GoodsVO> gList=GoodsDAO.goodsListData(map);
		int totalpage=GoodsDAO.goodsTotalPage(map);
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("gList", gList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("cno", cno);
		request.setAttribute("title", titles[Integer.parseInt(cno)]);
		
		request.setAttribute("main_jsp", "../goods/list.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	@RequestMapping("goods/detail.do")
	public String goods_detail(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno"); 
		String no=request.getParameter("no");
		Map map=new HashMap();
		map.put("no", no);
		map.put("table_name", tables[Integer.parseInt(cno)]);
		GoodsVO vo=GoodsDAO.goodsDetailData(map);
		String price=vo.getGoods_price();
		price=price.replaceAll("[^0-9]", ""); // 구매창
		vo.setPrice(Integer.parseInt(price));
		request.setAttribute("vo", vo);
		request.setAttribute("type", cno);
		request.setAttribute("main_jsp", "../goods/detail.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
}
