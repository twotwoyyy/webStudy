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
    width: 1100px
  }
  .a {
     white-space: nowrap;
     overflow: hidden;
     text-overflow: ellipsis;
  }
 </style>
 <script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
 <script type="text/javascript">
 let food_list=[]
 let startPage=0
 let endPage=0
 let curpage=0
 let totalpage=0
 window.onload=()=>{
	 // http://localhost/JavaSrciptProject_3/js/food_find_js.do
		 // get => GET , post() => POST
		 let html=''
		 axios.get("http://localhost/JavaSrciptProject_3/js/food_find_js.do")
		 .then((response)=>{
			 
			 // 데이터를 받는 부분
			 food_list=response.data
			 console.log(food_list)
			 curpage=response.data[0].curpage
			 totalpage=response.data[0].totalpage
			 startPage=response.data[0].startPage
			 endPage=response.data[0].endPage
			 food_list.map(function(vo){
				 
				 html+='<div class="col-sm-3">'
				      +'<div class="thumbnail">'
				      +'<img src="'+vo.poster+'" style="width:100%" onclick="detail('+vo.fno+')">'
				      +'<p class="a">'+vo.name+'</p>'
				      +'</div>'
				      +'</div>'   
			 })
			 
	         let main=document.querySelector("#poster");
			 main.innerHTML=html;
			 
			 pages='<a href="#" class="btn btn-sm btn-danger">이전</a>'
			      +curpage+" page / "+totalpage+" pages"
			      +'<a href="#" class="btn btn-sm btn-success">다음</a>'
			 let page=document.querySelector("#pages");
			 page.innerHTML=pages
		 })

 }
 function imgChange(){
	     let addr=document.querySelector("#addr").value;
	     //       $('#addr').val()
	     if(addr.trim()==="")
	     {
	    	 alert("검색어를 입력하세요")
	    	 document.querySelector("#addr").focus()
	    	 return;
	     }
	     let html=''
	     let pages=''
		 axios.get("http://localhost/JavaSrciptProject_3/js/food_find_js.do",{
			  params:{
				  page:1,
				  addr:addr
			  }
		 })
		 .then((response)=>{
			 
			 // 데이터를 받는 부분
			 food_list=response.data
			 console.log(food_list)
			 curpage=response.data[0].curpage
			 totalpage=response.data[0].totalpage
			 startPage=response.data[0].startPage
			 endPage=response.data[0].endPage
			 food_list.map(function(vo){
				 
				 html+='<div class="col-sm-3">'
				      +'<div class="thumbnail">'
				      +'<img src="'+vo.poster+'" style="width:100%" onclick="detail('+vo.fno+')">'
				      +'<p class="a">'+vo.name+'</p>'
				      +'</div>'
				      +'</div>'   
			 })
			 
	         let main=document.querySelector("#poster");
			 main.innerHTML=html;
			 
			 pages='<a href="#" class="btn btn-sm btn-danger">이전</a>'
			      +curpage+" page / "+totalpage+" pages"
			      +'<a href="#" class="btn btn-sm btn-success">다음</a>'
			 let page=document.querySelector("#pages");
			 page.innerHTML=pages
		 })
 }
 function detail(fno)
 {
	 axios.get("http://localhost/JavaSrciptProject_3/js/food_detail_js.do",{
		 params:{
			 fno:fno
		 }
	 }).then(function(response){
		 let dd=response.data
		 let div=document.querySelector('#detail')
		 div.style.display=''
		 console.log(dd)
		 document.querySelector('#type').innerHTML=dd.type
		 document.querySelector('#title').innerHTML=dd.name
		 document.querySelector('#score').innerHTML=dd.score
		 document.querySelector('#address').innerHTML=dd.address
		 document.querySelector('#phone').innerHTML=dd.phone
		 document.querySelector('#theme').innerHTML=dd.theme
		 document.querySelector('#image').src=dd.poster
	 })
 }
 </script>
</head>
<body>
  <div class="container">
   <div class="row">
    <input type=text id="addr" size=20 class="input-sm">
    <input type=button value="검색" class="btn-sm btn-danger" onclick="imgChange()">
   </div>
   <div style="height: 10px"></div>
   <div class="row">
     <div class="col-sm-8" id="poster">
     </div>
     <div class="col-sm-4" style="display: none" id="detail">
      <table class="table">
        <tr>
         <td width="30%" class="text-center" rowspan="6">
          <img src="" style="width: 100%" id="image">
         </td>
         <td colspan="2">
          <h3><span id="title"></span>&nbsp;<span style="color:orange" id="score"></span></h3>
         </td>
        </tr>
        <tr>
         <td width=20% class="text-center">메뉴</td>
         <td width="50%" id="type"></td>
        </tr>
        <tr>
         <td width=20% class="text-center">주소</td>
         <td width="50%" id="address"></td>
        </tr>
        <tr>
         <td width=20% class="text-center">전화</td>
         <td width="50%" id="phone"></td>
        </tr>
        <tr>
         <td width=20% class="text-center">테마</td>
         <td width="50%" id="theme"></td>
        </tr>
      </table>
     </div>
   </div>
   <div style="height: 10px"></div>
   <div class="row" id="page">
     <div class="text-center" id="pages">
       
     </div>
   </div>
  </div>
</body>
</html>


