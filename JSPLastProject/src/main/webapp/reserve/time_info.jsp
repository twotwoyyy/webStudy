<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.times').click(function(){
		let time=$(this).text()
		$.ajax({
			type:'post',
			url:'../reserve/inwon_info.do',
			success:function(result){
				$('#food_inwon').html(result)
				$('#food_time_data').text(time)
				$('#r_time').val(time)
			},
			error(request,status,error){
				console.log(error)
			}
		})
	})
})
</script>
</head>
<body>
	<c:forEach var="t" items="${tList }">
		<span class="btn btn-xs btn-info times" style="margin-top: 5px; margin-left:5px;">${t }</span>
	</c:forEach>		
</body>
</html>