<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   배열 : [] , 객체 : {}
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let sawons=[
	{sabun:1,name:"홍길동",dept:"개발부",job:"대리",pay:3600,loc:"서울"},
	{sabun:2,name:"이순신",dept:"영업부",job:"사원",pay:3000,loc:"부산"},
	{sabun:3,name:"박문수",dept:"자재부",job:"사원",pay:3000,loc:"부산"},
	{sabun:4,name:"이산",dept:"개발부",job:"대리",pay:3600,loc:"대전"},
	{sabun:5,name:"심청이",dept:"총무부",job:"부장",pay:4600,loc:"세종"},
	{sabun:6,name:"춘향이",dept:"자재부",job:"과장",pay:4000,loc:"서울"},
	{sabun:7,name:"소서노",dept:"영업부",job:"사원",pay:3000,loc:"부산"},
	{sabun:8,name:"주몽",dept:"개발부",job:"대리",pay:3600,loc:"서울"},
	{sabun:9,name:"강감찬",dept:"총무부",job:"부장",pay:4600,loc:"부산"},
	{sabun:10,name:"김두한",dept:"기획부",job:"사원",pay:3000,loc:"제주"}
]
// 데이터 출력 
const sawonList=()=>{
	console.log(sawons)
}
const sawonInsert=()=>{
	sawons.push({sabun:11,name:"홍길수",dept:"자재부",job:"대리",pay:3800,loc:"제주"})
}
const sawonDetail=(sabun)=>{
	let sawon=sawons.find(sa=>sa.sabun==sabun)
	console.log(sawon)
}
window.onload=()=>{
	//sawonList()
	//sawonInsert()
	//sawonList()
	sawonDetail(3)
	/*
	  push => 데이터 추가 
	  pop => 마지막 데이터 삭제 
	  length 
	  find() => 검색 
	  slice() => 원하지 위치부터 복제 
	  => [] => Array
	*/
}
</script>
</head>
<body>

</body>
</html>