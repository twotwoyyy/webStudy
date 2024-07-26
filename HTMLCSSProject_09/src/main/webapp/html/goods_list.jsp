<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
goodsDAO dao = goodsDAO.newInstance();
String strPage = request.getParameter("page");
if (strPage == null)
    strPage = "1";
int curpage;
try {
    curpage = Integer.parseInt(strPage);
} catch (NumberFormatException e) {
    curpage = 1; // 예외 발생 시 기본값으로 설정
}
List<goodsVO> list = dao.goodsListData(curpage);

int totalpage = dao.goodsTotalPage();
final int BLOCK = 10;
int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
if (endPage > totalpage)
    endPage = totalpage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
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
            <%
            for (goodsVO vo : list) {
            %>
            <div class="col-sm-3">
                <div class="thumbnail">
                    <a href="goods_detail.jsp?no=<%=vo.getNo() %>"> <img
                        src="<%=vo.getPoster() %>" style="width: 240px; height: 200px"
                        class="img-rounded">
                        <p class="a"><%= vo.getName() != null ? vo.getName() : "" %></p>
                    </a>
                </div>
            </div>
            <%
            }
            %>
        </div>
        <div style="height: 10px"></div>
        <div class="row">
            <div class="text-center">
                <ul class="pagination">
                    <%
                    if (startPage > 1) {
                    %>
                    <li><a href="goods_list.jsp?page=<%=startPage-1 %>">&lt;</a></li>
                    <%
                    }
                    %>
                    <%
                    for (int i = startPage; i <= endPage; i++) {
                    %>
                    <li class="<%= curpage == i ? "active" : "" %>"><a
                        href="goods_list.jsp?page=<%=i%>"><%= i %></a></li>
                    <%
                    }
                    %>
                    <%
                    if (endPage < totalpage) {
                    %>
                    <li><a href="goods_list.jsp?page=<%=endPage+1 %>">&gt;</a></li>
                    <%
                    }
                    %>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
