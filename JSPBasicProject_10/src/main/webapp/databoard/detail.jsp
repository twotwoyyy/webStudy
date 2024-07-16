<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
    DataBoardDAO dao=DataBoardDAO.newInstance();
    DataBoardVO vo=dao.databoardDetailData(Integer.parseInt(no));
    //          vo 안에 있는 데이터 8개를 HTML을 이용해서 출력
    
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
	width: 800px;
}
h3{
	text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	$('#delclick').click(function(){
		if(i===0)
		{
			$('#delclick').text("취소");
			$('#del').show();
			i=1;
		}
		else
		{
			$('#delclick').text("삭제");
			$('#del').hide();
			i=0;
		}
	})
	$('button').click(function(){
		let no=$(this).attr("data-no");
		let pwd=$('#pwd').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'delete.jsp',
			data:{"no":no,"pwd":pwd},
			success:function(result)
			{
				alert(result)
				if(result.trim()==='no')
				{
					alert("비밀번호가 틀립니다");
					$('#pwd').val("")
					$('#pwd').focus()
				}
				else
				{
					location.href="list.jsp";
				}
			}
		})
	})
})
</script>
</head>
<body>
	<div class="container">
		<h3>내용 보기</h3>
		<div class="row">
			<table class="table">
				<tbody>
					<tr>
						<th width=20% class="text-center danger">번호</th>
						<td width=30% class="text-center"><%=vo.getNo() %></td>
						<th width=20% class="text-center danger">작성일</th>
						<td width=30% class="text-center"><%=vo.getDbday() %></td>
					</tr>
					<tr>
						<th width=20% class="text-center danger">이름</th>
						<td width=30% class="text-center"><%=vo.getName() %></td>
						<th width=20% class="text-center danger">조회수</th>
						<td width=30% class="text-center"><%=vo.getHit() %></td>
					</tr>
					<tr>
						<th width=20% class="text-center danger">제목</th>
						<td colspan="3"><%=vo.getSubject() %></td>
					</tr>
					<%
						if(vo.getFilesize()!=0){
					%>
						<tr>
						<th width=20% class="text-center danger">첨부파일</th>
							<td colspan="3">
								<a href="download.jsp?fn=<%=vo.getFilename() %>"><%=vo.getFilename() %></a>(<%=vo.getFilesize() %>Bytes)
							</td>
						</tr>
					<%
						}
					%>
					<tr>
						<td colspan="4" class="text-left" valign="top" height="200">
							<pre style="white-space:pre-wrap; border:none; background-color:white"><%=vo.getContent() %></pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
							<a href="update.jsp?no=<%=vo.getNo() %>" class="btn btn-sm btn-success">수정</a>
							<span class="btn btn-sm btn-info" id="delclick">삭제</span>
							<a href="list.jsp" class="btn btn-sm btn-warning">목록</a>
						</td>
					</tr>
					<tr style="display: none" id="del">
						<td colspan="4" class="text-right">
							비밀번호 : <input type="password" name="pwd" size="15" class="input-sm" id="pwd">
							<button class="btn-sm btn=primary" data-no="<%=vo.getNo()%>" >삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>