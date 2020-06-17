<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/bootStrap4UI.jsp"%>
<script type="text/javascript">
   function pageGet(num){
      $.ajax({
         url:"./test.jsp?num="+num
         ,success:function(data){
            var imsi = data.trim();
            alert(imsi);
            var res = JSON.parse(imsi);
            var inner = "";
            for(var i=0; i<res.length; i++){
               inner += "<tr><th style='padding:2px;'>이름</th><td style='padding:2px;'>"+res[i].name+"</td></tr>"
                inner += "<tr><th style='padding:2px;'>아이디</th><td style='padding:2px;'>"+res[i].id+"</td></tr>"
            }
            $("#t_my_resevation").html(inner);
         }
      });
   }
   function page(click){
      var num = Number($(click).text());
      //alert(num);
      //alert("가져올 레코드 범위: "+(num-1)+"*페이지당 레코드 수 ~"+num+"*페이지당 레코드 수")
      pageGet(num);
   }
   function pageMove(click){
      //alert($(click).children(".sr-only").text())
      var imsi = $(click).children(".sr-only").text();
      if(imsi=="Previous"){
         if($("#page_1").text()=="1"){
            alert("이동불가!");
         }else{
        	 var fist = Number($("#page_1").text())-3;
             var sec = Number($("#page_2").text())-3;
             var third = Number($("#page_3").text())-3;
            $("#page_1").html(fist);
            $("#page_2").html(sec);
            $("#page_3").html(third);
            pageGet(fist);
         }
      }else if(imsi=="Next"){
         if(false){//총 예약리스트 사이즈가 마지막 숫자보다 크지 않다면!
            alert("이동불가!");
         }else{
            var fist = Number($("#page_1").text())+3;
            var sec = Number($("#page_2").text())+3;
            var third = Number($("#page_3").text())+3;
            $("#page_1").text(fist+"");
            $("#page_2").text(sec+"");
            $("#page_3").text(third+"");
            pageGet(fist);
         }
      }
   }
</script>
</head>
<body>
   
   <table class="table" id="t_my_resevation" style="border:1px">
   </table>
   
   <!-- 페이지네이션 -->
   <ul class="pagination justify-content-center" style="height:5px;">
      <li class="page-item mx-1">
         <a class="page-link p-1 px-2 my-1" href="#" onClick="pageMove(this)" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
         </a>
      </li>
      <li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" id="page_1" href="#" onClick="page(this)">1</a></li>
      <li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" id="page_2" href="#" onClick="page(this)">2</a></li>
      <li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" id="page_3" href="#" onClick="page(this)">3</a></li>
      <li class="page-item mr-1">
         <a class="page-link p-1 px-2 my-1" href="#" onClick="pageMove(this)" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
         </a>
      </li>
   </ul>
   
</body>
</html>