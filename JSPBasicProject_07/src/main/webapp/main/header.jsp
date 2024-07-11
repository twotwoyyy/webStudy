<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Request/Response</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="#">Home</a></li>
	      <li><a href="#">답변형 게시판</a></li>
	      <li><a href="#">자료실</a></li>
	      <li><a href="../main/main.jsp?mode=2">스토어</a></li>
	    </ul>
	  </div>
	</nav>
	<div class="container">
		<div class="row">
		<%
			if(id==null){ // 로그인이 안 된 상태 => 세션은 등록이 없는 경우 => null
		%>
			<div class="text-right">
				<form method="post" action="../member/login_ok.jsp">
					ID:<input type=text name=id size=15 class="input-sm">
					&nbsp;
					Password:<input type=password name=pwd size=15 class="input-sm">
					<button class="btn-sm btn-danger">로그인</button>
				</form>
			</div>
		<%
			}else{
		%>
			<div class="text-right">
				<form method="post" action="../member/logout.jsp">
				<%=session.getAttribute("name") %>님 로그인되었습니다
						<button class="btn-sm btn-danger">로그아웃</button>
				</form>
			</div>
		<%
			}
		%>
		</div>
		<div style="height:10px"></div>
</div>
</body>
</html>