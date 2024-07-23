<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <c:forEach var="vo" items="${list }">
	            <div class="col-sm-3">
	                <div class="thumbnail">
	                    <a href="goods_detail.jsp?no=${vo.no}"> <img
	                        src="${vo.poster}" style="width: 240px; height: 200px"
	                        class="img-rounded">
	                        <p class="a">${vo.name}!=null?${vo.name}:""</p>
	                    </a>
	                </div>
	            </div>
			</c:forEach>
        </div>
        <div style="height: 10px"></div>
       <div class="row">
			<table class="table">
				<tr>
					<td class="text-center">
						<a href="#" class="btn btn-sm btn-success">이전</a>
							${curpage } page / ${totalpage } pages
						<a href="#" class="btn btn-sm btn-success">다음</a>
					</td>
				</tr>
			</table>
    </div>
</body>
</html>
