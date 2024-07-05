<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    String fd=request.getParameter("fd");
    String ss=request.getParameter("ss");
    BoardDAO dao=BoardDAO.newInstance();
    int count=dao.boardFindCount(fd, ss);
    List<BoardVO> list=dao.boardFindData(fd, ss);
     
    String strPage=request.getParameter("page");
    if(strPage==null)
        strPage="1";
    int curpage=Integer.parseInt(strPage); // 현재 보여주는 페이지 번호
    // 가지고 온 데이터를 화면에 출력 
    List<BoardVO> Findlist=dao.boardListData(curpage);
    int totalpage = (count == 0) ? 1 : (int)(Math.ceil(count / 10.0)); // totalpage 계산 수정

    count = count - ((curpage * 10) - 10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
    margin-top:30px;
}
.row{
    margin:0px auto;
    width:800px;
}
h3{
    text-align: center;
}
</style>
</head>
<body>
    <div class="container">
        <h3>검색 결과</h3>
        <div class="row">
        <% 
            if(count==0){
        %>
            <table class="table">
                <tr>
                    <td>
                        <h3 style="color:red">검색 결과가 없습니다</h3>
                    </td>
                </tr>
            </table>
        <%
            }
            else
            {
        %>
            <table class="table table-striped">
                <tr>
                    <th width="10%" class="text-center">번호</th>
                    <th width="45%" class="text-center">제목</th>
                    <th width="15%" class="text-center">이름</th>
                    <th width="20%" class="text-center">작성일</th>
                    <th width="10%" class="text-center">조회수</th>
                </tr>
                <%
                    for(BoardVO vo:list){
                        
                %>
                <tr>
                    <td width="10%" class="text-center"><%=count-- %></td>
                    <td width="45%"><a href="board_detail.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
                        <%
                            String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                            if(today.equals(vo.getDb_day())){
                        %>
                            &nbsp;<sup style="color:red">new</sup>
                        <%
                            }
                        %>
                    </td>
                    <td width="15%" class="text-center"><%=vo.getName() %></td>
                    <td width="20%" class="text-center"><%=vo.getDb_day() %></td>
                    <td width="10%" class="text-center"><%=vo.getHit() %></td>
                </tr>
                <%
                    }
                %>
            </table>
        <% } %>
        <table class="table">
            <tr>
                <td class="text-left">
                    <form method="post" action="board_find.jsp">
                        <select class="input-sm" name="fd">
                            <option value="name">이름</option>
                            <option value="subject">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" size=15 class="input-sm" name="ss" required>
                        <input type="submit" value="검색" class="btn-sm btn-success">
                    </form>
                </td>
                <td class="text-right">
                    <%-- 이전 페이지 링크 --%>
                    <c:if test="${curpage > 1}">
                        <a href="board_list.jsp?page=<%= curpage - 1 %>" class="btn-sm btn-primary">이전</a>
                    </c:if>
                    <%= curpage %> page / <%= totalpage %> pages
                    <%-- 다음 페이지 링크 --%>
                    <c:if test="${curpage < totalpage}">
                        <a href="board_list.jsp?page=<%= curpage + 1 %>" class="btn-sm btn-primary">다음</a>
                    </c:if>
                </td>
            </tr>
        </table>
        </div>
    </div>
</body>
</html>
