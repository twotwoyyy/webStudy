<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	MVC
	 => HTML / Java : 분리해서 사용 
	 => 소스가 적어진다, 파일 수가 적어진다 (X) 
	    HTML = jsp 
	    JAVA => java => 파일 2배로 늘어난다 
	    ===== 여러 명의 개발자가 동시에 개발 (분업)
	 => JSP의 단점
	    = 보안이 취약 (자바 => .class, JSP => 소스를 통으로 넘겨준다) 
	    = 재사용이 어렵다, 확장성이 낮다 (상속 x) 
	      =====       ======
	 => HTML / Java => 연결하는 파일 
	    (View) (Model)  (Controller)
	 => MVC 구조의 동작 
	    사용자 요청 (<form>, <a>, JavaScript)
	           |
	       Controller 
	       => Servlet / JSP   => URL주소를 이용해서 데이터를 전송 
	                             ========================
	                         일반 자바는 Request가 없기 때문에 받을 수 없다 
	                         서블릿 / JSP => 연결 (JSP사용하고 보통 Servlet)
	         역할) 1. 사용자 요청 받기 
	              2. Model을 찾는다
	                 ===== 자바(클래스) => 연관된 기능만 갖고 있다 
	                 = 클래스 / 메소드 => Annotation (찾기) 
	              3. 요청 결과값을 가지고 온다 (request / session) 
	                 request : 한 개의 JSP에서만 사용할 때 
	                 session : 모든 JSP에 데이터를 공유할 떄 
	              4. 요청한 JSP로 request를 전송한다 
	              =============================
	               | forward
	             요청 받기  모델 찾기    처리 
	  JSP ===> Controller =======> Model ===> DAO 
	  JSP <=== Controller <======= Model <=== DAO
	      request         request 
	       | forward / sendRedirect  
	                      
	                      
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <div id="logo" class="fl_left">
      <h1><a href="index.html">맛집 AND 서울여행</a></h1>
    </div>
    <div class="fl_right">
      <ul class="inline">
        <li><i class="fa fa-user"></i><input type="text" class="input-sm" placeholder="아이디"></li>
        <li><i class="fa fa-unlock-alt"></i><input type="password" class="input-sm" placeholder="비밀번호"></li>
      </ul>
    </div>
  </header>
</div>
<div class="wrapper row2">
  <nav id="mainav" class="clear"> 
    <ul class="clear">
      <li class="active"><a href="../main/main.do">Home</a></li>
      <li><a class="drop" href="#">회원</a>
        <ul>
          <li><a href="../pages/gallery.html">회원가입</a></li>
          <li><a href="../pages/full-width.html">아이디 찾기</a></li>
          <li><a href="../pages/sidebar-left.html">비밀번호 찾기</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">맛집</a>
        <ul>
          <li><a href="../food/list.do">맛집 목록</a></li>
          <%-- Controller를 찾을 때 URL 패턴 => .do --%>
          <li><a href="../pages/full-width.html">맛집 예약</a></li>
          <li><a href="../food/find.do">지역별 맛집 찾기</a></li>
          <li><a href="../pages/sidebar-left.html">맛집 뉴스</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">서울여행</a>
        <ul>
          <li><a href="../seoul/location.do">명소</a></li>
          <li><a href="../pages/full-width.html">자연 & 관광</a></li>
          <li><a href="../pages/sidebar-left.html">쇼핑</a></li>
          <li><a href="../pages/sidebar-left.html">호텔</a></li>
          <li><a href="../pages/sidebar-left.html">서울 날씨</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">커뮤니티</a>
        <ul>
          <li><a href="../pages/gallery.html">자유게시판</a></li>
          <li><a href="../pages/full-width.html">공지사항</a></li>
          <li><a href="../pages/sidebar-left.html">묻고 답하기</a></li>
          <li><a href="../pages/sidebar-left.html">실시간 채팅</a></li>
        </ul>
      </li>
      <li><a href="#">스토어</a></li>
      <li><a href="#">마이페이지</a></li>
    </ul>
  </nav>
</div>
</body>
</html>