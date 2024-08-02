<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	Jquery
	1) 라이브러리 로드
	   <script src=""> : 라이브러리가 충돌되면 동작하지 않음 
	2) 문법은 자바스크립트 사용 
	   1. 변수 설정
	      = var
	      = let
	      = const
	   2. 데이터형의 종류
	      = number => int, double 
	      = string => string, char => '', ""
	      = boolean => true/false => 숫자 (0,0.0을 제외한 모든 수는 true)
	      = object => [], {} => Array / object 
	                      == JSON
	      = null => object의 주소가 없는 경우 
	   3. 연산자 
	      = 산술 연산자, 논리 연산자, 비교 연산자, 대입 연산자 
	                  =============================== 문자열 / 날짜까지 비교 
	        + : 문자열 결합         === , !==   = + += -= 
	        / : 정수/정수 = 실수 
	   4. 제어문
	      = if, if ~ else 조건문
	      = for
	        일반 for
	        for - each : for of, forEach(), map()
	   5. 배열 
	      [] => object => 다른 데이터형을 섞어서 사용이 가능
	   6. 객체
	      {} => {키:값, 키:값...} => JSON (******)
	   7. 객체 모델 : 태그:객체, 속성:변수
	      태그 읽기 / 속성 변경 ==========> Jquery, VueJS, ReactJS, NextJS
	      => 이벤트 발생  
	      document.querySelector() => %{}, ${data}  let [name,setName]
	   8. 자바스크립트에서 지원하는 라이브러리 
	      Array / String / Number / Date / Math
	                                      => round()
	                               => 형변환
	                               => parseInt()
	                       => 형변환
	                       => parseInt()
	              => trim()
	              => indexOf
	              => substring 
	              => concat
	              => 자바와 동일 
	      => push()
	      => slice()
	      => pop()
	      
	      브라우저 함수
	      window => open()
	      location => href
	      history => back, go()
	      document => write(), querySelector() 
	3) 태그 가지고 오기 : selector
	   ============= CSS
	   1. 태그명 => $('태그명')
	   2. 아이디명 => $('#아이디명')
	   3. 클래스명 => $('.클래스명')
	   4. 후손 / 자손 => $('태그명 태그명'), $('태그명 > 태그명')
	   5. 속성 선택자 => $('태그명[속성명=값]') => 값이 같은 경우
	                  $('태그명[속성명*=값]') => 값이 포함된 경우
	                  $('태그명[속성명$=값]') => 값으로 끝나는 경우
	                  $('태그명[속성명^=값]') => 값으로 시작하는 경우
	   6. 가상 선택자 => $('태그명:nth-child(수열)')
	4) 제어하는 함수
	   1. 감추기 / 보여주기  태그명.style.display='', 태그명.style.display='none'
	                               |                        |
	                             show()                   hide()
	   2. <태그>값</태그> => $('태그').text() 
	                      ================ getter
	                      $('태그').text("값")
	                      ================ setter 
	   3. <태그 속성="값"> ====> attr("속성명")
	   4. <input type="text"> ====> val()
	   5. html을 읽은 경우 => innerHTML => html() 
	   6. append() : 태그를 추가할 때 사용 
	   
	5) 이벤트
	   onclick => $('태그').click(function(){})
	              $('태그').on('click',function(){})
	   onchange
	   onkeydown
	   onkeyup
	   ================
	   onmouseover
	   onmouseout 
	   ================ => hover
	6) Ajax
	   => $.ajax({
	   	type:'post/get',
	   	url: '~~.do' ,
	   	data:{id:id},
	   	success:function(){
	   		// 정상 수행
	   	},
	   	error:function(){
	   	    // 오류 발생 
	   	}
	   })
 --%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	// append
	let fileIndex=0
$(function() { // 메인 
	$('#name').val("홍길동") // 시작하자마자 기본 입력값 지정 
	// 멀티 파일 업로드 
	$('#addBtn').click(function(){
		$('#user-table').append( //append 붙여쓴다는 뜻 
			'<tr id="m'+(fileIndex)+'">' // 늘어날 때마다 파일 아이디가 다르게
			+'<td width="30%">File '+(fileIndex+1)+'</td>'
			+'<td width="70"><input type="file" size="20"></td>'
			+'</tr>'
		)
		fileIndex++
	})
	$('#removeBtn').on('click',function(){
		if(fileIndex>0){
			$('#m'+(fileIndex-1)).remove()
			fileIndex--
		}
	})
})
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">파일 업로드</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td colspan="2" class="text-right">
						<input type="button" class="btn-xs btn-info" value="add" id="addBtn">
						<input type="button" class="btn-xs btn-danger" value="remove" id="removeBtn">
					</td>
				</tr>
				<tr>
					<td width="20%">첨부파일</td>
					<td width="80%">
						<table class="table" id="user-table">

						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" id="name" class="input-sm" size="20">
						<input type="button" class="btn-xs btn-warning" value="읽기" id="readBtn">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>