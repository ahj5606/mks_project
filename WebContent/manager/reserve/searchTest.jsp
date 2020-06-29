<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/ManagerCommon.jsp" %>
 <style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 900px;
        margin : 0 auto;
    }
    .my-custom-scrollbar {
position: relative;
height: 200px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
</style>
 
			<!-- 담당자 검색 -->
			<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#doctorSearch">
					담당자 검색
				</button>
				
				
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
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>	
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