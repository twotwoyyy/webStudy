<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.a{
	    white-space:nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	#image{
		width: 100%;
		height: 350px;
		border-radius: 20px;
	}
	#title{
		font-size: 25px;
		font-weight: bold;
	}
	#sub{
		color:grey;
		text-align: center;
	}
	#percent{
		font-size: 25px; /*h3*/
		color: pink;
		font-weight: bold;
	}
	#price{
		font-size: 25px; /*h3*/
		font-weight: bold;
	}
	#psub{
		font-size: 12px;
		color: #999;
	}
	#star{
		color: orange;
		font-weight: bold;
	}
	#blod{
		font-weight: bold;
	}
	#count{
		color:gray
	}
	#sel{
		width: 100%;
		height: 40px;
	}
	#cart,#buy,#list{
		width: 150px;
		height: 70px;
		border: 2px green solid;
		font-size: 20px;
		font-weight: bold;
		border-radius: 10px;
		box-shadow: 5px 5px 5px #A9A9A9;
	}
	#cart:hover , #buy:hover{
		cursor: pointer;
	}
	#cart{
		
		background-color: white;
		color:green;
	}
	#buy{
		background-color: green;
		color:white;
	}
	#list{
		background-color: gray;
		color:white;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#sel').change(function(){
		let account=$('#sel').val()
		if(account==='수량선택'){
			alert("수량을 선택하세요")
			return
		}
		let price=$('#sel').attr("data-price")
		let total=Number(price)*Number(account)
		$('#total').text(total.toLocaleString()+"원")
		$('#account').val(account)
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
   <h2 class="sectiontitle">상세보기</h2>
   <table class="table">
	   <tr>
		   <td width="30%" align="center" rowspan="9">
			   <img src="${vo.goods_poster}"
			     id="image" 
			   >
		   </td>
		   <td width="60%" class="tdcenter">
			   <span id="title" style="color: black">
				  ${vo.goods_name}
			   </span>
		   </td>
	   </tr>
	   <tr>
		   <td width="60%">
			   <span id="sub"  style="color: black">${vo.goods_sub}</span>
		   </td>
	   </tr>
	   <tr>
		   <td width="60%">
			   <span id="percent" style="color: red">${vo.goods_discount}%</span>&nbsp;
			   <span id="price"  style="color: black" data-value="${vo.price}">${ vo.goods_price}</span>
			   <!--  데이터를 저장할때 속성은 사용자 정의로 가능하다 -->
			   <p>
				   <del id="psub">599,000원</del>
			   </p>
		   </td>
	   </tr>
	   <tr>
		   <td width="60%" >
			   <span id="star">★★★★★</span>
			   <span id="blod">4.8</span>
			   <span id="count">(5)</span>
		   </td>
	   </tr>
	   <tr>
		   <td width="60%">
			   <img src="https://recipe1.ezmember.co.kr/img/mobile/icon_delivery3.png" width="20" height="20">
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <span id="del" style="color: black">${vo.goods_delivery}</span>
		   </td>
	   </tr>
	   <tr>
		   <td width="60%">
			   <img src="https://recipe1.ezmember.co.kr/img/mobile/icon_point.png" width="20" height="20">
			   적립&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <span id="del" style="color: black">1,595원</span> 적립 (모든 회원 구매액의 0.5% 적립)</span>
		   </td>
	   </tr>
	   <tr>
		   <td width="60%">
			   <select id="sel" data-price="${vo.price }">
				   <option>수량선택</option>
				   <c:forEach var="i" begin="1" end="10">
				   		<option>${i }</option>
				   </c:forEach>
			   </select>
		   </td>
	   </tr>
	   <tr>
	   	  <td width="60%" class="text-right">
	   	  	총 금액 : <span id="total">${vo.price }원</span>
	   	  </td>
	   </tr>
	   <tr>
		   <td width="60%" class="inline">
		   	<c:if test="${sessionScope.id!=null }">
		   	<form method="post" action="../goods/cart_insert.do">
			   <input type="hidden" name="gno" value="${vo.no }">
			   <input type="hidden" name="type" value="${type}">
			   <input type="hidden" name="price" value="${vo.price }">
			   <input type="hidden" name="account" value="" id="account">
			   <input type="submit" value="장바구니" id="cart">
			</form>
			   <input type="button" value="바로구매" id="buy">
			</c:if>
			   <input type="button" value="목록" id="list" onclick="javascript:history.back()">
		   </td>
	   </tr>
   </table>
  </main>
</div>
</body>
</html>