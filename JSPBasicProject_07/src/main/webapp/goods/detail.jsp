<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<jsp:useBean id="dao" class="com.sist.dao.GoodsDAO"></jsp:useBean>
<jsp:useBean id="rDao" class="com.sist.dao.ReplyDAO"></jsp:useBean>
<%
	String id=(String)session.getAttribute("id");
	String no=request.getParameter("no");
	GoodsVO vo=dao.goodsDetailData(Integer.parseInt(no));
	List<ReplyVO> list=rDao.replyListData(Integer.parseInt(no), 2);
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="table.css">
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		var IMP = window.IMP;
		IMP.init("imp13371355");

		function requestPay() {
			IMP.request_pay({
				pg: "html5_inicis",
				pay_method: "card",
				merchant_uid: "ORD20180131-0000011",   // 주문번호
				name: $('#title').text(),
				amount: $('#price').attr('data-value'),           // 숫자 타입
				buyer_email: "gildong@gmail.com",
				buyer_name: "홍길동",
				buyer_tel: "010-4242-4242",
				buyer_addr: "서울특별시 강남구 신사동",
				buyer_postcode: "01181"
			}, function (rsp) { // callback
				$.ajax({
					type: 'POST',
					url: '/verify/' + rsp.imp_uid
				}).done(function (data) {
					if (rsp.paid_amount === data.response.amount) {
						alert("결제 성공");
					} else {
						alert("결제 실패");
					}
				});
			});
		}
		let u=0; //전역변수
		//변수 => var : let,const()
		$(function(){ // main => window.onload=function(){}
			$('.updates').click(function(){
				$('.ups').hide();
				let rno=$(this).attr("data-no");
				if(u==0){
					u=1;
					$(this).text("취소");
					$('#ups'+rno).show();
				}else{
					u=0;
					$(this).text("수정");
					$('#ups'+rno).hide();
				}
			})
		})
	</script>
	<style>
		.table_content {
			margin: 0px auto;
			width: 800px;
		}

		#image {
			width: 100%;
			height: 350px;
			border-radius: 20px;
		}

		#price {
			font-size: 25px;
			font-weight: bold;
		}

		#title {
			font-size: 25px;
			font-weight: bold;
		}

		#sub {
			color: gray;
			text-align: center;
		}

		#percent {
			font-size: 25px;
			color: rgb(254, 78, 96);
			font-weight: bold;
		}

		#psub {
			font-size: 12px;
			color: rgb(88, 88, 88)
		}

		#star {
			color: darkorange;
			font-weight: bold;
		}

		#bold {
			font-weight: bold;
		}

		#count {
			color: darkgray;
		}

		#sel {
			width: 100%;
			height: 40px;
		}

		#points {
			color: mediumseagreen;
			font-weight: bold;
			font-size: 15px;
		}

		#cart,
		#buy {
			width: 250px;
			height: 60px;
			border: 2px rgb(0, 172, 0) solid;
			font-size: 20px;
			font-weight: bold;
			box-shadow: 5px 5px 5px rgb(192, 192, 192);
		}

		#cart:hover,
		#buy:hover {
			cursor: pointer;
		}

		#cart {
			border-radius: 10px;
			background-color: white;
			color: rgb(0, 172, 0);
		}

		#buy {
			border-radius: 10px;
			background-color: rgb(0, 172, 0);
			color: white;
		}
	</style>
</head>

<body>
<div class="row">
	<table class="table_content" width="800">
		<tr>
			<td width="30%" align="center" rowspan="9">
				<img src="<%=vo.getPoster() %>"
					id="image">
			</td>
			<td width="60%" class="tdcenter">
				<span id="title">
					<%=vo.getName() %>
				</span>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<span id="sub"><%=vo.getSub() %></span>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<span id="percent"><%=vo.getDiscount() %>%</span>&nbsp;
				<span id="price" data-value="<%=vo.getRprice() %>"> <%=vo.getFirst_price() %></span>
				<!-- 데이터 저장할 때 속성은 사용자 정의로 가능 -->
				<p>
					<del id="psub"><%=vo.getPrice() %></del>
				</p>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<span id="star">★★★★★</span>
				<span id="bold">4.8</span>
				<span id="count">(5)</span>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_delivery3.png" width="20" height="20">
				배송&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="del"><%=vo.getDelivery() %></span>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_point.png" width="20" height="20">
				적립&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="points">1,595</span> 적립 (모든 회원 구매액의 0.5% 적립)
			</td>
		</tr>
		<tr>
			<td width="60%">
				<select id="sel">
					<option>[선택]옵션을 선택하세요.</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<input type="button" value="장바구니" id="cart">
				<input type="button" value="바로구매" id="buy" onclick="requestPay()">
			</td>
		</tr>
	</table>
	<table class="table">
		<tr>
			<td class="text-right">
				<a href="#" class="btn btn-xs btn-info">찜하기</a>
				<a href="#" class="btn btn-xs btn-success">좋아요</a>
				<a href="#" class="btn btn-xs btn-warning">예약</a>
				<a href="../main/main.jsp?mode=3" class="btn btn-xs btn-primary">목록</a>
			</td>
		</tr>
	</table>
	<div style="height:15px;"></div>
	<table class="table">
		<tr>
			<td>
			<%
				for(ReplyVO rvo:list){
			%>
				<table class="table">
					<tr>
						<td class="text-left">◑<%=rvo.getName()%>&nbsp;<%=rvo.getDbday()%></td>
						<td class="text-right">
						<%
							if(rvo.getId().equals(id)){
						%>
							<span class="btn btn-danger btn-xs updates" data-no="<%=rvo.getRno() %>">수정</span>
							<a href="../reply/delete.jsp?rno=<%=rvo.getRno() %>&fno=<%=rvo.getFno() %>&type=<%=rvo.getType() %>" class="btn btn-primary btn-xs">삭제</a>
						<%
							}
						%>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<pre style="white-space:wrap; background-color:white; border:none;"><%=rvo.getMsg() %></pre>
						</td>
					</tr>
					<tr style="display:none;" class="ups" id="ups<%=rvo.getRno()%>">
                       <td>
                          <form method="POST" action="../reply/update.jsp">
                          <input type="hidden" name=type value="<%=rvo.getType()%>">
                              <input type="hidden" name="fno" value="<%=vo.getNo()%>">
                              <input type="hidden" name="rno" value="<%=rvo.getRno()%>">
                              <textarea rows="4" cols="55" name="msg" style="float:left;" required><%=rvo.getMsg()%></textarea>
                              <button style="height:82px;width:100px;background-color:blue;color:white; float: left">댓글수정</button>
                           </form>
                        </td>
                     </tr>
				</table>
			<%
				}
			%>
			</td>
		</tr>
	</table>
	<%
		if(id!=null){
	%>
	<table class="table">
		<tr>
			<td>
				<form method="post" action="../reply/insert.jsp">
				<input type="hidden" name=type value="2">
					<input type="hidden" name="fno" value="<%=vo.getNo() %>">
					<textarea rows="4" cols="60" name="msg" style="float:left;" required></textarea>
					<button style="height:82px; width:100px; background-color:blue; color:white;">댓글쓰기</button>
				</form>
			</td>
		</tr>
	</table>
	<%
		}
	%>
	</div>
</body>

</html>