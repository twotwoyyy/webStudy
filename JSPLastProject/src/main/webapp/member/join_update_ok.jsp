<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result==true}"> <%--비밀번호가 맞는 경우 --%>
	<c:redirect url="../mypage/mypage_main.do"/>
</c:if>
<c:if test="${result==false}"> <%--비밀번호가 틀린 경우 --%>
	<script>
		alert("비밀번호가 틀립니다");
		history.back()
	</script>
</c:if>