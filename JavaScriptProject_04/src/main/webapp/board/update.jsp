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
    width: 600px;
}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
function update(){
   let name=document.querySelector("#name") // $()
   if(name.value.trim()==="")
   {
      name.focus()
      return
   }
   let subject=document.querySelector("#subject") // $()
   if(subject.value.trim()==="")
   {
      subject.focus()
      return
   }
   let content=document.querySelector("#content") // $()
   if(content.value.trim()==="")
   {
      content.focus()
      return
   }
   let pwd=document.querySelector("#pwd") // $()
   if(pwd.value.trim()==="")
   {
      pwd.focus()
      return
   }
   // 유효성 검사 => 사용자에 입력을 유도 => NOT NULL / Primary KEY => 자바스크립트
   let no=document.querySelector("#no") // hidden
   
   // 서버 연결 => axios.get => GET, axios.post => POST
   // GET 한글 처리가 없다, POST => request.setCharacterEncoding 처리
   // update_ok => GET   insert_ok => POST
   // GET / POST 복습
   /*
   		웹 
   		   1. 전송 => 받아서 출력 
   		   2. 전송 방식 => GET/POST
   		   3. 데이터베이스 : SQL 문장 
   		   4. 어떤 화면을 브라우저에 출력할 지
   */
   axios.get('update_ok.do',{ // Model로 이동 => 처리 
      params:{
         no:no.value,
         name:name.value,
         subject:subject.value,
         content:content.value,
         pwd:pwd.value
      }
   }).then(function(result){
	   // 벤치마킹 = 데이터추출 => 데이터베이스 컬럼 => ERD
      if(result.data==='yes')
      {
         // 수정된 상태
         //이동
         location.href="detail.do?no="+no.value
      }
      else
      {
         // 비밀번호가 틀리다
         alert("비밀번호가 틀립니다!!\n다시 입력하세요")
         pwd.value=''
         pwd.focus()
      }
   })
   // a.jsp => 서버(Controller) => a.jsp
   // ======= 메모리 해제 (destroy()) ===== 새로운 JSP
   // 같은 파일에서 작업 ===> new 
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
		<h2 class="text-center">수정하기</h2> 
		<!-- <form method=post action="../board/update_ok.do"> -->
		<form method="post" action="../board/update_ok.do">
			<table class="table">
				<tr>
					<th width="10%" class="text-right">이름</th>
					<td width="85%">
						<input type="text" id="name" size="20" class="input-sm" value="${vo.name }">
						<input type="hidden" id="no" value="${vo.no }">
					</td>
				</tr>
				<tr>
					<th width="15%" class="text-right">제목</th>
					<td width="85%">
						<input type="text" id="subject" size="60" class="input-sm" value="${vo.subject }">
					</td>
				</tr>
				<tr>
					<th width="15%" class="text-right">내용</th>
					<td width="85%">
						<textarea rows="10" cols="60" id="content">${vo.content }</textarea>
					</td>
				</tr>
				<tr>
					<th width="15%" class="text-right">비밀번호</th>
					<td width="85%">
						<input type="password" id="pwd" size="10" class="input-sm">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center inline">
						<input type="button" class="btn-danger btn-sm" id="updateBtn" value="수정" onclick="update()">
						<input type="button" value="취소" class="btn-primary btn-sm" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
			<!-- </form> -->
		</form>
		</div>
</div>
</body>
</html>