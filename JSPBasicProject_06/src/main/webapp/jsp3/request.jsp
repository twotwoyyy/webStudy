<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP 파일
	======= _jspService(){
				소스 코딩 	        
	        }
	내부 객체 (내장 객체, 기본 객체)  => 165page
	========================
	이미 선언이 되어 있는 객체 
	***HttpServletRequest request 
	사용자가 보내준 값을 묶어서 한 번에 전송 : 입력해서 서버로 전송하는 데이터 
	======================================================
	 = 장고
	 = NodeJS
	 = ASP,PHP
	  1. 서버 정보 / 브라우저 정보 
	 	 http://localhost:80      /JSPBasicProject_06/jsp3/request.jsp  => URL
	 	 ================         ===================================== URI
	     	                      ===================
	     	                          ContextPath
	     	                        => 구분자가 없다 : 파일명 자체가 구분자 
	 	 서버 IP / PORT (80포트 생략)   
	 	 => getServerName() => localhost
	 	    AWS : 각자마다 고정 IP를 부여 
	 	 => getProtocol() : 약속 => http 
	 	 => getPort() : 80 
	 	                    => getRequestURL()
	 	                    => ***getRequestURI()
	 	                    => ***getContextPath()
	 	                    => ***클라이언트의 IP : getRemoteAddress()
	  2. 사용자 요청 정보
	     = 사용자가 보내준 데이터를 받는 메소드 
	       ***String getParameter() : 단일값 받을 경우
	       String[] getParameterValues() : checkbox, select-multiple
	       ***setCharacterEncoding() => 디코딩 (한글 변환)
	  3. 데이터 추가 정보
	       ***setAttribute() : 추가
	       ***getAttribute() : 추가된 데이터 읽기 
	       removeAttribute() : 삭제 
	***HttpServletResponse response
	PageContext pageContext; 
	  => <jsp:include>, <jsp:forward>로 변경
	***HttpSession session =null;
	***ServletContext application;
	ServletConfig config;
	***JspWriter out = null;
	Object page = this;
	Exception exception
 --%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 600px;
	
}
</style>
<%--
	사용자가 전송하는 모든 데이터는 서버를 거쳐 톰캣에 의해 request에 전송되어 묶어 넘겨준다 
	                                       ===========================
	                                       => 처리 : 웹개발자
    묶는 방법 => Map 방식이다 
              ======= key,값 => getParameter("키")
              List.jsp?num=1&num1=2&num3=3&4&5
    setAttribute(키,값); => 키는 중복 불가 
    => getRequestURI() 
       => /프로젝트폴더명/폴더명/파일명?id=admin&pwd=1234
                               ================== request가 첨부
         실제 URI : /프로젝트폴더명/폴더명/파일명
 --%>
</head>
<body>
	<div class="container">
		<h3 class="text-center">전송</h3>
		<div class="row">
			<form method="post" action="request_ok.jsp">
				<table class="table">
					<tr>
						<th width=20%>이름</th>
						<td width=80%>
							<input type=text size=20 class="input-sm" name=name>
						</td>
					</tr>
					<tr>
						<th width=20%>성별</th>
						<td width=80%>
							<input type="radio" name=sex checked value="남자">남자
							<input type="radio" name=sex value="여자">여자
						</td>
					</tr>
					<tr>
						<th width=20%>전화</th>
						<td width=80%>
							<select name="phone1" class="input-sm">
								<option>010</option>
								<option>011</option>
							</select>
							<input type="text" name=phone2 class="input-sm" size=20>
						</td>
					</tr>
					<tr>
						<th width=20%>소개</th>
						<td width=80%>
							<textarea rows="5" cols="30" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th width=20%>취미</th>
						<td width=80%>
							<input type="checkbox" name=hobby value="등산">등산
							<input type="checkbox" name=hobby value="낚시">낚시
							<input type="checkbox" name=hobby value="여행">여행
							<input type="checkbox" name=hobby value="게임">게임
							<input type="checkbox" name=hobby value="자전거">자전거
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" value="전송" class="btn-sm btn-primary">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>