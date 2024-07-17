<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 960px;
}
.a{
	white-space:nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
	<body>
		<div class="container">
			<div class="row">
				<a href="cart_list.jsp" class="btn btn-sm btn-danger">장바구니 목록</a>
			</div>
			<div style="height: 20px"></div>
			<div class="row">
				<% for(GoodsVO vo:list){ %>
					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="<%=vo.getPoster() %>" style="width:240px; height:200px">
							<p class="a"><%=vo.getName() %></p>
							<p>
								<form method="post" action="cart_insert.jsp">
								수량: <select class="input-sm" name="account">
									 <% for(int i=1;i<=10;i++){ %>
									 	<option value="<%=i %>"><%= i+"개" %></option>
									 <%} %>
									</select>
									<input type=hidden name="poster" value="<%=vo.getPoster() %>">
									<input type=hidden name="name" value="<%=vo.getName() %>">
									<input type=hidden name="price" value="<%=vo.getPrice() %>">
									<input type=hidden name="no" value="<%=vo.getNo() %>">
									<button class="btn-sm btn-primary">장바구니</button>
								</form>
							</p>
						</div>
					</div>
				<% } %>
			</div>
			<div style="height: 20px"></div>
			<div class="row">
				<div class="text-center">
					<ul class="pagination">
						<% if(startPage>1){ %>
							<li><a href="goods_list.jsp?page=<%=startPage-1%>">&laquo;</a></li>
								<% } for(int i=startPage;i<=endPage;i++){ %>
								<li class="<%= i==curpage?"active":""%>"><a href="goods_list.jsp?page=<%=i%>"><%=i %></a></li>
								<% } if(endPage<totalpage){%>
							<li><a href="goods_list.jsp?page=<%=endPage+1%>">&raquo;</a></li>
						<% } %>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>