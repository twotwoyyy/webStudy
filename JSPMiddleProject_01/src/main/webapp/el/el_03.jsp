<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*"%>
<%
	SawonVO vo=new SawonVO();
	vo.setSabun(1);
	vo.setName("홍길동");
	vo.setDept("개발부");
	vo.setJob("사원");
	vo.setPay(3000);
	
	request.setAttribute("vo", vo); // ${} => reqeust나 session에 있는 값만 출력 
			//           ==== 여기서 출력하는 것, key이름으로! 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL => 객체 출력하는 방법</h1>
	<%= ((SawonVO)request.getAttribute("vo")).getSabun() %>
	사번:${vo.sabun},${vo.getSabun()}<br><%-- request.getAttribute(), session.getAttribute()   --%>
	이름:${vo.name},${vo.getName()}<br>
	부서:${vo.dept},${vo.getDept()}<br>
	직위:${vo.job},${vo.getJob()}<br>
	연봉:${vo.pay},${vo.getPay()}
</body>
</html>