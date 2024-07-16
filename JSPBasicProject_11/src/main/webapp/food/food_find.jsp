<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*" %>
<%
/*
http://localhost/HTMLCSSProject_10/food/food_find.jsp
 => addr==null
http://localhost/HTMLCSSProject_10/food/food_find.jsp?addr=
 => addr=""
*/
	request.setCharacterEncoding("UTF-8"); //reauest.getParameter() 전에 설정 한글 변환 코드 
    String addr = request.getParameter("addr"); 
    if (addr == null || addr.equals(""))
        addr = "마포";
    String strPage = request.getParameter("page");
    if (strPage == null)
        strPage = "1";
    
    int curpage = Integer.parseInt(strPage); // 현재 보여주는 페이지
    
    FoodDAO dao = FoodDAO.newInstance();
    List<FoodVO> list = dao.foodFindData(addr, curpage);
    int totalpage = dao.foodFindTotalPage(addr);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 리스트</title>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
    margin-top: 50px;
}

.row {
    margin: 0px auto;
    width: 960px;
}

.a {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    text-align: center;
}
</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <form method="GET" action="food_find.jsp">
                <input type="text" name="addr" size="20" class="input-sm" value="<%=addr%>"> 
                <input type="submit" value="검색" class="btn-sm btn-danger">
            </form>
        </div>
        <div style="height: 20px"></div>
        <div class="row">
            <%
            for (FoodVO vo : list) {
            %>
            <div class="col-sm-3">
                <a href="#">
                    <div class="thumbnail">
                        <a href="food_detail.jsp?fno=<%=vo.getFno()%>">
                        <img src="<%=vo.getPoster()%>"
                            style="width: 240px; height: 240px;" class="img-rounded">
                        <p class="a"><%=vo.getName()%></p>
                      </a>
                    </div>
                </a>
            </div>
            <%
            }
            %>
        </div>
		<div style="height: 20px"></div>
		<div class="row">
			<div class="text-center">
				<a
					href="food_find.jsp?addr=<%=addr%>&page=<%=curpage > 1 ? curpage - 1 : curpage%>"
					class="btn btn-sm btn-primary">이전</a>
				<%=curpage%>
				page /
				<%=totalpage%>
				pages <a
					href="food_find.jsp?addr=<%=addr%>&page=<%=curpage < totalpage ? curpage + 1 : curpage%>"
					class="btn btn-sm btn-primary">다음</a>
			</div>
		</div>

	</div>
</body>
</html>
