<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../reserve/food_info.do',
		success:function(result){
			$('#food_list').html(result)
		},
		error:function(request,status,error){
			console.log(error)
		}
	})
	// https://cdn-icons-png.flaticon.com/512/3875/3875148.png 
})
</script>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">맛집 예약</h2>
			<table class="table">
				<tr>
					<td width="30%" class="danger" height="400">
						<table class="table">
							<caption><h4 class="text-center">맛집 정보</h4></caption>
							<tr>
								<td>
									<div id="food_list" style="height: 400px; overflow-y:scroll"></div>
								</td>
							</tr>
						</table>
					</td>
					<td width="30%" class="info" height="400">
						<table class="table">
							<caption><h4 class="text-center">예약일 정보</h4></caption>
							<tbody>
								<tr>
									<td id="rdate"></td>
								</tr>
							</tbody>
						</table>
					
					</td>
					<td width="20%" rowspan="2" class="success" height="550">
						<table class="table">
							<caption><h4 class="text-center">예약 정보</h4></caption>
							<tr>
								<td class="text-center" colspan="2">
									<img src="https://cdn-icons-png.flaticon.com/512/3875/3875148.png" style="width:100%" id="food_poster">
								</td>
							</tr>
							<tr>
								<td width="30%" class="text-right">업체명</td>
								<td width="70%" id="food_name"></td>
							</tr>
							<tr>
								<td width="30%" class="text-right">전화</td>
								<td width="70%" id="food_phone"></td>
							</tr>
							<tr>
								<td width="30%" class="text-right">예약일</td>
								<td width="70%" id="food_day"></td>
							</tr>
							<tr>
								<td width="30%" class="text-right">시간</td>
								<td width="70%" id="food_time_data"></td>
							</tr>
							<tr>
								<td width="30%" class="text-right">인원</td>
								<td width="70%" id="food_inwon_data"></td>
							</tr>
							<tr id="reserveBtn" style="display:none;margin:auto 0px;">
								<td colspan="2" class="text-center">
									<form method="post" action="../reserve/reserve_ok.do">
										<input type="hidden" name="fno" value="" id="r_fno">
										<input type="hidden" name="date" value="" id="r_date">
										<input type="hidden" name="time" value="" id="r_time">
										<input type="hidden" name="inwon" value="" id="r_inwon">
										<button class="btn-lg btn-primary">예약</button>
									</form>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="30%" class="default" height="100">
						<table class="table">
							<caption><h4 class="text-center">시간 정보</h4></caption>
							<tr>
								<td class="text-center" id="food_time"></td>
							</tr>
						</table>
					</td>
					<td width="30%" height="100">
						<table class="table">
							<caption><h4 class="text-center">인원 정보</h4></caption>
							<tr>
								<td class="text-center" id="food_inwon"></td>
							</tr>
						</table>
					
					</td>
				</tr>
			</table>
		</main>
	</div>
</body>
</html>