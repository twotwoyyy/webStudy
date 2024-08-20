<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
<script>
   $( function() {
     $( "#tabs" ).tabs();
     $('#pwdBtn').click(function(){
    	 let id=$('#p_id').val()
    	 if(id.trim()===""){
    		 $('#p_id').focus()
    		 return
    	 }
    	 $.ajax({
    		 type:'post',
    		 url:'../member/pwdfind_ok.do',
    		 data:{"id":id},
    		 success:function(result){
    			 if(result==='no'){
    				 $('#result').html('<font color="red">ID가 존재하지 않습니다</font>')
    				 $('#p_id').val("")
    				 $('#p_id').focus()
    			 }else{
    				 $('#result').html('<font color="blue">메일로 비밀번호를 전송했습니다!!</font>')
    				 
    			 }
    		 },
    		 error:function(request,status,error){
    			 console.log(error)
    		 }
    	 })
     })
   })
</script>
<style type="text/css">
#tabs{
	width: 450px;
}
</style>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">비밀번호 찾기</h2>
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">비밀번호 찾기</a></li>
				</ul>
				<div id="tabs-1">
					<table class="table">
						<tr>
							<td class="inline">ID:  <input type="text" name="id" id="p_id" size="15" class="input-sm">
								<input type="button" value="검색" class="btn-sm btn-danger" id="pwdBtn">
							</td>
						</tr>
						<tr>
							<td class="text-center">
								<span id="result"></span>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</main>
	</div>
</body>
</html>