<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	pageContext => 파일 연결 => 흐름을 제어하는 클래스 
	=> 클래스명 : PageContext 
	1) 내장 객체 얻기
	   getRequest() : request 객체를 얻어오는 경우 
	   getResponse(), getOut(), getSession()
	   
	   request.getParameter()
	   pageContext.getRequest().getParameter()
	   
	2) 흐름 제어 (****)
	   ============== 
	   => include() => <jsp:include> => pageContext.include("파일명")
	   => forward() => <jsp:forward>
	   ============== request를 공유할 수 있다
	        ?======== request => 웹서버(톰캣)에 의해 
	   => a._jspService(HTTPServletRequest request)
	      => b._jspService() => forward 기법
	         {
	         }
	         main._jspService(request)
	         {
	            a._jspService(request)
	            b._jspService(request)
	            c._jspService(request)
	         }
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>