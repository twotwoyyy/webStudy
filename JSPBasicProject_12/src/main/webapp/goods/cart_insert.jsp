<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	// session => List
	List<CartVO> list=(List<CartVO>)session.getAttribute("cart");
	if(list==null)
		list=new ArrayList<CartVO>();
	
	String id=(String)session.getAttribute("id");
	
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String poster=request.getParameter("poster");
	String no=request.getParameter("no");
	String price=request.getParameter("price");
	String account=request.getParameter("account");
	
	CartVO vo=new CartVO();
	vo.setName(name);
	vo.setPoster(poster);
	vo.setPrice(price);
	vo.setId(id);
	vo.setNo(Integer.parseInt(no));
	vo.setAccount(Integer.parseInt(account));
	
	boolean bCheck=false; // 세션 연결
	
	for(CartVO cvo:list){
		if(cvo.getNo()==vo.getNo() && id.equals(cvo.getId())){ // 같은 상품인지 확인 			
			int acc=cvo.getAccount()+vo.getAccount();
			cvo.setAccount(acc); // 수량 증가 
			bCheck=true;
			break;
		}
	}
	if(bCheck==false){
		list.add(vo);
		session.setAttribute("cart", list);
	}
	
	// 이동
	response.sendRedirect("cart_list.jsp");
%>