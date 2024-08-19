<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#year').change(function(){
		let year=$('#year').val()
		let month=$('#month').val()
		let fno=${fno}
		$.ajax({
		type:'post',
		url:'../reserve/date_info.do',
		data:{"year":year,"month":month,"fno":fno},
		success:function(result){
			$('#rdate').html(result)
		},
		error:function(request,status,error){
			console.log(error)
		}
	})
	})
	$('#month').change(function(){
		let year=$('#year').val()
		let month=$('#month').val()
		let fno=${fno}
		$.ajax({
		type:'post',
		url:'../reserve/date_info.do',
		data:{"year":year,"month":month,"fno":fno},
		success:function(result){
			$('#rdate').html(result)
		},
		error:function(request,status,error){
			console.log(error)
		}
	})
	})
	$('.rday_can').click(function(){
		let year=$(this).attr("data-year")
		let month=$(this).attr("data-month")
		let day=$(this).attr("data-day")
		let rday=year+"년도 "+month+"월 "+day+"일"
		$('#food_day').text(rday)
		$.ajax({
			type:'post',
			url:'../reserve/time_info.do',
			data:{"day":day},
			success:function(result){
				$('#food_time').html(result)
				$('#r_date').val(year+"-"+month+"-"+day)
			},
			error:function(request,status,error){
				console.log(error)
			}
		})
	})
})
</script>
<style type="text/css">
.rday_can:hover{
	cursor: pointer;
}
</style>
</head>
<body>
	<table class="table">
		<tr>
			<td class="text-center">${year }년도 &nbsp;${month }월</td>
		</tr>
		<tr>
			<td class="inline">
				<select name="year" id="year" class="input-sm">
				<c:forEach var="i" begin="2024" end="2030">
					<option ${i==year?"selected":"" }>${i }</option>
				</c:forEach>
				</select>년도&nbsp;
				<select name="month" id="month" class="input-sm">
				<c:forEach var="i" begin="1" end="12">
					<option ${i==month?"selected":"" }>${i }</option>
				</c:forEach>
				</select>월
			</td>
		</tr>
	</table>
	<div style="height:10px"></div>
	<table class="table">
		<tr>
			<c:forEach var="i" items="${weeks }" varStatus="s">
				<c:choose>
					<c:when test="${s.index==0 }">
						<c:set var="color" value="red"/>
					</c:when>
					<c:when test="${s.index==6 }">
						<c:set var="color" value="blue"/>
					</c:when>
					<c:otherwise>
						<c:set var="color" value="white"/>
					</c:otherwise>
				</c:choose>
				<th class="text-center"><span style="color:${color}">${i }</span></th>
			</c:forEach>
		</tr>
		<c:set var="week" value="${week }"/>
		<c:forEach var="i" begin="1" end="${lastday }">
			<c:if test="${i==1 }">
			<tr>
				<c:forEach var="j" begin="1" end="${week }">
					<td class="text-center" height="35">&nbsp;</td>
				</c:forEach>
			</c:if>
			<c:if test="${rday[i]==1 }">
				<td class="text-center success${day==i?'danger':''}" height="35">
				<span class="rday_can" style="font-weight: bold;"
				data-year="${year }" data-month="${month }" data-day="${i }">${i }</span>
				</td>
			</c:if>
			<c:if test="${rday[i]==0 }">
				<td class="text-center ${day==i?'danger':''}" height="35">
				<span style="color: gray">${i }</span>
				</td>
			</c:if>
			<c:set var="week" value="${week+1 }"/>
			<c:if test="${week>6 }">
			<c:set var="week" value="0"/>
			</tr>
			<tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>