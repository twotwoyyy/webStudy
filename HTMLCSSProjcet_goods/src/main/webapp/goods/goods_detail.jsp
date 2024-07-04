<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*" %>
<%
    // 데이터 가져오기
    goodsDAO dao = goodsDAO.newInstance();
    String type = request.getParameter("type");
    if (type == null) type = "1";
    String no = request.getParameter("no");
    int noValue = 1; // 기본값 설정
    if (no != null && !no.isEmpty()) {
        try {
            noValue = Integer.parseInt(no);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            // 예외 처리 로직 추가
        }
    }
    goodsVO vo = dao.goodsDetailData(Integer.parseInt(no), Integer.parseInt(type));

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제품 상세보기</title>
    <link rel="stylesheet" href="table.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
                amount: $('#price').attr('data-value'), // 숫자 타입
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

    </script>
    <style>
        .table_content {
            margin: 0px auto;
            width: 800px;
            height: 600px;
        }

        #image {
            width: 400px;
            height: 450px;
            border-radius: 20px;
        }

        #price {
            font-size: 25px;
            font-weight: bold;
        }

        #title {
            font-size: 25px;
            font-weight: bold;
            overflow: hidden;
            text-overflow: ellipsis;
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
            width: 150px;
            height: 40px;
            border: 2px rgb(0, 172, 0) solid;
            font-size: 18px;
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

        #back {
            width: 90px;
            height: 40px;
            border-radius: 10px;
            background-color: gray;
            font-size: 18px;
            color: white;
            font-weight: bold;
            border: 2px gray solid;
            box-shadow: 5px 5px 5px rgb(192, 192, 192);
        }
    </style>
</head>
<body>
<table class="table_content" width="800">
    <tr>
        <td width="30%" align="center" rowspan="9">
            <a href="goods_detail.jsp?type=<%=type%>&no=<%=vo.getNo()%>">
                <img src="<%=vo.getPoster() %>" id="image">
            </a>
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
            <input type="button" value="목록" id="back" class="btn-sm btn-default" onclick="javascript:history.back()">
        </td>
    </tr>
</table>
</body>
</html>
