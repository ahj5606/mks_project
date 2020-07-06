<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
 <style type="text/css">
.form-control {
	text-align: center;
	margin-right: 5px;
}
.row {
	margin: 10px;
}
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
		location.href="/manager/reserve/reserveList.mgr";
	}
	function reserve_save(){
		var pCode = $("#patientCode").val();
		var p_code = parseInt(pCode);
		var p_name = $("#patientName").val();
		var p_snum = $("#socialNum").val();
		var p_phone = $("#phoneNum").val();
		var d_dept = $("#dept").val();
		var d_deptno = $("#deptno").val();
		var doc_code= $("#doctorCode").val();
		var doc_name =$("#doctor").val();
		var r_Code =$("#resCode").val();
		var resCode = parseInt(r_Code);
		var resTime =$("#resTime").val();
		var resdate =$("#resDate").val();
		var resMemo =$("#memo").val();
	if(pCode!="" && r_Code!=""){
		var resdateSpl=null;
		resdateSpl = resdate.split('/');
		//alret(resdateSpl[0]+"//"+resdateSpl[1]+"//"+resdateSpl[2]);
		var resDate = resdateSpl[0]+"/"+resdateSpl[1]+"/"+resdateSpl[2]; 
		
		var res_timeSpl = null;
		res_timeSpl = resTime.split(':');
		var res_time=res_timeSpl[0]+res_timeSpl[1];
		
		var hp_name="새움병원";
		var hp_code="280HP";
		//위에는 세션으로 받아오게 한다
		//(resDate);
		//alert(p_code+","+p_name+","+p_snum+","+p_phone+","+d_dept+","+d_deptno+","+doc_code+","+doc_name+","+res_time+","+resDate+","+resMemo);
		//alert(typeof p_code+", "+typeof resCode);
		var param= "mem_memcode="+p_code+
				   "&dept_name="+d_dept+
				   "&dept_code="+d_deptno+
				   "&doc_code="+doc_code+
				   "&doc_name="+doc_name+
				   "&sch_code="+resCode+
				   "&res_time="+res_time+
				   "&sch_date="+resDate+
				   "&res_memo="+resMemo+
				   "&hp_code="+hp_code+
				   "&hp_name="+hp_name+
				   "&res_qrcode="+0;
	//	alert("param"+param);
	//	location.href="/manager/reserve/reserveINS.mgr?"+param
	/*  $("#res_write_form").attr("method","post");
		$("#res_write_form").attr("action","./reserveINS.mgr");
		$("#res_write_form").submit(); */
		
	$.ajax({
			url:"/manager/reserve/reserveINS.mgr?"+param
			,success:function(data){
				if(data.trim()=="성공"){
					alert("예약 정보를 등록했습니다.");
					location.href="/manager/reserve/reserveList.mgr";
				}else{
					alert("등록에 실패했습니다.");
					$("#UpdateModal").modal('hide');
					location.href="/manager/reserve/mgr_reserveAdd.jsp";
				}
			}
			
		}) //end of ajax
		}//end of if
		else{
			//alert("필수정보가 모두 입력되어야합니다.");
			$("#alert").show();
		}
	}

</script>
	<div class="container-fluid" id="sidebar">
		<div class="container">
		<h1>예약 등록</h1>
			<div class="row" style="margin-bottom: 20px;">
			</div>
			<form role="res_write_form">
			  <div class="row">
			<div class="form-group col-xs mr-2">
					<label for="patientCode">환자코드</label>
					<input type="number" class="form-control" style="width:100px;" id="patientCode" placeholder="환자코드" readonly>
			</div>
			<div class="form-group col-xs-2 mr-2">
					<label for="patientName">성명</label>
					<input type="text" class="form-control" id="patientName" placeholder="환자 성명" readonly>
				</div>
				<div class="form-group col-xs mr-2">
					<label for="socialNum">주민등록번호</label>
					<input type="text" class="form-control" id="socialNum"  placeholder="주민등록 번호" readonly>
				</div>
				<div class="form-group col-xs mr-2">
					<label for="patientNumber">전화번호</label>
					<input type="text" class="form-control" id="phoneNum" placeholder="전화번호" readonly>
				</div>
					<div class="form-group align-self-end mr-2">
					<label for="patientEditButton"></label>
					<button  type="button" class="btn btn-secondary" onClick="p_search()" data-toggle="modal" data-target="#patientSearch">환자 정보 입력</button>
				</div>
				<span class="caret"></span>
					<span class="text-secondary" style="font-size: 0.8em;"> 환자 정보는  <a href="/manager/patient/mgr_patientWrite.jsp" class="alert-link">여기</a>에서 추가할 수 있습니다.</span>
				</div>
				
				  <div class="row" style="margin-top: 30px;">
				  </div>
			
				  <div class="row">
				<div class="form-group  col-xs mr-2">
					<label for="deptno">진료과 코드</label>
					<input type="text" class="form-control"style="width:100px;" id="deptno" placeholder="과 코드" readonly>
				</div>
				<div class="form-group  col-xs mr-2">
					<label for="dept">진료과</label>
					<input type="text" class="form-control"style="width:150px;" id="dept" placeholder="진료과" readonly>
				</div>
				<div class="form-group  col-xs mr-2">
					<label for="doctorCode">의사 코드</label>
					<input type="text" class="form-control" id="doctorCode" placeholder="의사 코드" readonly>
				</div>
				<div class="form-group  col-xs mr-2">
					<label for="doctor">담당의</label>
					<input type="text" class="form-control"style="width:100px;" id="doctor" placeholder="담당의" readonly>
				</div>
				</div>
				  <div class="row">
			<div class="form-group col-xs mr-2">
					<label for="reserveCode">예약 코드</label>
					<input type="number" class="form-control" style="width:100px;" id="resCode" placeholder="예약 코드" readonly>
			</div>
				<div class="form-group  col-xs mr-2">
				<label for="reserveDate">예약 날짜</label> 
						<input type="text" id="resDate"
							class="form-control mb-2" placeholder="0000/00/00" readonly>  
				</div>
				<div class="form-group  col-xs mr-2">
				<label for="reserveDate">예약 시간</label> 
				 <input type="text" id="resTime" class="form-control" placeholder="00:00" readonly>
					<!-- 	<input type="text" id="resTime" class="form-control mb-2" placeholder="time input">  -->
				</div>
				
				<div class="form-group align-self-end mr-2">
					<label for="patientEditButton"></label>
					<button  type="button" class="btn btn-secondary" style="margin-bottom:12px;" onClick="d_search()" data-toggle="modal" data-target="#doctorSearch">예약 정보 입력</button>
				</div>
				</div>
				<div class="row">
				<span class="text-secondary" style="font-size: 0.8em;"> 예약 일정은  <a href="/manager/doctor/doctorList.mgr" class="alert-link">의사 상세</a>에서 추가할 수 있습니다.</span>
				</div>
				<div class="alert alert-danger alert-dismissible fade show" id="alert" style="display: none;" role="alert">
				  <strong>환자 정보</strong>와 <strong>예약 일정</strong>이 모두 입력되어야합니다.
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<p style="border: 1px solid gray;"></p>
					
				 <div class="row">
				<div class="form-group">
					<label for="memo">증상</label>
					<!-- <input type="text" class="form-control" style="text-align: left;" id="memo" placeholder=""> -->
					<textarea id="memo" style="height:200px; width:300px; resize:none; text-align:left;"
							 class="form-control mb-2" id="memo" placeholder="MEMO" ></textarea>
				</div>
				
				</div>
			</form>
				
			

				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary btn-lg mr-3" data-toggle="modal" data-target="#modal_ins">
				  저장
				</button>
				<button class="text-center btn btn-danger btn-lg" onclick="back()">
						취소
				</button>
		</div>
</div>
<!-- 수정 모달 -->
   <div class="modal fade bd-example-modal-sm" id="modal_ins" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="width: auto;">
               <!-- head -->
               <div class="modal-header">
                 <h5 class="modal-title">저장</h5>
               </div>
               <!-- body -->
               <div class="modal-body">
                  <div class="row" style="justify-content: center">
                    <h5 class="modal-title">입력한 정보를 저장하시겠습니까?</h5>
                   
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
	
				<div class="modal fade" id="patientSearch" tabindex="-1" role="dialog" aria-hidden="true">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="Search">환자 검색</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      <div>
				      <div class='text-center'>
					</div>
					<br>
					<div class="my-custom-scrollbar table-wrapper-scroll-y">
				      <table class="table table-hover" id="p_list" data-page-size="10" data-search="true">
						<thead>
						 	<tr>
								 <th scope="col" data-field="MEM_MEMCODE">환자 코드</th>
								 <th scope="col" data-field="MEM_NAME">환자 이름</th>
					 			 <th scope="col" data-field="MEM_SOCIALNUM">주민번호</th> 	
								 <th scope="col" data-field="MEM_PHONE">전화번호</th> 
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
				
				<div class="modal fade" id="doctorSearch" tabindex="-1" role="dialog" aria-hidden="true">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="Search">의사 정보 검색</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      <div>
				      <div class='text-center'>
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
				        <h5 class="modal-title" id="Search">선택 가능한 일정</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      <div>
				      <div class='text-center'>
						<!-- <div id="calendar"></div> -->
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
	$("#memo").focus();
	$("#d_list").bootstrapTable({
		onDblClickRow:function(row, $element, field){
			//의사검색
	 	var jo = JSON.stringify(row);
		var d = JSON.parse(jo);
		var DOC_NAME = d.DOC_NAME;
		var DEPT_NAME = d.DEPT_NAME;
		var DEPT_CODE = d.DEPT_CODE;
		var HP_NAME = d.HP_NAME;
		var DOC_CODE = d.DOC_CODE;
		$("#deptno").val(DEPT_CODE);
		$("#dept").val(DEPT_NAME);
		$("#doctor").val(DOC_NAME);
		$("#doctorCode").val(DOC_CODE);
		 var getDoc_code=$("#doctorCode").val();
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
			//예약일정검색
	 		var jo = JSON.stringify(row);
			var d = JSON.parse(jo);
			var SCH_CODE= d.SCH_CODE;
			var SCH_DATE = d.SCH_DATE;
			var SCH_TIME = d.SCH_TIME;
			$("#resCode").val(SCH_CODE);
			$("#resDate").val(SCH_DATE);
			$("#resTime").val(SCH_TIME);
			$("#doctorSearch").modal('hide');
			$("#scheduleSearch").modal('hide');
	     }


	})
	$("#p_list").bootstrapTable({
		onDblClickRow:function(row, $element, field)
	     { 
			//환자검색
	 		var jo = JSON.stringify(row);
			var d = JSON.parse(jo);
			var MEM_MEMCODE = d.MEM_MEMCODE;
			var MEM_NAME= d.MEM_NAME;
			var MEM_SOCIALNUM = d.MEM_SOCIALNUM;
			var MEM_PHONE = d.MEM_PHONE;
			$("#patientCode").val(MEM_MEMCODE);
			$("#patientName").val(MEM_NAME);
			$("#socialNum").val(MEM_SOCIALNUM);
			$("#phoneNum").val(MEM_PHONE);
			$("#patientSearch").modal('hide');
	     }

	})
	$("#sch_list").bootstrapTable('hideLoading');
})
	     var day=new Date();
	     var year = day.getFullYear(); // 년도
	     var month = day.getMonth() + 1;  // 월
	     var date = day.getDate();  // 날짜
	     var today = year+"-"+month+"-"+date;

	  //   document.write(getDoc_code);
	 //    document.write(today);
	     //아이디에 닥코드 박힘?
/* function openCalendar(){
	     //document.addEventListener('DOMContentLoaded', function() {
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
	     }; */
function d_search(){
	$("#d_list").bootstrapTable('refreshOptions', {
	    url:'/manager/reserve/reserveDoctor.mgr'
  })
} 
function p_search(){
	$("#p_list").bootstrapTable('refreshOptions', {
	    url:'/manager/reserve/reservePatient.mgr'
  })
} 

 </script>	