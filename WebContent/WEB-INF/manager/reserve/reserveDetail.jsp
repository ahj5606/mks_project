<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> rList = (List<Map<String, Object>>)request.getAttribute("rList");
if(rList==null){
	rList = new ArrayList();
}
String res_time = null;
String hour =null;
String min  =null;
String mem_memcode = request.getParameter("mem_memcode");
String mem_name = request.getParameter("mem_name");
String doc_name = request.getParameter("doc_name");
String sch_code = request.getParameter("sch_code");
//시간=>시:분 으로 나눔
String getRes_time = (String)rList.get(0).get("RES_TIME");
	hour =getRes_time.substring(0,2);
	min =getRes_time.substring(2,4);
	res_time=hour+":"+min;


if(sch_code==null){
	sch_code="";
	out.print("안됨");
}
%>
<script type="text/javascript">

	function back(){
		location.href="/manager/reserve/reserveList.mgr";
	}
	function reserve_remove(){
		alert("삭제");
		var pCode = $("#patientCode").val();
		var p_code = parseInt(pCode);
		var r_Code =$("#sch_code").val();
		var resCode = parseInt(r_Code);
		var param= "mem_memcode="+p_code+"&sch_code="+resCode;
		$.ajax({
			url:"/manager/reserve/reserveDEL.mgr?"+param
			,success:function(data){
				if(data.trim()=="성공"){
					alert("예약 정보를 삭제했습니다.");
					location.href="/manager/reserve/reserveList.mgr";
				}else{
					alert("입력에 실패했습니다.");
					$("#UpdateModal").modal('hide');
					location.href="/manager/reserve/mgr_reserveDetail.mgr?"+resCode;
				}
			}
		})  
	}
	function reserve_edit(){
		alert("수정");
		var pCode = $("#mem_memcode").val();
		var p_code = parseInt(pCode);
		var r_Code =$("#sch_code").val();
		var resCode = parseInt(r_Code);
		var mem_memcode=<%=mem_memcode%>//변경전
		alert("변경전 회원코드:"+mem_memcode+", 변경된 회원코드:"+p_code);
		/* var hp_name="새움병원";
		var hp_code="280HP"; */
		var param= "mem_memcode="+p_code+
				   "&sch_code="+resCode;
		//alert("param : "+param);
	alert("원래 회원번호:"+mem_memcode+", 바뀔 회원번호"+p_code);
		
	$.ajax({
			url:"/manager/reserve/reserveUPD.mgr?"+param
			,success:function(data){
				if(data.trim()=="성공"){
					alert("입력에 성공했습니다.");
					location.href="/manager/reserve/reserveList.mgr";
				}else{
					alert("입력에 실패했습니다.");
					$("#UpdateModal").modal('hide');
					location.href="/manager/reserve/reserveDetail.mgr?sch_code="+sch_code;
				}
			}
			
		}) 
	}
</script>
	<div class="container-fluid" id="sidebar">
			<h1>예약 정보</h1>
		<div class="container">
			<form role="form">
			<input type="hidden" value="<%=rList.get(0).get("HP_NAME")%>" id="hp_name">
			<input type="hidden" value="<%=rList.get(0).get("HP_CODE")%>" id="hp_code">
			<input type="hidden" value="<%=rList.get(0).get("MEM_MEMCODE")%>" id="mem_memcode">
			<input type="hidden" value="<%=rList.get(0).get("DOC_CODE")%>" id="doc_code">
			<input type="hidden" value="<%=rList.get(0).get("DEPT_CODE")%>" id="dept_code">
			<input type="hidden"  value="<%=rList.get(0).get("SCH_CODE")%>" id="sch_code">
				<div class="row">
				</div>
				<div class="row">
				<div class="form-group mr-2">
					<label for="patientName">성명</label>
					<input type="text" class="form-control" style="width:150px;"  id="mem_name" value="<%=rList.get(0).get("MEM_NAME")%>" placeholder="Enter patientName" readonly>
				</div>
				<div class="form-group mr-2">
					<label for="socialNum">주민등록번호</label>
					<input type="text" class="form-control" style="width:160px;" id="mem_socialnum" value="<%=rList.get(0).get("MEM_SOCIALNUM")%>" placeholder="Enter patientName" readonly>
				</div>
				<div class="form-group align-self-end mr-2">
					<label for="patientNumber">전화번호</label>
					<input type="text" class="form-control"style="width:150px;" id="mem_phone" value="<%=rList.get(0).get("MEM_PHONE")%>" placeholder="Enter patientName"readonly>
				</div>
				<div class="form-group align-self-end mr-2">
					<label for="patientEditButton"></label>
					<button  type="button" class="btn btn-secondary" data-toggle="modal" data-target="#patientSearch">환자 정보 변경</button>
				</div>
				</div>
				
				<!-- <button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#doctorSearch" style="margin-bottom:10px;">
					예약 담당의 변경
				</button> -->
				<div class="form-group">
					<label for="dept">진료과</label>
					<input type="text" class="form-control" id="dept_name" value="<%=rList.get(0).get("DEPT_NAME")%>" placeholder="Enter dept" readonly>
				</div>
				<div class="form-group">
					<label for="doctor">담당의</label>
					<input type="text" class="form-control" id="doc_name" value="<%=rList.get(0).get("DOC_NAME")%>" placeholder="Enter doctor" readonly>
				</div>
				<div class="form-group">
					<label for="memo">증상</label>
					<input type="text" class="form-control" id="res_memo" value="<%=rList.get(0).get("RES_MEMO")%>" placeholder="Enter memo" >
				</div>
				<div class="form-group">
				<label for="reserveDate">예약 날짜</label> 
						<input type="text" id="sch_date" readonly value="<%=rList.get(0).get("SCH_DATE")%> "
							class="form-control mb-2" placeholder="date input"> 
<%-- 						<input type="date" id="resDate" value="<%=rList.get(0).get("SCH_DATE")%>"
							class="form-control mb-2" placeholder="date input">  --%>
				</div>
				<div class="form-group">
				<label for="reserveDate">예약 시간</label> 
						<input type="text" id="resTime" value="<%=res_time%>" class="form-control mb-2" placeholder="time input" readonly> 
				</div>
				

			</form>
				<button class="text-center btn btn-primary" onclick="reserve_edit()">
						수정
				</button>
				<button class="text-center btn btn-danger" onclick="reserve_remove()">
						삭제
						</button>
				<button class="text-center btn btn-default btn-outline-secondary" onclick="back()">
						닫기
				</button>
		</div>
</div>

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
							 <button class="btn btn-outline-primary btn-lg" type="button" onClick="p_search()">환자 검색</button>
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
							 <button class="btn btn-outline-primary btn-lg" type="button" onClick="d_search()">의사 검색</button>
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
<!-- 수정 모달 -->
   <div class="modal fade bd-example-modal-sm" id="modal_upd" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
               <!-- head -->
               <div class="modal-header">
                 <h5 class="modal-title">저장 확인창</h5>
               </div>
               <!-- body -->
               <div class="modal-body">
                  <div class="row" style="justify-content: center">
                    <h5 class="modal-title">변경사항을 저장하시겠습니까?</h5>
                 </div>
              </div>
              <!-- footer -->
              <div class="modal-footer">
                 <button type="button" class="btn btn-primary" data-dismiss="modal" onClick="reserve_edit();">저장</button>
                 <button type="button" class="btn btn-primary" data-dismiss="modal" data-dismiss="modal">닫기</button>
               </div>
          </div>
        </div>
   </div>
<!-- 수정 모달 -->


		<script type="text/javascript">
	var doc_code=null;
	
$(document).ready(function(data){
	$("#d_list").bootstrapTable({
		onDblClickRow:function(row, $element, field){
			//의사검색
	 	var jo = JSON.stringify(row);
		var d = JSON.parse(jo);
		var DOC_NAME = d.DOC_NAME;
		var DEPT_NAME = d.DEPT_NAME;
		var DEPT_CODE = d.DEPT_CODE;
		var HP_NAME = d.HP_NAME;
		var HP_CODE = d.HP_CODE;
		var DOC_CODE = d.DOC_CODE;
		$("#hp_name").val(HP_NAME);
		$("#hp_code").val(HP_CODE);
		$("#dept_code").val(DEPT_CODE);
		$("#dept_name").val(DEPT_NAME);
		$("#doc_name").val(DOC_NAME);
		$("#doc_code").val(DOC_CODE);
		 var getDoc_code=$("#doc_code").val();
		 alert("의사코드"+getDoc_code);
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
			alert("호출");
	 		var jo = JSON.stringify(row);
			var d = JSON.parse(jo);
			var SCH_CODE= d.SCH_CODE;
			var SCH_DATE = d.SCH_DATE;
			var SCH_TIME = d.SCH_TIME;
			$("#sch_code").val(SCH_CODE);
			$("#sch_date").val(SCH_DATE);
			$("#sch_time").val(SCH_TIME);
			$("#doctorSearch").modal('hide');
			$("#scheduleSearch").modal('hide');
			$("#modal_upd").modal('show');
	     }
	})
	$("#p_list").bootstrapTable({
		onDblClickRow:function(row, $element, field)
	     { 
			//환자검색
			alert("호출");
	 		var jo = JSON.stringify(row);
			var d = JSON.parse(jo);
			var MEM_MEMCODE = d.MEM_MEMCODE;
			var MEM_NAME= d.MEM_NAME;
			var MEM_SOCIALNUM = d.MEM_SOCIALNUM;
			var MEM_PHONE = d.MEM_PHONE;
			$("#mem_memcode").val(MEM_MEMCODE);
			$("#mem_name").val(MEM_NAME);
			$("#mem_socialnum").val(MEM_SOCIALNUM);
			$("#mem_phone").val(MEM_PHONE);
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