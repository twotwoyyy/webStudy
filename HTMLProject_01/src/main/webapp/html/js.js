//이벤트 처리
window.onload=function(){
	//main
	start1();
	start2();
	start3();
	// ; 생략가능
}
function start1(){
	alert("자바스크립트 시작1");
}
let start2=function(){
	alert("자바스크립트 시작2");
}
//자바스크립트 ES6 arrow function, function,return 제거해서 사용 => 람다식
let start3=()=>{
	alert("자바스크립트 시작3");
}