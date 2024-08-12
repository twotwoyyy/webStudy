<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		$('#logBtn').on('click',function(){ // 리스너 방식
			let id=$('#id').val()
			if(id.trim()===''){
				$('#id').focus()
				return
			}
			let pwd=$('#pwd').val()
			if(pwd.trim()===''){
				$('#pwd').focus()
				return
			}
			$.ajax({
				type:'post',
				url:'../member/login.do',
				// ?id=aaa&pwd=1234
				data:{"id":id,"pwd":pwd},
				success:function(result){
					// 정상 수행시 처리 문장 status:200
					// NOID / NOPWD / OK
					if(result==='NOID'){
						alert("아이디가 존재하지 않습니다")
						$('#id').val("")
						$('#pwd').val("")
						$('#id').focus()
					}else if(result==='NOPWD'){
						alert("비밀번호가 틀립니다")
						$('#pwd').val("")
						$('#pwd').focus()
					}else( // 로그인된 상태
						location.href="../main/main.do"
					)
				},
				error:function(request,status,error){
					console.log("code:"+request.status)
					console.log("message:"+request.responseText)
					console.log("error:"+error)
				}
			})
		})
		$('#logoutBtn').click(function(){
			$.ajax({
				type:'post',
				url:'../member/logout.do',
				success:function(result){
					location.href="../main/main.do"
				},
				error:function(request,status,error){
					console.log("code:"+request.status)
					console.log("message:"+request.responseText)
					console.log("error:"+error)
				}
			})
		})
	})
</script>
</head>
<body>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <div id="logo" class="fl_left">
      <h1><a href="../main/main.do">Food AND Recipe</a></h1>
    </div>
    <div class="fl_right">
      <c:if test="${sessionScope.id==null }">
	      <ul class="inline">
	        <li><input type="text" id="id" class="input-sm" placeholder="아이디"></li>
	        <li><input type="password" id="pwd" class="input-sm" placeholder="비밀번호"></li>
	        <li><input type="button" id="logBtn" class="btn-sm btn-danger" value="로그인"></li>
	      </ul>
      </c:if>
      <c:if test="${sessionScope.id!=null }">
	      <ul class="inline">
	      	<li>${sessionScope.name }(${sessionScope.admin=='y'?"관리자":"일반사용자"})님 로그인 되었습니다</li>
	        <li><input type="button" id="logoutBtn" class="btn-sm btn-success" value="로그아웃"></li>
	      </ul>
      </c:if>
    </div>
  </header>
</div>
<div class="wrapper row2">
  <nav id="mainav" class="clear"> 
    <ul class="clear">
      <li class="active"><a href="../main/main.do">홈</a></li>
	      <c:if test="${sessionScope.id==null }">
		      <li><a class="drop" href="#">회원</a>
		        <ul>
		          <li><a href="../member/join.do">회원가입</a></li>
		          <li><a href="../member/idfind.do">아이디 찾기</a></li>
		          <li><a href="../member/pwdfind.do">비밀번호 찾기</a></li>
		        </ul>
		      </li>
	      </c:if>
      <li><a class="drop" href="#">맛집</a>
        <ul>
          <li><a href="../food/list.do">맛집 목록</a></li>
          <li><a href="../food/find.do">맛집 찾기</a></li>
          	<c:if test="${sessionScope.id!=null }">
         	  <li><a href="#">맛집 예약</a></li>
          	</c:if>
          <li><a href="#">맛집 추천</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">레시피</a>
        <ul>
          <li><a href="#">쉐프</a></li>
          <li><a href="#">레시피</a></li>
          <li><a href="#">레시피 만들기</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">스토어</a>
        <ul>
          <li><a href="../goods/list.do">전체 상품</a></li>
          <li><a href="../goods/list.do?cno=2">베스트 상품</a></li>
          <li><a href="../goods/list.do?cno=3">신상품</a></li>
          <li><a href="../goods/list.do?cno=4">특가 상품</a></li>
          <li><a href="#">가격 비교</a></li>
        </ul>
       </li>
      <li><a class="drop" href="#">여행</a>
        <ul>
          <li><a href="#">명소</a></li>
          <li><a href="#">자연&관광</a></li>
          <li><a href="#">호텔</a></li>
          <li><a href="#">쇼핑</a></li>
          <li><a href="#">날씨</a></li>
        </ul>
       </li>
      <li><a class="drop" href="#">커뮤니티</a>
        <ul>
          <li><a href="../board/list.do">자유게시판</a></li>
          	<c:if test="${sessionScope.id!=null }">
          	 <li><a href="../replyboard/list.do">묻고 답하기</a></li>
          	</c:if>
          <li><a href="../notice/list.do">공지사항</a></li>
          <c:if test="${sessionScope.id!=null }">
             <li><a href="../chat/chat.do">실시간 채팅</a></li>
          </c:if>
          	<li><a href="../databoard/list.do">자료실</a></li>
        </ul>
       </li>
       <c:if test="${sessionScope.id!=null }">
         <c:if test="${sessionScope.admin=='n' }">
         <li><a href="#">마이페이지</a></li>
       </c:if>
         <c:if test="${sessionScope.admin=='y' }">
           <li><a href="#">관리자페이지</a></li>
         </c:if>
       </c:if>
    </ul>
  </nav>
</div>
</body>
</html>