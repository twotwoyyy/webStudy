<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .resRow{
      width:800px;
   }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// main
// javascript - window.onload=function(){}
// jquery - $(function(){}) / $(document).ready(function(){})
// vue - mounted(){}
// react - componentDidMount(){} / hooks => useEffect(()=>{})
$(function(){
   // DOMScript => 태그를 제어 (값 읽기, 설정, 이벤트)
   // $('.oks') => document.querySelector(".oks") => $는 태그 읽기, 함수, 내장객체
   $('.oks').click(function(){
      //이벤트 처리 - click, change, keyup, mouseover, hover
      
      //let rno=$(this).attr('data-no')
      
      /*
         <태그>값</태그> => text() - getter / text(값) - setter
         <태그 속성="값"> => attr('속성명') - getter / attr('속성명','값') - setter
         <input> <textarea> <select> => val() - getter / val('값') - setter
         
         html(), append(), addClass(), removeClass()
         
         서버요청 => 서버에서 들어오는 데이터 출력 - ajax()
         
         jsp => a.jsp 요청처리 후 a.jsp는 메모리에서 사라짐 => 새로운 a.jsp 출력
         a.jsp 1) _jspInit()
               2) _jspService() => 요청처리, 코딩영역
               3) _jspDestroy() => 메뫼리 해제
         
      */
   })
})
</script>
</head>
<body>
   <div class="wrapper row3">
      <main class="container clear">
         <h2 class="sectiontitle">예약관리</h2>
         <div class="row resRow">
            <table class="table">
               <tr>
                  <th class="text-center">번호</th>
                  <th class="text-center"></th>
                  <th class="text-center">ID</th>
                  <th class="text-center">업체명</th>
                  <th class="text-center">예약일</th>
                  <th class="text-center">예약시간</th>
                  <th class="text-center">예약인원</th>
                  <th class="text-center">상태</th>
               </tr>
               <c:forEach var="vo" items="${recvList}">
                  <tr>
                     <td class="text-center">${vo.rno}</td>
                     <td class="text-center">
                        <img src="http://menupan.com${vo.fvo.poster}" style="width:20px;height:20px;">
                     </td>
                     <td class="text-center">${vo.id}</td>
                     <td>${vo.fvo.name}</td>
                     <td class="text-center">${vo.day}</td>
                     <td class="text-center">${vo.time}</td>
                     <td class="text-center">${vo.inwon}</td>
                     <td class="text-center inline">
                        <c:if test="${vo.isok=='y'}">
                           <span class="btn btn-default btn-xs">승인완료</span>
                        </c:if>
                        <c:if test="${vo.isok=='n'}">
                           <a href="../adminpage/admin_reserve_ok.do?rno=${vo.rno}" class="btn btn-success btn-xs oks">승인대기</a>
                        </c:if>
                     </td>
                  </tr>
               </c:forEach>
            </table>
            </div>
        </main>
   </div>
</body>
</html>