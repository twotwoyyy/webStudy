<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	//출력할 데이터를 가지고 온다
	FoodDAO dao=FoodDAO.newInstance();
	List<FoodVO> list=dao.foodListData();
	//JSP =>Java
/*
      ======================== container
        =================== row
        
        =================== row 
      ========================

*/
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	/*브라우저에 출력되는 HTML영역*/
	margin-top: 50px; /* margin : top right bottom left */
}

.row {
	margin: 0px auto; /*가운데 정렬*/
	width: 960px;
}
tr.infos:hover{
	cursor:pointer;
	background-color: #FC6;
}
.infos img {
    max-width: 30px;
    max-height: 30px;
}
#poster img {
    width: 200px;
    height: 200px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
    $('.infos').click(function(){
        let name = $(this).attr("data-name");
        let poster = $(this).attr("data-poster");
        
        $('#name').text("업체명: " + name);
        $('#poster img').attr("src", poster);
    });
});

</script>
<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <table class="table">
                <tr>
                    <td>
                        <table class="table">
                            <caption>
                                <h3>맛집 정보</h3>
                            </caption>
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>업체명</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (FoodVO vo : list) { %>
                                <tr class="infos" data-name="<%=vo.getName() %>" data-poster="<%=vo.getPoster()%>">
                                    <td class="text-center"><img src="<%=vo.getPoster()%>" alt="<%=vo.getName()%>"></td>
                                    <td><%=vo.getName()%></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </td>
                    <td>
                        <table class="table">
                            <caption>
                                <h3>예약 정보</h3>
                            </caption>
                            <tbody>
                                <tr>
                                    <td><span id="poster"><img></span></td>
                                </tr>
                                <tr>
                                    <td><span id="name"></span></td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
