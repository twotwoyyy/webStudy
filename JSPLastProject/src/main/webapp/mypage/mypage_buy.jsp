<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
    <c:when test="${empty buyList}">
        <table class="table">
            <tr>
                <td class="text-center">
                    <h4>구매 내역이 없습니다!!</h4>
                </td>
            </tr>
        </table>
    </c:when>
    <c:otherwise>
        <table class="table">
            <tr>
                <th class="text-center">번호</th>
                <th class="text-center"></th>
                <th class="text-center">상품명</th>
                <th class="text-center">수량</th>
                <th class="text-center">가격</th>
            </tr>
            <c:forEach var="vo" items="${buyList}">
                <tr>
                    <td class="text-center">${vo.cno}</td>
                    <td class="text-center">
                        <img src="${vo.gvo.goods_poster}" style="width:25px;height:25px">
                    </td>
                    <td class="text-center" id="gname">${vo.gvo.goods_name}</td>
                    <td class="text-center" id="account">${vo.account}</td>
                    <td class="text-center" id="price">${vo.price}</td>
                </tr>
            </c:forEach>
            <tr>
                <td class="text-right" colspan="5">
                    구매 총 금액 : ${total}원
                </td>
            </tr>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>