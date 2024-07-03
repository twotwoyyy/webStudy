<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
/*
   1. 사용자로부터 요청값 받기 => request.getParameter()
                           ----------------------
                           사용자가 보내준 값을 받을때
   2. 요청값을 이용해서 오라클 연결 
   3. 해당 데이터를 읽어오기 시작 
   4. 읽어온 데이터를 HTML을 이용해서 브라우저에 출력 
   ### JSP파일은 컴파일이 되면 자동으로 자바는 사라지고 HTML 메모리 출력이 된다 
*/
//오라클에서 데이터를 읽어오기
FoodDAO dao = FoodDAO.newInstance();
//사용자가 페이지 요청
// 요청한 페이지 받기
String strPage=request.getParameter("page");
if(strPage==null)
	// 처음 실행 화면
	strPage="1";
int curpage=Integer.parseInt(strPage);
List<FoodVO> list = dao.foodListData(curpage);

for(FoodVO vo:list)
{
	String img = vo.getPoster();
	img = img.replace("https", "http");
	vo.setPoster(img);
}

int totalpage = dao.foodTotalPage(); // 총페이지

//페이지 처리
final int BLOCK = 10;
int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
//                10-1    / 10*10 => 0  1
//                20-1    / 10*10 => 10
int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
if (endPage > totalpage)
	endPage = totalpage;
/*
    < 1 2 3 4 5 6 7 8 9 10 >
      |                  |
   startPage          endPage
    curpage : 현재 페이지 
    1~10 startPage = 1
         endPage = 10
   11~20 startPage = 11
         endPage = 20 
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			for (FoodVO vo : list) {
			%>
			<div class="col-sm-3">
				<div class="thumbnail">
					<!-- 이미지 카드 (이미지+제목)-->
					<a href="food_detail.jsp?fno=<%=vo.getFno()%>"><!--화면 이동: 상세보기--> 
					<img src="<%=vo.getPoster()%>" style="width: 240px; height: 200px"
						class="img-rounded"> <!-- height는 자동설정 -->
						<p class="a"><%=vo.getName()%></p>
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
				<!--가운데 정렬-->
				<ul class="pagination">
					<%
					if (startPage > 1) {
					%>
					<li><a href="food_list.jsp?page=<%=startPage - 1%>">&lt;</a></li>
					<%
					}
					%>
					<%
					for (int i = startPage; i < endPage; i++) {
					%>
					<li class="<%=curpage == i ? "active" : ""%>"><a
						href="food_list.jsp?page=<%=i%>"><%=i%></a></li>
					<%
					}
					%>
					<%
					if (endPage < totalpage) {
					%>
					<li><a href="food_list.jsp?page=<%=endPage + 1%>">&gt;</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>