<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <style type="text/css">
  .container{
     margin-top: 50px;
  }
  .row{
    margin: 0px auto;
    width: 800px
  }
 </style>
 <script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
 <script type="text/javascript">
 /*
   [{"dbday":"1981-11-17","ename":"KING","empno":7839,"job":"PRESIDENT","sal":5000},{"dbday":"1981-05-01","ename":"BLAKE","empno":7698,"job":"MANAGER","sal":2850},{"dbday":"1981-05-09","ename":"CLARK","empno":7782,"job":"MANAGER","sal":2450},{"dbday":"1981-04-01","ename":"JONES","empno":7566,"job":"MANAGER","sal":2975},{"dbday":"1981-09-10","ename":"MARTIN","empno":7654,"job":"SALESMAN","sal":1250},{"dbday":"1981-02-11","ename":"ALLEN","empno":7499,"job":"SALESMAN","sal":1600},{"dbday":"1981-08-21","ename":"TURNER","empno":7844,"job":"SALESMAN","sal":1500},{"dbday":"1981-12-11","ename":"JAMES","empno":7900,"job":"CLERK","sal":950},{"dbday":"1981-02-23","ename":"WARD","empno":7521,"job":"SALESMAN","sal":1250},{"dbday":"1981-12-11","ename":"FORD","empno":7902,"job":"ANALYST","sal":3000},{"dbday":"1980-12-09","ename":"SMITH","empno":7369,"job":"CLERK","sal":800},{"dbday":"1982-12-22","ename":"SCOTT","empno":7788,"job":"ANALYST","sal":3000},{"dbday":"1983-01-15","ename":"ADAMS","empno":7876,"job":"CLERK","sal":1100},{"dbday":"1982-01-11","ename":"MILLER","empno":7934,"job":"CLERK","sal":1300}]
[{"dbday":"1981-11-17","ename":"KING","empno":7839,"job":"PRESIDENT","sal":5000},{"dbday":"1981-05-01","ename":"BLAKE","empno":7698,"job":"MANAGER","sal":2850},{"dbday":"1981-05-09","ename":"CLARK","empno":7782,"job":"MANAGER","sal":2450},{"dbday":"1981-04-01","ename":"JONES","empno":7566,"job":"MANAGER","sal":2975},{"dbday":"1981-09-10","ename":"MARTIN","empno":7654,"job":"SALESMAN","sal":1250},{"dbday":"1981-02-11","ename":"ALLEN","empno":7499,"job":"SALESMAN","sal":1600},{"dbday":"1981-08-21","ename":"TURNER","empno":7844,"job":"SALESMAN","sal":1500},{"dbday":"1981-12-11","ename":"JAMES","empno":7900,"job":"CLERK","sal":950},{"dbday":"1981-02-23","ename":"WARD","empno":7521,"job":"SALESMAN","sal":1250},{"dbday":"1981-12-11","ename":"FORD","empno":7902,"job":"ANALYST","sal":3000},{"dbday":"1980-12-09","ename":"SMITH","empno":7369,"job":"CLERK","sal":800},{"dbday":"1982-12-22","ename":"SCOTT","empno":7788,"job":"ANALYST","sal":3000},{"dbday":"1983-01-15","ename":"ADAMS","empno":7876,"job":"CLERK","sal":1100},{"dbday":"1982-01-11","ename":"MILLER","empno":7934,"job":"CLERK","sal":1300}]

 */
 window.onload=()=>{
	 axios.get('http://localhost/JavaScriptProject_02/js/js_06.do')
	 .then(function(response){
		 console.log(response)
		 let data=response.data
		 let html='';
		 data.map(function(emp){
			 html+='<tr>'
			     +'<td class="text-center">'+emp.empno+'</td>'
			     +'<td class="text-center">'+emp.ename+'</td>'
			     +'<td class="text-center">'+emp.job+'</td>'
			     +'<td class="text-center">'+emp.dbday+'</td>'
			     +'<td class="text-center">'+emp.sal+'</td>'
			     +'</tr>'
		 })   
		 let tbody=document.querySelector('tbody')
		 tbody.innerHTML=html
	 })
 }
 </script>
</head>
<body>
  <div class="container">
    <h3 class="text-center">사원 목록</h3>
    <div class="row">
      <table class="table">
       <thead>
         <tr>
          <th class="text-center">사번</th>
          <th class="text-center">이름</th>
          <th class="text-center">직위</th>
          <th class="text-center">입사일</th>
          <th class="text-center">급여</th>
         </tr>
       </thead>
       <tbody>
       
       </tbody>
      </table>
    </div>
  </div>
</body>
</html>