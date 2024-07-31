<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
    margin-top: 50px;
}
.row {
    margin: 0px auto;
    width: 350px;
}

</style>
<script type="text/javascript">
let index=1
let prev=()=>{
	index--
	if(index<1)
		index=7
	let img=document.querySelector("img")
	let path="m"+index+".jpg"
	img.src=path
}
function next(){
	index++;
	if(index>7)
		index=1
	let img=document.querySelector("img")
	let path="m"+index+".jpg"
	img.src=path
}
let auto=function(){
	// 실시간 처리 => 1초마다 한번씩 호출 => 1000분의 1초 단위 
	setInterval(()=>{
		next()
	},1000)
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-center">
						<img src="m1.jpg" style="width:320px" height="500px">
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<input type="button" class="btn-sm btn-danger" value="이전" onclick="prev()">
						<input type="button" class="btn-sm btn-success" value="다음" onclick="next()">
						<input type="button" class="btn-sm btn-primary" value="자동" onclick="auto()">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>