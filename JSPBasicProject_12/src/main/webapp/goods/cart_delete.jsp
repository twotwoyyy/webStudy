<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
	List<CartVO> list=(List<CartVO>)session.getAttribute("cart");
	String id=(String)session.getAttribute("id");
	
	for(int i=0;i<list.size();i++){
		CartVO vo=list.get(i);
		if(id.equals(vo.getId()) && vo.getNo()==Integer.parseInt(no)){
			list.remove(i);
			break;
		}
	}
	
	session.setAttribute("cart", list);
	response.sendRedirect("cart_list.jsp");
%>