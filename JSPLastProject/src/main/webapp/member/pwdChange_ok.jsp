<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${count==0 }">
	<script>
		alert("비밀번호가 일치하지 않습니다!!")
		history.back()
	</script>
</c:if>
<c:if test="${count!=0 }">
	<script>
		alert("비밀번호가 변경되었습니다.")
		location.href="../main/main.do";
	</script>
</c:if>