<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
 <style type="text/css">

#calendar {
    max-width : 900px;
    margin : 0 auto;
    }
.table tbody{
	overflow:auto;
	height: 300px;
	}
</style>

<script type="text/javascript">

	function back(){
		alert("취소");
		location.href="/manager/reserve/reserveList.mgr";
	}
	function reserve_save(){
		alert("저장");
		var r_name = $("#patientName").val();
		var doc_name =$("#doctor").val();
		var resTime =$("#resTime").val();
		var resDate =$("#resDate").val();
		var res_timeSpl = null;
		res_timeSpl = resTime.split(':');
		var res_time=res_timeSpl[0]+res_timeSpl[1];
		alert("합침"+res_time);
		alert("r_name doc_name resTime "+r_name+","+doc_name+","+resTime);
		alert("resDate "+resDate);
/* 		$("#f_write").attr("method","post");
		$("#f_write").attr("action","./boardINS.mvc3?cud=INS");
		$("#f_write").submit(); */
	}

</script>
	<div class="container-fluid" id="sidebar">
		<h1>예약 등록</h1>
		<div class="container">
			<h2>예약 추가</h2>
			<!-- <button class="btn btn-default btn-primary">환자검색</button> -->
			<!-- 담당자 검색 -->
			<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#doctorSearch">
					담당자 검색
				</button>
			<form role="form">
			<div class="form-group">
					<label for="patientName">성명</label>
					<input type="text" class="form-control" id="patientName" placeholder="Enter patientName">
				</div>
				<div class="form-group">
					<label for="socialNum">주민등록번호</label>
					<input type="text" class="form-control" id="socialNum"  placeholder="Enter patientName">
				</div>
				<div class="form-group">
					<label for="patientNumber">전화번호</label>
					<input type="text" class="form-control" id="patientName" placeholder="Enter patientName">
				</div>
				
				<div class="form-group">
					<label for="dept">진료과</label>
					<input type="text" class="form-control" id="dept" placeholder="Enter dept">
				</div>
				<div class="form-group">
					<label for="doctor">담당의</label>
					<input type="text" class="form-control" id="doctor" placeholder="Enter doctor">
				</div>
				<div class="form-group">
					<label for="memo">증상</label>
					<input type="text" class="form-control" id="memo" placeholder="Enter doctor">
				</div>
				<div class="form-group">
				<label for="reserveDate">예약 날짜</label> 
						<input type="date" id="resDate"
							class="form-control mb-2" placeholder="date input">  
				</div>
				<div class="form-group">
				<label for="reserveDate">예약 시간</label> 
				 <input type="time" id="resTime" class="form-control" placeholder="time input">
					<!-- 	<input type="text" id="resTime" class="form-control mb-2" placeholder="time input">  -->
				</div>
			</form>
				
			

				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal_ins">
				  저장
				</button>
				<button class="text-center btn btn-default btn-outline-secondary" onclick="back()">
						취소
				</button>
		</div>
</div>
<!-- 수정 모달 -->
   <div class="modal fade bd-example-modal-sm" id="modal_ins" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <!-- head -->
               <div class="modal-header">
                 <h5 class="modal-title">저장 확인창</h5>
               </div>
               <!-- body -->
               <div class="modal-body">
                  <div class="row" style="justify-content: center">
                    <h5 class="modal-title">다음 글을 저장하시겠습니까?</h5>
                 </div>
              </div>
              <!-- footer -->
              <div class="modal-footer">
                 <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="reserve_save();">저장</button>
                 <button type="button" class="btn btn-primary" data-dismiss="modal" data-dismiss="modal">닫기</button>
               </div>
          </div>
        </div>
   </div>
<!-- 담당자 검색 -->
		<!-- 모달 -->		
	
				<div class="modal fade" id="doctorSearch" tabindex="-1" role="dialog" aria-hidden="true">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="Search">담당자 검색</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      <div>
				      <div class='text-center'>
							 <button class="btn btn-outline-primary btn-lg" type="button" onClick="d_search()">담당자 검색</button>
					</div>
					<br>
					<div class="my-custom-scrollbar table-wrapper-scroll-y">
				      <table class="table table-hover" id="d_list" data-page-size="10" data-search="true">
						<thead>
						 	<tr>
								 <th scope="col" data-field="HP_NAME">병원 이름</th>
								 <th scope="col" data-field="DOC_CODE">담당자 코드</th>
					 			 <th scope="col" data-field="DOC_NAME">담당자 이름</th> 	
								 <th scope="col" data-field="DEPT_NAME">부서 이름</th> 
								 <th scope="col" data-field="DEPT_CODE">부서 코드</th>
				  			</tr>
						</thead>
					 </table>
					</div>
				      </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>	
				
				<div class="modal fade" id="scheduleSearch" tabindex="-1" role="dialog" aria-hidden="true">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="Search">스케쥴 검색</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      <div>
				      <div class='text-center'>
						<div id="calendar"></div>
					</div>
					<br>
					<div class="my-custom-scrollbar table-wrapper-scroll-y">
				      <table class="table table-hover" id="sch_list" data-page-size="10" data-search="true">
						<thead>
						 	<tr>
								 <th scope="col" data-field="SCH_CODE">예약 번호</th>
								 <th scope="col" data-field="SCH_DATE">예약 날짜</th>
					 			 <th scope="col" data-field="SCH_TIME">예약 시간</th> 	
				  			</tr>
						</thead>
				 		</table>
					 </div>
				      </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>					
		<!-- 모달 -->		
<script type="text/javascript">
	var doc_code=null;
	
$(document).ready(function(data){

	$("#d_list").bootstrapTable({
		onDblClickRow:function(row, $element, field)
	     { 
			
			var jo = JSON.stringify(row);
			var d = JSON.parse(jo);
 			var DOC_NAME = d.DOC_NAME;
			var DEPT_NAME = d.DEPT_NAME;
			var DEPT_CODE = d.DEPT_CODE;
			var HP_NAME = d.HP_NAME;
			var DOC_CODE = d.DOC_CODE;
			//$("#doctorSearch").modal('hide');
			$("#scheduleSearch").modal('show');
			$("#sch_list").bootstrapTable('refreshOptions', {
			    url:'/manager/reserve/reserveSchedule.mgr?doc_code='+DOC_CODE
		  })
		  	
	     }
	})
	$("#d_list").bootstrapTable('hideLoading');
	
	$("#sch_list").bootstrapTable({
		onDblClickRow:function(row, $element, field)
	     { 
			alert("호출");
	/* 		var jo = JSON.stringify(row);
			var d = JSON.parse(jo);
			var SCH_CODE= d.SCH_CODE;
			var SCH_DATE = d.SCH_DATE;
			var SCH_TIME = d.SCH_TIME;
			var res_time= null;
			hour =SCH_TIME.substring(0,2);
			min =SCH_TIME.substring(2,4);
			res_time=hour+":"+min;
			$("#sch_code").val(SCH_CODE);
			$("#sch_date").val(SCH_DATE);
			$("#sch_time").val(res_time);
			$("#scheduleSearch").modal('hide'); */
	     }
	})
	$("#sch_list").bootstrapTable('hideLoading');
})

function d_search(){
	$("#d_list").bootstrapTable('refreshOptions', {
	    url:'/manager/reserve/reserveDoctor.mgr'
  })
} 

 var day=new Date();
 var year = day.getFullYear(); // 년도
 var month = day.getMonth() + 1;  // 월
 var date = day.getDate();  // 날짜
 var today = year+"-"+month+"-"+date;
 document.write(today);
 document.addEventListener('DOMContentLoaded', function() {
     var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, {
       plugins: [ 'dayGrid' ],
     	initialDate: today,
     	defaultView: 'dayGridMonth',
     	eventLimit: true, // 하루에 표시되는 이벤트 제한. +n more로 표시됨
     	events: [
     	  {
     		title: 'My Event',
     		textColor :"#000000",
      	   start: '2020-06-25T10:00',
      	  end: '2020-06-25T16:00',
       	  display: 'background'
      	 },
     	  {
     		title: 'My Event',
      	   start: '2020-06-25T10:00',
      	  end: '2020-06-25T16:00',
       	  display: 'background'
      	 },
     	  {
     		title: 'My Event',
      	   start: '2020-06-25T10:00',
      	  end: '2020-06-25T16:00',
       	  display: 'background'
      	 },
     	  {
     		title: 'My Event',
      	   start: '2020-06-25T10:00',
      	  end: '2020-06-25T16:00',
       	  display: 'background'
      	 },
     	  {
     		title: 'My Event',
      	   start: '2020-06-25T10:00',
      	  end: '2020-06-25T16:00',
       	  display: 'background'
      	 },
     	  {
     		title: 'My Event',
      	   start: '2020-06-26T10:00',
       	  display: 'background'
      	 }
     	]	
     });

     calendar.render();
   });

 </script>	