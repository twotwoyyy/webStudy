<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
request.setCharacterEncoding("UTF-8"); //reauest.getParameter() 전에 설정 한글 변환 코드 
String name = request.getParameter("name"); 


String type=request.getParameter("type");
if(type==null)
	type="1";
String strPage = request.getParameter("page");
if (strPage == null)
    strPage = "1";
int curpage;
try {
    curpage = Integer.parseInt(strPage);
} catch (NumberFormatException e) {
    curpage = 1; // 예외 발생 시 기본값으로 설정
}

goodsDAO dao=goodsDAO.newInstance();
List<goodsVO> list=dao.goodsListData(Integer.parseInt(type), curpage);
int totalpage=dao.goodsListTotalPage(Integer.parseInt(type));


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
<title>상품 홈페이지</title>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
    margin-top: 20px;
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
.col-sm-3{
	width: 300px;
}
p{
   font-size: 14px;
   color : black;
   font-weight: bold;
}
</style>
</head>
<body>
    <div class="container">
            <div class="row">
            <form method="GET" action="goods_list.jsp">
                <input type="text" name="name" size="20" class="input-sm" value="<%=name%>"> 
                <input type="submit" value="검색" class="btn-sm btn-danger">
            </form>
        </div>
        <div class="row">
        <div class="text-right">
        <a href="goods_list.jsp?type=1" class="btn btn-sm btn-success">전체</a>
        <a href="goods_list.jsp?type=2" class="btn btn-sm btn-info">베스트</a>
        <a href="goods_list.jsp?type=3" class="btn btn-sm btn-warning">신상</a>
        <a href="goods_list.jsp?type=4" class="btn btn-sm btn-primary">핫딜</a>
        </div>
        </div>
        <div style="height:20px"></div>
        <div class="row">
        <%
          for(goodsVO vo:list){
        %>
        <div class="col-sm-3">
         <a href="#">
          <div class="thumbnail">
            <<a href="goods_detail.jsp?type=<%= type %>&no=<%= vo.getNo() %>">
            <img src="<%=vo.getPoster() %>" style="width: 250px; height: 240px;" class="img-rounded">
            <p class="a"><%=vo.getName() %></p>
           </a>
          </div>
         </a>
        </div>
        <%
          }
        %>
        </div>
        <div style="height:20px"></div>
        <div class="row">
          <div class="text-center">
            <ul class="pagination">
            <%
              if(startPage>1){
            %>
             <li><a href="goods_list.jsp?type=<%=type%>&page=<%=startPage-1%>">&lt;</a></li>
             <%
              }
               for(int i=startPage;i<=endPage;i++){
             %>
             <li class="<%= i==curpage?"active":"" %>"><a href="goods_list.jsp?type=<%=type%>&page=<%=i%>"><%=i%></a></li>
             <%
               }
               if(endPage<totalpage){
             %>
              <li><a href="goods_list.jsp?type=<%=type%>&page=<%=endPage+1%>">&gt;</a></li>
              <%
               }
              %>
              </ul>
             </div>
          </div>
        </div>
        </body>
        </html>