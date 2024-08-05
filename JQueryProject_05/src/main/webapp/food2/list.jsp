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
   width: 900px;
}
.a{
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
   $(function(){
      $.ajax({
         type:'post',
         url:'food.do',
         success:function(result){
            let json=JSON.parse(result)
            //console.log(json)
            foodPrint(json)
         }
      })
      $('#prev').click(function(){
         let no=$(this).attr("data-type")
         let cpage=$('#cpage').text()
         let curpage=parseInt(cpage)
         if(curpage>1){
            curpage--
            $.ajax({
               type:'post',
               url:'food.do',
               data:{"type":no,"page":curpage},
               success:function(result){
                  let json=JSON.parse(result)
                  foodPrint(json)
               }
            })
         }
      })
      $('#next').click(function(){
         let no=$(this).attr("data-type")
         let cpage=$('#cpage').text()
         let tpage=$('#tpage').text()
         let curpage=parseInt(cpage)
         let totalpage=parseInt(tpage)
         if(curpage<totalpage){
            curpage++
            $.ajax({
               type:'post',
               url:'food.do',
               data:{"type":no,"page":curpage},
               success:function(result){
                  let json=JSON.parse(result)
                  foodPrint(json)
               }
            })
         }
      })
   })
   function change(no){
      $.ajax({
         type:'post',
         url:'food.do',
         data:{"type":no},
         success:function(result){
            let json=JSON.parse(result)
            foodPrint(json)
         }
      })
   }
   function foodPrint(json){
      $('#cpage').text(json[0].curpage)
      $('#tpage').text(json[0].totalpage)
      
      let html='';
      json.map((food)=>{
         html+='<div class="col-sm-3">'
         +'<a href="#">'
            +'<div class="thumbnail">'
               +'<img src="'+food.poster+'" style="width:100%">'
               +'<p class="a">'+food.name+'</p>'
            +'</div>'
         +'</a>'
      +'</div>'
      })
      $('#prev').attr("data-type",json[0].type)
      $('#next').attr("data-type",json[0].type)
      $('#print').html(html)
   }
</script>
</head>
<body>
   <div class="container">
      <div class="row">
         <div class="text-center">
            <input type="button" class="btn btn-lg btn-danger typeBtn" value="한식" onclick="change(1)">
            <input type="button" class="btn btn-lg btn-success typeBtn" value="중식" onclick="change(2)">
            <input type="button" class="btn btn-lg btn-primary typeBtn" value="양식" onclick="change(3)">
            <input type="button" class="btn btn-lg btn-info typeBtn" value="일식" onclick="change(4)">
            <input type="button" class="btn btn-lg btn-warning typeBtn" value="분식" onclick="change(5)">
         </div>      
      </div>
   </div>
   <div style="height:10px"></div>
   <div class="row" id="print">
   
   </div>
   <div style="height:10px"></div>
   <div class="row" id="print">
      <div class="text-center">
         <input type="button" class="btn btn-sm btn-success" value="이전" id="prev" data-type="">
            <span id="cpage"></span> page / <span id="tpage"></span> pages
         <input type="button" class="btn btn-sm btn-success" value="다음" id="next" data-type="">
      </div>
   </div>
</body>
</html>