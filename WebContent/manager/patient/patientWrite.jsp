<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date time = new Date();
		String today = format1.format(time);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function back(){
		location.href="/manager/patient/patientList.mgr";
	}
</script>
</head>
<body>
<div style="margin:20px;">
<h2>환자추가</h2>
</div>
<div style="margin-top:30px;margin-bottom:10px;margin-right:10px; margin-left:30px;width:1200px;">
	<div class="row" style="margin-bottom:30px;">
		<div class="col-md-2">
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
					 			 <th scope="col" data-field="DOC_NAME">담당자 이름</th> 	
								 <th scope="col" data-field="DEPT_NAME">부서 이름</th> 
								 <th scope="col" data-field="DEPT_CODE">부서 코드</th>
								 <th scope="col" data-field="DOC_CODE">담당자 코드</th>
								 <th scope="col" data-field="HP_NAME">병원 이름</th>
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

			
	    </div>
	   </div>
	<form id="f_patient">
	   <div class="row" style="margin-bottom:30px;">
		<div class="col-md-2">
			<input id="doc_name"  name="doc_name"type="text" class="form-control" placeholder="담당자" readonly>
		 </div>
		<div class="col-md-2">
			<input id="dept_name" name="dept_name" type="text" class="form-control" placeholder="부서" readonly>
		 </div>
		<div class="col-md-2">
			<input id="dept_code"  name="dept_code" type="text" class="form-control" placeholder="부서코드" readonly>
		 </div>
		<div class="col-md-2">
			<input id="doc_code" name="doc_code" type="text" class="form-control" placeholder="담당자코드" readonly>
		 </div>
		<div class="col-md-2">
			<input id="hp_name" name="hp_name" type="text" class="form-control" placeholder="병원이름" readonly>
		 </div>
		<div class="col-md-2">
			<input id="his_date"  name="his_date" type="text" class="form-control" value="<%=today %>" readonly>
		 </div>
		</div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-8">
		    <label>환자이름</label>
		    <input id="mem_name" name="mem_name" type="text" class="form-control" placeholder="환자이름">
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-6">
		    <label>주민번호</label>
		    <input id="mem_social" name="mem_social" type="text" class="form-control" placeholder="주민번호">
	    </div>
		<div class="col-md-6">
		    <label>전화번호</label>
		    <input id="mem_phone" name="mem_phone" type="text" class="form-control" placeholder="전화번호" >
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>주소</label>
		    <input id="mem_address" name="mem_address" type="text" class="form-control" placeholder="주소">
	    </div>
	 </div>
	 
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>접수내역</label>
		    <input id="his_content" name="his_content" type="text" class="form-control" placeholder="접수내역 입력" style="height:200px;">
	    </div>
	 </div>
	 
	</form>	
	<div class="row">
	  <div class="col-md-12" style="text-align:right;">
	  <!-- 저장 모달  -->
	  		<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#UpdateModal">
					저장
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">확인</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				       			 저장 하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" onClick="p_add()">저장</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
	  		
	  		<!--  저장 모달 -->
		  <button type="button" class="btn btn-default btn-light btn-outline-secondary" onClick="back()">취소</button>
	 </div>
	  </div>
</div>
<script type="text/javascript">
	
	$(document).ready(function(data){
		$("#d_list").bootstrapTable({
			onDblClickRow:function(row, $element, field)
		     { 
				
				var jo = JSON.stringify(row);
				var d = JSON.parse(jo);
				var DOC_NAME = d.DOC_NAME;
				var DEPT_NAME = d.DEPT_NAME;
				var DEPT_CODE = d.DEPT_CODE;
				var DOC_CODE = d.DOC_CODE;
				var HP_NAME = d.HP_NAME;
				$("#doc_name").val(DOC_NAME);
				$("#dept_name").val(DEPT_NAME);
				$("#dept_code").val(DEPT_CODE);
				$("#doc_code").val(DOC_CODE);
				$("#hp_name").val(HP_NAME);
				$("#doctorSearch").modal('hide');
		     }
		})
		$("#d_list").bootstrapTable('hideLoading');
	})
	
	function d_search(){
		$("#d_list").bootstrapTable('refreshOptions', {
		    url:'/manager/patient/patientDoctor.mgr'
	  })
	}
	
	function p_add(){
		var doc_name  =   $("#doc_name").val();		
		var dept_name =  $("#dept_name").val();		
		var dept_code =  $("#dept_code").val();		
		var doc_code =   $("#doc_code").val();		
		var hp_name =    $("#hp_name").val();		
		var his_date =   $("#his_date").val();		
		var mem_name =   $("#mem_name").val();
		var mem_social = $("#mem_social").val();
		var mem_phone =  $("#mem_phone").val();
		var mem_address =$("#mem_address").val();
		var his_content =$("#his_content").val();
		
		var param = "doc_name="+doc_name+"&dept_name="+dept_name+"&dept_code="+dept_code+"&doc_code="+doc_code+"&hp_name="+hp_name+"&his_date="+his_date+"&mem_name="+mem_name+"&mem_social="+mem_social+"&mem_phone="+mem_phone+"&mem_address="+mem_address+"&his_content="+his_content;
		
		$.ajax({
			url:"/manager/patient/patientINS.mgr?"+param
			,success:function(data){
				if(data.trim()=="성공"){
					alert("입력에 성공했습니다.");
					location.href="/manager/patient/patientSEL.mgr";
				}else{
					alert("입력에 실패했습니다.");
					$("#UpdateModal").modal('hide');
					location.href="/manager/patient/mgr_patientWrite.jsp";
				}
			}
			
		})
	}




</script>
</body>
</html>