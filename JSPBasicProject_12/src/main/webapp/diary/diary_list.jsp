<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
	데이터 전송 => 사용후 버림 <form>, <a>
	           사용후 계속 유지 : id, 방문 내용, 상품 구매
	           ==================================  session / cookie
	           => 지속적으로 데이터 관리                  |보안      | 일반 데이터  => 사용자 마음대로
	              ====== 저장 기간                   => 로그아웃 / 브라우저 종료까지
	              ====== 저장 위치                   => 서버(getId()) => 브라우저
	a.jsp => 전송한 값을 공유 
	 => b.jsp 
	 => c.jsp
	 => d.jsp  
	 ========= session 이용 
	           ======= static (공유할 때) => 필요시마다 어떤 JSP든 상관없이 사용이 가능 
	           1) session은 사용자 브라우저마다 한 개만 생성 (메모리 공간이 1개) => 데이터는 여러 개 저장이 가능 
	================================
	1. 요청값 전송
	   예) 검색 => 사용자의 검색어를 보내준다 (검색창) 
	      로그인 => id,pwd => ID 저장(체크박스), 자동 로그인 
	              == email 
	      페이지  
	2. 요청값을 받아서 데이터베이스 연동 : SQL => DAO 
	3. HTML 실행 화면 : 자바 => for, if 
	================================
	JSP (화면 출력용) => 자바   HTML 분리 
	                |model |view
	                 DAO    브라우저에서 이벤트 처리 (자바스크립트) 
	                 VO
	                 Service
	               => MV 패턴 : 기능별 메소드를 만든다 => JSP에서 호출 
	               => 자동화 처리 : 자동으로 메소드 호출 => Controller (Spring)
	 1. 내장 객체 => request : 사용자 요청 처리 
	              response : 응답 정보 (화면 이동 정보) 
	              session : 서버에 데이터 저장해서 모든 JSP에서 공유 목적 
	              application : 데이터 실제 경로 
	              pageContext : include, forward 
	              =============================== 내장 객체는 미리 생성
	              => Cookie는 내장 객체가 아니다 => 생성  
	 
	 session (HttpSession)
	   => 내장 객체가 아닌 경우에는 request로 생성이 가능
	      HttpSession session=reqeust.getSession()
	   => 저장
	      setAttribute(String key, Object value) => Object (모든 클래스 저장) 
	   => 저장된 데이터 읽기
	      Object getAttribute(String key) => 반드시 형변환
	   => 저장 기간 설정
	      setMaxInactiveInterval(초) => 기본 : 30분 
	   => 일부 삭제
	      removeAttribute(String key) => 장바구니, 회원 정보 변경 
	   => 전체 삭제
	      invalidate() : session에 저장된 모든 데이터 삭제 => 로그아웃 
	   => 구분자 얻기
	      String getId() : 사용자의 브라우저 정보 => JSP 실시간 채팅 
	 
 --%>
<%
	// diary_list.jsp?year=&month=&day= => JSP (_jspService(){소스 코딩})
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	String day=request.getParameter("day");
	String id=(String)session.getAttribute("id");
	DiaryVO vo=new DiaryVO();
	vo.setId(id);
	vo.setYear(Integer.parseInt(year));
	vo.setMonth(Integer.parseInt(month));
	vo.setDay(Integer.parseInt(day));
	// 오라클에 저장된 데이터를 읽어온다 
	DiaryService dao=DiaryService.newInstance();
	List<DiaryVO> list=dao.diaryListData(vo);
	// 1. 사용자가 보내준 데이터를 받는다 
	// 2. 데이터베이스 연동 
	// 3. 결과값 받기 
	// 4. HTML을 이용해서 결과값을 출력 
	// =========================== 자바 파일로 따로 만든다 (Model)
	// Front / Back 분리 => MVC 구조 (여러 명 동시에 작업)
	/*
		차세대
		  Spring : 파일 처리, 이동 (x)
		  Spring-boot : 서버에서 결과값 전송
		  ============================= 결과값 : ThymeLeaf(HTML) / Vue / React 
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 700px;
}
h3{
	text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	$('.checks').click(function(){
		let no=$(this).attr("data-no");
		$('.msgs').hide();
		if(i==0){
			$('#msg'+no).show("slow");
			i=1;
		}else{
			$('#msg'+no).hide("slow");
			i=0;
		}
	})
})
</script>
</head>
<body>
	<div class="container">
		<h3><%=session.getAttribute("name") %>님의 <%=year %>년 <%=month %>월 <%=day %>일 일정 목록</h3>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="40%" class="text-center">일정</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="30%" class="text-center"></th>
					</tr>
				</thead>
				<tbody>
					<% for(DiaryVO dvo:list) { %>
						<tr>
							<td width="10%" class="text-center"><%=dvo.getNo() %></td>
							<td width="40%"><%=dvo.getSubject() %></td>
							<td width="20%" class="text-center"><%=dvo.getDbday() %></td>
							<td width="30%" class="text-center">
								<span class="btn btn-xs btn-warning checks" data-no="<%=dvo.getNo() %>">상세보기</span>
								<a href="diary_update.jsp?no=<%=dvo.getNo() %>" class="btn btn-xs btn-primary">수정</a>
								<a href="diary_delete.jsp?no=<%=dvo.getNo() %>" class="btn btn-xs btn-danger">삭제</a>
							</td>
						</tr>
						<tr id="msg<%=dvo.getNo() %>" class="msgs" style="display:none">
							<td colspan="4" class="text-left" valign="top"><pre style="white-space:pre-wrap;"><%=dvo.getMsg() %></pre></td>
						</tr>
					<% } %>
					<tr>
						<td colspan="4" class="text-left">
							<a href="diary.jsp" class="btn btn-xs btn-info">일정</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>