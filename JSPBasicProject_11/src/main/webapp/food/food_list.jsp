<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    /*
        1. 웹 출력 
           => 데이터를 가지고 온다 : 오라클 (자바)
                               SQL  JDBC 
        2. 데이터를 HTML 출력 
    */
    String type=request.getParameter("type");
    if(type==null)
       type="1";
    String strPage=request.getParameter("page");
    if(strPage==null)
       strPage="1";
    
    int curpage=Integer.parseInt(strPage);
    
    FoodDAO dao=FoodDAO.newInstance();
    List<FoodVO> list=dao.foodListData(Integer.parseInt(type), curpage);
    int totalpage=dao.foodListTotalPage(Integer.parseInt(type));
    
    // 블럭별 페이지 나누기 
    /*
       이동 페이지 => 10
       현재페이지 => 1~10     1
                 11~20     11
    */
    final int BLOCK=10;
    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
    /*
                   =================
                   curpage = 10  ==> 1
    */
    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
    // JSP => _jspService(){}
    if(endPage>totalpage)
       endPage=totalpage;
    
   Cookie[] cookies=request.getCookies();
   List<FoodVO> fList=new ArrayList<FoodVO>();
   if(cookies!=null){
      // 가장 최신에 등록된 쿠키 데이터 읽기 
      for(int i=cookies.length-1;i>=0;i--){
         if(cookies[i].getName().startsWith("food_")){
            String fno=cookies[i].getValue();
            FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
            fList.add(vo);
         }
      }
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
   .container{
      margin-top:50px;
   }
   .row{
      width: 960px;
      margin:0px auto;
   }
   .a{
       overflow: hidden;
       text-overflow: ellipsis;
   }
</style>
</head>
<body>
  <div class="container">
   <div class="row">
    <div class="text-center">
      <%-- Ajax : JSON --%>
      <a href="food_list.jsp?type=1" class="btn btn-lg btn-success">한식</a>
      <a href="food_list.jsp?type=2" class="btn btn-lg btn-info">중식</a>
      <a href="food_list.jsp?type=3" class="btn btn-lg btn-warning">양식</a>
      <a href="food_list.jsp?type=4" class="btn btn-lg btn-primary">일식</a>
    </div>
   </div>
   <div style="height: 20px"></div>
   <div class="row">
      <%-- 이미지 출력 --%>
     <%
        for(FoodVO vo:list)
        {
     %>
         <div class="col-sm-3">
          <div class="thumbnail">
                 <a href="food_detail_before.jsp?fno=<%=vo.getFno()%>">
                  <img src="<%=vo.getPoster() %>" style="width: 240px;height: 240px" class="img-rounded">
                  <p class="a"><%=vo.getName() %></p>
               </a>
           </div>
         </div>
    <%
        }
    %>
   </div>
   <div class="row">
      <div class="text-center">
        <ul class="pagination">
          <%
             if(startPage>1) //  1   11   21   31  41
             {
          %>
                <li><a href="food_list.jsp?type=<%=type%>&page=<%=startPage-1%>">&lt;</a></li>
          <%
             }
             for(int i=startPage;i<=endPage;i++)
             {
          %>
                <li class="<%= i==curpage?"active":""%>"><a href="food_list.jsp?type=<%=type%>&page=<%=i%>"><%=i %></a></li>
          <%
             }
             if(endPage<totalpage) // 10  20  30  40  50 
             {
          %>
               <li><a href="food_list.jsp?type=<%=type%>&page=<%=endPage+1%>">&gt;</a></li>
          <%
             }
          %>
        </ul>
      </div>
   </div>
   <div style="height:20px"></div>
   <div class="row">
      <h3>최신 방문 맛집</h3>
      <hr>
      <a href="all_delete.jsp" class="btn btn-sm btn-success">전체 삭제</a>
      <a href="#" class="btn btn-sm btn-info">전체 보기</a>
      <hr>
      <%
         int i=0;
         for(FoodVO vo:fList){
            if(i>8) break;
      %>
         <figure style="float:left; margin-left:5px">
            <img src="<%=vo.getPoster() %>" style="width:100px;height:100px" class="img-rounded">
            <figcaption style="margin: 5px 30px">  
               <a href="delete.jsp?fno=<%=vo.getFno() %>" class="btn btn-xs btn-danger">삭제</a>
            </figcaption>
         </figure>
      <%
            i++;
         }
      %>
      </div>
   </div>
</body>
</html>