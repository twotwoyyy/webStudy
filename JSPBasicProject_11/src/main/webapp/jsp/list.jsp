<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
	데이터 관리 => 지속적으로 상태 관리 
	                   === 데이터가 변경되는 상태 => JavaScript 
	                                          ===========
	                                          1. Jquery
	                                          2. VueJs
	                                          3. ReactJs
	                                          =========== 상태 관리 (클라이언트에서 데이터 관리) 
	자바(서버) 
	Cookie / Session 
	================================================================
	            Cookie                         Session
	================================================================
	 사용 클래스   Cookie                     HttpSession                => 생성 시에는 request 이용 
	           request.getCookies()        request.getSession() 
	=================================================================
	 저장되는 값   문자열                       자바 사용하는 모든 클래스 (Object)
	=================================================================
	 저장 장소    클라이언트 브라우저            sessionId외 실제 데이터는 서버에 저장
	                                    ========== 브라우저 구분자 (사용자의 IP나 PORT)
	                                    | sessionId를 이용해서 실시간 채팅  
	=================================================================
	 사용처      보안이 취약                   보안이 뛰어남 
	           최신 방문                    로그인 처리시 사용자 정보 저장 
	           자동 로그인                   장바구니를 임시로 저장 => Ajax,Vue
	           (Spring => remember-me)
	=================================================================
	
	Cheapter03장 301page
	------------------------
	Cookie의 주요 메소드
	  1. 생성 방법
	     Cookie cookie=new Cookie(String key,String value)
	     => Map 방식 => 키가 중복되면 덮어쓴다 (중복을 허용하지 않는다) 
	  1-1. 저장 방법
	     response.addCookie(cookie) => 브라우저로 전송하는 과정 
	     ======== 한 개의 JSP에서 한 개의 내용만 전송이 가능 (동시 전송 불가)
	                           ======== HTML/Cookie => JSP 2개 이용 
	  2. 저장 기간 
	     cookie.setMaxAge(초단위) => 하루 : 60*60*24 
	  3. 저장 위치 
	     cookie.setPath("/") => 루트에 저장 => 권장 
	  4. 키 읽기 
	     cookie.getName()
	  5. 값 읽기
	     cookie.getValue()
	  6. 삭제 방법
	     cookie.getMaxAge(0) => addCookie를 이용해 브라우저로 다시 전송 
	  7. 전체 쿠키를 읽을 경우 
	     Cookie[] cookies=request.getCookies() 
	     => 저장 순서가 순차적이다 => 맨 마지막 거를 가져올 때는 (최신 등록) cookies.length-1
	     
	     
	Session의 주요 메소드 => 서버에 저장 (구분 => getId(), 저장공간 클라이언트당 한 개만 배정)
	  1. 생성
	     HttpSession session=request.getSession() 
	     => 자바에서 Session 사용시 MVC,Servlet할 땐 session 사용
	     JSP에서는 내장 객체를 이용한다 
	  2. 저장 방법 
	     session.setAttribute(String key,Object obj)
	                          ========== 구분자 
	  3. 저장된 값 읽기
	     Object session.getAttribute(String key) => 데이터를 받을 때 형변환 꼭 시켜야한다 
	  4. 저장된 데이터의 일부 삭제 (장바구니=> 필요한 것만 삭제)
	     removeAttribute() 
	  5. 전체 삭제 
	     invalidate() : 로그아웃 
	  6. 클라이언트마다 식별자
	     getId()
	  7. 서버에 저장되는 기간 => default => 30분 
	     setMaxInactiveInterval() => 1800초
	  8. 저장이 처음인지 여부 
	     isNew()
	
	
 --%>
<%
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curpage=Integer.parseInt(strPage);
	
	// DB 연동
	SeoulDAO dao=SeoulDAO.newInstance();
	List<LocationVO> list=dao.seoulLocationListData(curpage);
	int totalpage=dao.seoulLocationTotalPage();
	
	final int BLOCK=10;
	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	
	if (endPage > totalpage)
		endPage = totalpage;
	
	// 쿠키 출력
	Cookie[] cookies=request.getCookies();
	List<LocationVO> cList=new ArrayList<LocationVO>();
	if(cookies!=null){
		// 가장 최신에 등록된 쿠키 데이터 읽기 
		for(int i=cookies.length-1;i>=0;i--){
			if(cookies[i].getName().startsWith("seoul_")){
				String no=cookies[i].getValue();
				LocationVO vo=dao.seoulDetailData(Integer.parseInt(no));
				cList.add(vo);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 960px;
}
.a{
	white-space: nowrap;
	overflow:hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<%
			for(LocationVO vo:list){
				/*
				   response
				     응답 : HTML/Cookie
				     화면 변경 : sendRedirect()
				   request
				     요청 : 데이터 전송 
				           쿠키 읽기/세션 읽기 
				           사용자가 보내주는 모든 데이터는 request안에 저장 
				           ?값, <form> 
				   Spring : 사용이 쉽게 만들어주는 라이브러리 
				            ======== 형식 1개 
				   => 출력시에는 JSP를 이용한다 / 처리 자바를 이용한다
				*/
			%>
				<div class="col-sm-3">
					<div class="thumbnail">
						<a href="detail_before.jsp?no=<%=vo.getNo()%>">
							<img src="<%=vo.getPoster() %>" style="width:240px; height:200px" onerror="this.src='noimage.jpg'">
							<p class="a"><%=vo.getTitle() %></p>
						</a>
					</div>
				</div>
			<%
			}
			%>
		</div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
				<%
					if(startPage>1){
				%>
					<li><a href="list.jsp?page=<%=startPage-1%>">&lt;</a>
				<%
					}
					for(int i=startPage;i<=endPage;i++){
					%>
						<li class="<%=i==curpage?"active":"" %>"><a href="list.jsp?page=<%=i %>"><%=i %></a></li>
					<%
						}
					
					if(endPage<totalpage){
					%>
					<li><a href="list.jsp?page=<%=endPage+1%>">&gt;</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
		<div style="height:20px"></div>
		<div class="row">
		<h3>최신 방문 서울 여행</h3>
			<hr>
			<a href="all_delete.jsp" class="btn btn-sm btn-success">전체 삭제</a>
			<a href="all_view.jsp" class="btn btn-sm btn-info">전체 보기</a>
			<hr>
		<%
			int i=0;
			for(LocationVO vo:cList){
				if(i>8) break;
		%>
			<figure style="float:left; margin-left:5px">
				<img src="<%=vo.getPoster() %>" style="width:100px; height:100px" class="img-rounded">
				<figcaption style="margin: 5px 30px">  
					<a href="delete.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-danger">삭제</a>
				</figcaption>
			</figure>
		<% 
				i++;
			}
		%>
		</div>
	</div>
</body>
</html>