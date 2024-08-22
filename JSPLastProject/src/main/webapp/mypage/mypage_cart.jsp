<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
		var IMP = window.IMP;
		IMP.init("imp13371355");

		function requestPay(json,name,price) {
			IMP.request_pay({
				pg: "html5_inicis",
				pay_method: "card",
				merchant_uid: "ORD20180131-0000011",   // 주문번호
				name: name,
				amount: price,           // 숫자 타입
				buyer_email: json.email,
				buyer_name: json.name,
				buyer_tel: json.phone,
				buyer_addr: json.address,
				buyer_postcode: json.post
			}, function (rsp) { 
				location.href='http://localhost/JSPLastProject/mypage/mypage_buy.do'
			});
		}
	$(function(){
		$('.buyBtn').click(function(){
			let cno=$(this).attr('data-cno')
			let name=$('#gname'+cno).text()
			let price=$('#price'+cno).text()
			$.ajax({
				type:'post',
				url:'../mypage/mypage_cart_buy.do',
				data:{"cno":cno},
				success:function(result){
					let json=JSON.parse(result)
					requestPay(json,name,price)
				}
			})
		})
	})
	</script>
</head>
<body>
		<c:if test="${count==0 }">
		<table class="table">
			<tr>
				<td class="text-center">
					<h4>장바구니에 상품이 없습니다</h4>
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count!=0 }">
		<table class="table">
			<tr>	
				<th class="text-center">번호</th>
				<th class="text-center"></th>
				<th class="text-center">상품명</th>
				<th class="text-center">수량</th>
				<th class="text-center">가격</th>
				<th class="text-center"></th>
			</tr>
			<c:forEach var="vo" items="${cartList }">
				<tr>
					<td class="text-center" id="cno${vo.cno }">${vo.cno }</td>
					<td class="text-center">
						<img src="${vo.gvo.goods_poster}" style="width:25px;height:25px">
					</td>
					<td class="text-center" id="gname${vo.cno }">${vo.gvo.goods_name }</td>
					<td class="text-center" id="account${vo.cno }">${vo.account}</td>
					<td class="text-center" id="price${vo.cno }">${vo.price}</td>
					<td class="text-center inline">
						<input type="button" class="btn btn-xs btn-primary buyBtn" value="구매" data-cno="${vo.cno }">
						<a href="../mypage/mypage_cart_cancel.do?cno=${vo.cno }" class="btn btn-xs btn-danger">취소</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>