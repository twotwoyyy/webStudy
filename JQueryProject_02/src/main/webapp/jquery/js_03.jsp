<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	이벤트
	===== 사용자에 의해서 발생 (클릭, 마우스 오버, 키다운, 키업 ...) 
	1) 가장 많이 사용되는 이벤트 
	   => onload : 브라우저에서 HTML 태그를 메모리에서 읽어서 화면에 출력된 상태  
	   => onclick : button / span / img / a ... 
	   => onkeyup : 검색 => text, onkeydown
	   => onmouseover / onmouseout => CSS 효과 (hover)
	   => onsubmit : 데이터 전송 
	   => onchange : 선택이 변경 => <select>, <checkbox> ...
	   
	2) 이벤트 처리 방법 
	   1. 인라인 이벤트 모델 ***
	      => 태그 한 개에서 제어 
	      <button onclick="show()">
	   2. 고전적인 이벤트 모델 
	   3. 표준 이벤트 모델
	   4. 이벤트 리스너 *** => jquery, vue, react, next
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인라인 이벤트 모델</title>
<script type="text/javascript">
function show(){
	alert("버튼 클릭")
}
</script>
</head>
<body>
	<button onclick="show()">클릭</button>
</body>
</html>