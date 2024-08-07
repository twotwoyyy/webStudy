<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row1{
	margin: 0px auto;
	width: 960px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['사용단어', '단어횟수'],
          <c:forEach var="vo" items="${list}">
          ['<c:out value="${vo.word}"/>',     <c:out value="${vo.count}"/>],
          </c:forEach>
        ]);

        var options = {
          title: '사용자 데이터 분석',
          is3D : true
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      let bCheck=false;
      $(function(){
    	  $('#delBtn').on('click',function(){
    		  if(bCheck===true){
    			  bCheck=false
    			  $('#delBtn').text("취소")
    			  $('#delTr').show()
    		  }else{
    			  bCheck=true
    			  $('#delBtn').text("삭제")
    			  $('#delTr').hide()
    		  }
    		  $('#deleteBtn').click(function(){
    			  let pwd=$('#del_pwd').val()
    			  // 강제 입력 
    			  if(pwd.trim()===""){
    				  $('#del_pwd').focus()
    				  return
    			  }
    			  let no=$('.del_no').text()
    			  $.ajax({
    				  type:'post',
    				  url:'../board/delete.do',
    				  data:{'no':no,'pwd':pwd},
    				  success:function(result){
    					  if(result==='yes'){
    						  // 비밀번호가 맞은 경우 
    						  location.href="../board/list.do"
    					  }else{
    						  // 비밀번호가 틀린 경우
    						  alert("비밀번호가 틀렸습니다!!")
    						  $('#del_pwd').val("")
    						  $('#del_pwd').focus()
    					  }
    				  },
    				  error:function(request,status,error){
    					  console.log(error)
    				  }
    			  })
    		  })
    	  })
      })
</script>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear"> 
		<h2 class="sectiontitle">내용보기</h2>
			<div class="row row1">
				<table class="table">
					<tr>
						<th width="20%" class="text-center">번호</th>
						<td width="30%" class="text-center del_no">${vo.no }</td>
						<th width="20%" class="text-center">작성일</th>
						<td width="30%" class="text-center">${vo.dbday }</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">이름</th>
						<td width="30%" class="text-center">${vo.name }</td>
						<th width="20%" class="text-center">조회수</th>
						<td width="30%" class="text-center">${vo.hit }</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">제목</th>
						<td colspan="3">${vo.subject }</td>
					</tr>
					<tr>
						<td colspan="4" class="text-left" valign="top" height="200">
							<pre style="white-space:pre-wrap;background-color:white;border:none">${vo.content }</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
							<a href="../board/update.do?no=${vo.no }" class="btn btn-xs btn-success">수정</a>
							<span class="btn btn-xs btn-danger" id="delBtn">삭제</span>
							<a href="../board/list.do" class="btn btn-xs btn-info">목록</a>
						</td>
					</tr>
					<tr id="delTr" style="display:none"> 
						<td colspan="4" class="text-right inline">
							비밀번호: <input type="password" id="del_pwd" class="input-sm" size="10">
							<input type="button" value="삭제" class="btn-warning btn-sm" id="deleteBtn">
						</td>
					</tr>
				</table>
			</div>
			<div style="height:30px"></div>
			<div id="piechart" style="width: 900px; height: 500px;"></div>
		</main>
	</div>
</body>
</html>