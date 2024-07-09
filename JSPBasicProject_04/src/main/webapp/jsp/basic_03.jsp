<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	<%
       주석
       //
       /* */ <c:for> => 태그형으로 변경된다...   
  	%>
	
	<%!
		주석
		자바 문법을 적용
		// /**/
		문장이 종료 => ;
	 %>
	out.print("Hello");
        |	     
	  <%="Hello"%> => ;을 사용하지 않는다 
	   
 --%>
<%!
	// 선언문 => 노출이 된다(단점), 사용빈도 낮음 => 클래스를 직접 만들어서 사용 
	public int add(int a,int b){
	
		return a+b;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int res=add(10,20); 
	out.print(res); // 서블릿 코드 => 복잡한 자바 코딩이 있는 경우 
%>
<%=res %> <%--JSP 코드 --%>
<%--
          <% 중복할 수 없다
          
          예) <%
          	  if(){
          	  %>
          	  <%
          	  }
          	  else if(){
          	  %>
          	  <%
          	  }
          	  %>
          	  ..... 복잡하기 때문에 out.print() 사용이 편하다 
%>

<%-- 둘 다 사용 가능 --%>
</body>
</html>