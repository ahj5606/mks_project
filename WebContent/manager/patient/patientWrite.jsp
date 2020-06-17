<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_code = request.getParameter("mem_code");

	String DOC_NAME = request.getParameter("DOC_NAME");
	String DEPT_NAME = request.getParameter("DEPT_NAME");
	String DEPT_CODE = request.getParameter("DEPT_CODE");
	String DOC_CODE = request.getParameter("DOC_CODE");
	if(DOC_NAME==null || DEPT_NAME==null || DEPT_CODE==null || DOC_CODE==null){
		DOC_NAME="";
		DEPT_NAME ="";
		DEPT_CODE ="";
		DOC_CODE  ="";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function back(){
		location.href="./s_table.jsp";
	}
	function notice_save(){
		alert("저장 버튼 호출 성공");
		var title = $("#notice_title").val();
		var writer = $("#notice_writer").val();
		var content = $("#notice_content").val();
		//alert(title+"/"+writer+"/"+content);
		$("#notice_write_form").attr('method','get');
		$("#notice_write_form").attr('action','./save.jsp');
		$("#notice_write_form").submit();
	}
</script>
</head>
<body>
<div style="margin:20px;">
<h2>환자추가</h2>
</div>
<div style="margin-top:30px;margin-bottom:10px;margin-right:10px; margin-left:30px;width:1200px;">
	<div class="row" style="margin-bottom:30px;">
		<div class="col-md-9">

			
			
			
			
			
			<!--  -->
			<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#patientSearch">
					환자 검색
				</button>
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
							 <button class="btn btn-outline-primary btn-lg" type="button" onClick="p_search()">기록 환자 검색</button>
					 </div>
					 <br>
				      <table class="table table-hover" id="p_list" data-page-size="10" data-search="true">
						<thead>
						 	<tr>
							  <th scope="col" data-field="MEM_MEMCODE">환자번호</th> 	
							  <th scope="col" data-field="MEM_NAME">환자이름</th> 
							  <th scope="col" data-field="MEM_SOCIALNUM">주민등록번호</th>
							  <th scope="col" data-field="MEM_PHONE">전화번호</th>
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
			<!--  -->
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
								 <th scope="col" data-field="DEPT_CODE" data-visible="false">부서 코드</th>
								 <th scope="col" data-field="DOC_CODE" data-visible="false">담당자 코드</th>
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


			<!-- 담당자 검색 -->
			
			
	    </div>
	   </div>
	<form id="notice_write_form">
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-4">
		    <label>환자번호</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="환자번호">
	    </div>
		<div class="col-md-8">
		    <label>환자이름</label>
		    <input id="notice_writer" type="text" class="form-control" placeholder="환자이름">
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-6">
		    <label>주민번호</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="주민번호">
	    </div>
		<div class="col-md-6">
		    <label>전화번호</label>
		    <input id="notice_writer" type="text" class="form-control" placeholder="전화번호" >
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>주소</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="주소">
	    </div>
	 </div>
	 
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>접수내역</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="접수내역 입력" style="height:200px;">
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
				        <button type="button" class="btn btn-primary">저장</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
	  		
	  		<!--  저장 모달 -->
		  <button type="button" class="btn btn-default btn-light btn-outline-secondary" onClick="javascript:back()">취소</button>
	 </div>
	  </div>
</div>
<script type="text/javascript">
	function p_search(){
		$.ajax({
			url:'/manager/patient/patientSEL.mgr?mem_name=&mem_socialnum=&isJSON=true'
			,dataType:'json'
			,success:function(data){
				$("#p_list").bootstrapTable({ data: data });
				$("#p_list").bootstrapTable('hideLoading');
				
			}
		})
		
	/* $table.bootstrapTable('refreshOptions', {
        showColumns: true,
        search: true,
        showRefresh: true,
        url: 'json/data1.json'
      }) */
	}
	function d_search(){
		$.ajax({
			url:'/manager/patient/patientDoctor.mgr'
			,dataType:'json'
			,success:function(data){
				$("#d_list").bootstrapTable({ data: data });
				$("#d_list").bootstrapTable('hideLoading');
				
			}
			
		})
		
	}
	




</script>
</body>
</html>