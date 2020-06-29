<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>제휴병원</title>
<%@ include file="/common/bootStrap4UI.jsp"%>
<style type="text/css">
   th, td{
      height:40px;
      font-size:large;
      color:#353535;
      /* padding:2px; ===> 왜 안먹지...?*/
   }
   a.page-link{
      color:#4C4C4C;
   }
</style>
<script type="text/javascript">
   function res_pageGet(num){
      $('#t_hospitalList').bootstrapTable('refreshOptions', {
    	  url: "/hospital/hospitalList.crm?num="+num
      });
      $("div.fixed-table-loading").remove();
   }
   function pageMove(click){
		var imsi = $(click).children(".sr-only").text();
		if(imsi=="Previous"){
			previous();
		}else if(imsi=="Next"){
			$.ajax({
				url: "/hospital/hospitalList.crm?num=0"//
				,dataType: "text"
				,success: function(data){
					next(data, 5);
				}
			});
		}
	}
   function search_h_name(){
      alert("입력한 병원이름: "+$("#h_name").val());
      $('#t_hospitalList').bootstrapTable('refreshOptions', {
              url:  "/hospital/hospitalList.crm?hp_name="+$("#h_name").val()
      });
      $("div.fixed-table-loading").remove(); 
     
   }

</script>
</head>
<body>
   <!-- 메뉴바 -->
   <jsp:include page="../login/menu.jsp"/>
   <!-- 본문 -->
   <div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:20px;">
        <div class="row pt-4">
           <div class="col-md">
            <div class="row mb-0">
               <div class="col-md">
                  <label style="font-size:x-large;font-color:#4C4C4C;">제휴병원 목록</label>
               </div>
            </div>
            <hr>
            <!-- 검색 -->
            <div class="row mb-2">
               <div class="col-md pr-2 mr-2">
                  <div class="form-group row">
                      <div class="col-md">
                         <div class="input-group">
                              <input type="text" class="form-control" id="h_name" name="h_name" type="search" placeholder="Ex) 가산독산병원">
                              <div class="input-group-prepend">
                                 <button class="btn btn-dark btn-block" onClick="search_h_name()">이름검색</button>
                              </div>
                           </div>
                      </div>
                      <div class="col-md-7"></div>
                    </div>
                  </div>
            </div>
            <!-- 운영시간 선택 -->
             <div class="row mb-2 pb-2">
                <label class="form-check-label ml-4" for="exampleCheck1">운영시간 &nbsp;&nbsp;&nbsp;&nbsp;:</label>
               <div class="form-check ml-4">
                    <input class="form-check-input" type="checkbox" value="" id="timeCheck1">
                   <label class="form-check-label" for="timeCheck1">오전 9:00 이전</label>
               </div>
               <div class="form-check ml-4">
                    <input class="form-check-input" type="checkbox" value="" id="timeCheck2">
                   <label class="form-check-label" for="timeCheck2">오후 18:00 이후</label>
               </div>
            </div> 
            <!-- 테이블 -->
            <div class="row mb-0" >
               <div class="col-md">
                  <div class="table-responsive-md">
                     <table class="table" id="t_hospitalList" data-toggle="table" style="text-align: center;">
                        <thead class="thead-light">
                           <tr>
                              <th data-field="HP_NAME">병원이름</th>
                              <th data-field="HP_ADDRESS">주소</th>
                              <th data-field="HP_OPEN">오픈시간</th>
                              <th data-field="HP_CLOSE">마감시간</th>
                              <th data-field="HP_PHONE">전화번호</th>
                              <th data-field="DEPT_NAME">진료과</th>
                           </tr>
                        </thead>
                     </table>
                  </div>
               </div>
            </div>
            <!-- 페이지네이션 -->
            <div class="row mb-4">
               <div class="col-md">
                  <ul class="pagination pagination-small justify-content-center mb-0">
                     <li class="page-item">
                        <a class="page-link py-1 px-2 my-1 mr-1" href="#" onClick="pageMove(this)" aria-label="Previous">
                           <span aria-hidden="true">&laquo;</span>
                           <span class="sr-only">Previous</span>
                        </a>
                     </li>
                    <li class="page-item mr-1" id="p_1"><a class="page-link p-1 px-2 my-1" id="page_1" onClick="page(this)" >1</a></li>
					<li class="page-item mr-1" id="p_2"><a class="page-link p-1 px-2 my-1" id="page_2"  onClick="page(this)" >2</a></li>
					<li class="page-item mr-1" id="p_3"><a class="page-link p-1 px-2 my-1" id="page_3"  onClick="page(this)" >3</a></li>
                     <li class="page-item mr-1">
                        <a class="page-link p-1 px-2 my-1" href="#" onClick="pageMove(this)" aria-label="Next">
                           <span aria-hidden="true">&raquo;</span>
                           <span class="sr-only">Next</span>
                        </a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- footer -->
   <jsp:include page="../login/footer.jsp"/>
   <!-- 돔 구성이 완료되었을 때 -->
   <script type="text/javascript">
   	  
      $(document).ready(function(){
         $('#t_hospitalList').bootstrapTable('refreshOptions', {
                 url: "/hospital/hospitalList.crm?num="+1
         });
         $("div.fixed-table-loading").remove();
         
         $.ajax({
				url: "/hospital/hospitalList.crm?num=0"//
				,dataType: "text"
				,success: function(data){
		
					var totalSize = Number(data.trim()); 
					var mok = parseInt(totalSize/5);
					if(mok<3){
						$("#page_3").remove();
						if(mok<2){
							$("#page_2").remove();
							if(mok<1){
								$("#page_1").remove();
							}
						}
					}
					res_pageGet(1);
				}
			});
      });
 
   </script>
</body>
</html>