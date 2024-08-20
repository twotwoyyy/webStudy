<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.resRow{
	width:800px
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.infos').click(function(){
		let rno=$(this).attr("data-rno")
		$.ajax({
			type:'post',
			url:'../mypage/mypage_reserve_info.do',
			data:{"rno":rno},
			success:function(json){
				let js=JSON.parse(json)
				console.log(js) // debug
				$('#info').show()
				$('#poster').attr("src",js.poster)
				$('#name').text(js.name)
				$('#score').text(js.score)
				$('#address').text(js.address)
				$('#phone').text(js.phone)
				$('#theme').text(js.theme)
				$('#rno').text(js.rno)
				$('#rdate').text(js.day)
				$('#rtime').text(js.time)
				$('#rinwon').text(js.inwon)
				$('#regdate').text(js.regdate)
			},
			error:function(request,status,error){
				cosole.log(error)
			}
		})
	})
})
</script>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
		<div class="row resRow">
			<table class="table">
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center"></th>
					<th class="text-center">업체명</th>
					<th class="text-center">예약일</th>
					<th class="text-center">시간</th>
					<th class="text-center">인원</th>
					<th class="text-center">상태</th>
				</tr>
				<c:forEach var="vo" items="${recvList }">
					<tr>
						<td class="text-center">${vo.rno }</td>
						<td class="text-center">
							<img src="http://menupan.com${vo.fvo.poster }" style="width:30px; height:30px">
						</td>
						<td>${vo.fvo.name }</td>
						<td class="text-center">${vo.day }</td>
						<td class="text-center">${vo.time }</td>
						<td class="text-center">${vo.inwon }</td>
						<td class="text-center inline">
							<c:if test="${vo.isok=='y' }">
								<span class="btn btn-xs btn-success infos" data-rno="${vo.rno }">예약완료</span>
							</c:if>
							<c:if test="${vo.isok=='n' }">
								<span class="btn btn-xs btn-default">예약대기</span>
							</c:if>
							<a href="../mypage/mypage_reserve_cancel.do?rno=${vo.rno }" class="btn-xs btn-danger">취소</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div style="height: 10px"></div>
			<table class="table" style="display:none" id="info">
				<caption><h4>예약 정보</h4></caption>
				<tr>
					<td width="30%" class="text-center" rowspan="9">
						<img src="" style="width: 100%" id="poster">
					</td>
					<td colspan="2">
						<h3><span id="name"></span>&nbsp;<span id="score" style="color:orange;"></span></h3>
					</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">주소</th>
					<td width="50%" id="address"></td>
				</tr>
				<tr>
					<th width="20%" class="text-center">전화</th>
					<td width="50%" id="phone"></td>
				</tr>
				<tr>
					<th width="20%" class="text-center">테마</th>
					<td width="50%" id="theme"></td>
				</tr>
				<tr>
					<th width="20%" class="text-center">예약번호</th>
					<td width="50%" id="rno"></td>
				</tr>
				<tr>
					<th width="20%" class="text-center">예약일</th>
					<td width="50%" id="rdate"></td>
				</tr>
				<tr>
					<th width="20%" class="text-center">시간</th>
					<td width="50%" id="rtime"></td>
				</tr>
				<tr>
					<th width="20%" class="text-center">인원</th>
					<td width="50%" id="rinwon"></td>
				</tr>
				<tr>
					<th width="20%" class="text-center">신청일</th>
					<td width="50%" id="regdate"></td>
				</tr>
			</table>
		</div>
		</main>
	</div>
</body>
</html>