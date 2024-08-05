<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 700px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
	    $('#postBtn').on('click', function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 받은 데이터를 입력 필드에 설정
	                $('#post').val(data.zonecode);
	                $('#addr').val(data.address);
	            }
	        }).open()
	    })
	})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<th width="15%" class="text-center">우편번호</th>
					<th width="85%">
						<input type="text" id="post" size="10" readonly class="input-sm">
						<input type="button" id="postBtn" class="btn-sm btn-danger" value="우편번호 검색">
					</th>
				</tr>
				<tr>
					<th width="15%" class="text-center">주소</th>
					<th width="85%">
						<input type="text" id="addr" size="50" readonly class="input-sm">
					</th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>