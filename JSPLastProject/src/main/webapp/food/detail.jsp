<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear"> 
			<h2 class="sectiontitle">상세 보기</h2>
			<div class="flexslider carousel basiccarousel btmspace-80">
	         <ul class="slides">
	            <c:forTokens items="${vo.images }" delims="^" var="image">
	              <li>
	                <figure>
	                	<img class="radius-10 btmspace-10" src="http://menupan.com${image}" style="width:320px;height:185px;">
	                </figure>
	              </li>      
	           </c:forTokens>
	         </ul>
	       </div>
	          <%-- 상세 보기 / 댓글 --%>
	          <table class="table">
	          	<tr>
	          		<td width="30%" class="text-center" rowspan="6">
	          			<img src="http://menupan.com${vo.poster }" style="width:100%">
	          		</td>
	          		<td colspan="2">
	          			<h3>${vo.name }&nbsp;<span style="color:orange">${vo.score }</span></h3>
	          		</td>
	          	</tr>
	          	<tr>
	          		<td class="text-right" style="color:gray" width="5%">업종</td>
	          		<td width="65%">${vo.type }</td>
	          	</tr>
	          	<tr>
	          		<td class="text-right" style="color:gray" width="5%">전화</td>
	          		<td width="65%">${vo.phone }</td>
	          	</tr>
	          	<tr>
	          		<td class="text-right" style="color:gray" width="5%">주소</td>
	          		<td width="65%">${vo.address}</td>
	          	</tr>
	          	<tr>
	          		<td class="text-right" style="color:gray" width="5%">테마</td>
	          		<td width="65%">${vo.theme }</td>
	          	</tr>
	          	<tr>
	          		<td class="text-right" style="color:gray" width="5%">주차</td>
	          		<td width="65%">${vo.parking }</td>
	          	</tr>
	          	<tr>
	          		<td colspan="3" class="text-right">
	          		<c:if test="${sessionScope.id!=null }">
	          			<a href="#" class="btn btn-xs btn-success">좋아요</a>
	          			<a href="#" class="btn btn-xs btn-warning">찜하기</a>
	          			<a href="#" class="btn btn-xs btn-info">예약하기</a>
	          		</c:if>
	          			<input type="button" class="btn btn-xs btn-danger" value="목록" onclick="javascript:history.back()">
	          		</td>
	          	</tr>
	          </table>
	          <table class="table">
	          	<tr>
	          		<td>${vo.content }</td>
	          	</tr>
	          </table>
	       <div style="height:10px"></div>
	       <div id="map" style="width:100%;height:350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=918c2204eb4698435b98b635e797844d&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${vo.address}', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
		<div style="height:20px"></div>
	   <h2 class="sectiontitle">인근 맛집</h2>
	       <div class="flexslider carousel basiccarousel btmspace-80">
	         <ul class="slides">
	             <c:forEach var="nvo" items="${nList}">
	              <li>
	                <figure><img class="radius-10 btmspace-10" src="http://menupan.com${nvo.poster}" style="width:320px;height:185px;"
	                title="${nvo.address }">
	                  <figcaption><a href="#">${nvo.name}</a></figcaption>
	                </figure>
	              </li>               
	            </c:forEach>
	         </ul>
	       </div>
		</main>
	</div>
</body>
</html>