<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date time = new Date();
		String today = format1.format(time);
		
	String mem_code = request.getParameter("mem_code");
	List<Map<String, Object>> pList = (List<Map<String, Object>>)request.getAttribute("pList");
	if(pList==null){
		pList = new ArrayList();
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
<h2>환자상세</h2>
</div>
<div style="margin-top:30px;margin-bottom:10px;margin-right:10px; margin-left:30px;width:1200px;">
	<form id="notice_write_form">
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-4">
		    <label>환자번호</label>
		    <input id="mem_code" type="text" class="form-control"  value="<%=pList.get(0).get("MEM_MEMCODE")%>" readonly>
	    </div>
		<div class="col-md-8">
		    <label>환자이름</label>
		    <input id="mem_name" type="text" class="form-control"  value="<%=pList.get(0).get("MEM_NAME")%>">
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-6">
		    <label>주민번호</label>
		    <input id="mem_social" type="text" class="form-control" value="<%=pList.get(0).get("MEM_SOCIALNUM")%>" readonly>
	    </div>
		<div class="col-md-6">
		    <label>전화번호</label>
		    <input id="mem_phone" type="text" class="form-control" value="<%=pList.get(0).get("MEM_PHONE")%>">
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>주소</label>
		    <input id="mem_address" type="text" class="form-control" value="<%=pList.get(0).get("MEM_ADDRESS")%>">
	    </div>
	 </div>
		    <input id="h_doc_name" type="hidden" />
		    <input id="h_dept_name" type="hidden" />
		    <input id="h_dept_code" type="hidden" />
		    <input id="h_hp_code" type="hidden" />
		    <input id="h_his_date" type="hidden" />
		    <input id="h_his_content" type="hidden" />
	</form>	
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>지난진료내역</label>
		    	<div class="float-right">
		    	<!-- 내용 추가 모달  -->
				<button type="button" class="btn btn-default btn-light btn-outline-success" data-toggle="modal" data-target="#his_add_modal">
					내역 추가
				</button>
				<div class="modal fade" id="his_add_modal" tabindex="-1" role="dialog" aria-hidden="true">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="Search">내역추가</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      
				<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#doctorSearch">
					담당자 검색
				</button>
				      <!--  -->
				     <form id="f_history">
					<div class="row" style="margin-bottom:30px; margin-top: 30px;">
						<div class="col-md-2">
							<input id="modal_docname" name="doc_name" type="text" class="form-control" placeholder="담당자" readonly>
						 </div>
						<div class="col-md-2">
							<input id="modal_deptname" name="dept_name" type="text" class="form-control" placeholder="부서" readonly>
						 </div>
						<div class="col-md-2">
							<input id="modal_deptcode" name="dept_code" type="text" class="form-control" placeholder="부서코드" readonly>
						 </div>
						<div class="col-md-3">
							<input id="modal_doccode" name="doc_code" type="text" class="form-control" placeholder="담당자 코드" readonly>
						 </div>
						<div class="col-md-4">
							<input id="modal_date" name="his_date" type="text" class="form-control" value="<%=today %>" readonly>
						 </div>
						<div class="col-md-2">
							<input id="modal_hp_name" name="his_date" type="text" class="form-control" placeholder="병원 이름"   readonly>
						 </div>
					</div>
					<div class="row" style="margin-bottom:30px; margin-top: 30px;">
					 	<div class="col-md-12">
							<input id="modal_content" name="his_content" type="text" class="form-control" placeholder="내용입력" style="height: 200px;">
					</div>
						</div>		      
				      <!--  -->
				     </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" onClick="history_add()">저장</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>			    	
		    	<!-- 담당자 모달  -->
		    	<div class="modal" id="doctorSearch" aria-hidden="true" style="display: none; z-index: 1060;">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="Search">담당자 검색</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
		    	
		    	<!--담당자 모달   -->
		    	<!-- 내용 추가 모달  -->
			      	</div>
		    <table class="table table-hover" id="p_list" data-page-size="10">
		    		<thead class="thead-dark">
					    <tr>
						  <th scope="col" data-field="MEM_MEMCODE">환자번호</th> 	
						  <th scope="col" data-field="HIS_CONTENT">내용</th> 	
						  <th scope="col" data-field="DOC_NAME">의사</th> 	
						  <th scope="col" data-field="DEPT_NAME">부서</th> 	
					    </tr>
					 </thead>
					 <tbody>
					 <%
					 	for(int i=0;i<pList.size();i++){
					 		
					 %>
					 	<tr>
					 	<td><%=pList.get(i).get("MEM_MEMCODE") %></td>
					 	<td><%=pList.get(i).get("HIS_CONTENT") %></td>
					 	<td><%=pList.get(i).get("DOC_NAME") %></td>
					 	<td><%=pList.get(i).get("DEPT_NAME") %></td>
					 	</tr>
					 <%
					 	}
					 %>
					 </tbody>
		    </table>
	    </div>
	 </div>
	 
	<div class="row">
	  <div class="col-md-12" style="text-align:right;">
	  		<!-- 삭제 모달  -->
				<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#DeleteModal">
					 삭제
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">확인</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				       			 삭제하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" onClick="his_delete()">삭제</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>

	  		<!-- 삭제 모달  -->
	  		<!-- 수정 모달  -->
	  		<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#UpdateModal">
					 수정
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
				       			 수정 하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" onClick="mem_update()">수정</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
	  		
	  		<!--  수정 모달 -->
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
				$("#modal_docname").val(DOC_NAME);
				$("#modal_deptname").val(DEPT_NAME);
				$("#modal_deptcode").val(DEPT_CODE);
				$("#modal_doccode").val(DOC_CODE);
				$("#modal_hp_name").val(HP_NAME);
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
	function history_add(){
		var doc_name =$("#modal_docname").val();
		var dept_name =$("#modal_deptname").val();
		var dept_code =$("#modal_deptcode").val();
		var doc_code =$("#modal_doccode").val();
		var  mem_code =$("#mem_code").val();
		var  modal_content= $("#modal_content").val();
		var his_date = $("#modal_date").val();
		var hp_name =$("#modal_hp_name").val();
		if(doc_name==""){
			alert("내용을 입력하세요");
		}else 
		 if(modal_content==""){
			alert("내용을 입력하세요");
		}else{
			var param ="mem_code="+mem_code+"&doc_name="+doc_name+"&dept_name="+dept_name+"&dept_code="+dept_code+"&doc_code="+doc_code+"&modal_content="+modal_content+"&his_date="+his_date+"&hp_name="+hp_name;
			location.href="/manager/patient/patientHISINS.mgr?"+param; 
			
			
		}
	}
	function back(){
		location.href="/manager/patient/patientList.mgr";
		
	}
	function his_delete(){
		var  mem_code =$("#mem_code").val();
		location.href="/manager/patient/patientDEL.mgr?mem_code="+mem_code;
	}
	function mem_update(){
		var mem_code =$("#mem_code").val();
		var mem_name =$("#mem_name").val();
		var mem_phone =$("#mem_phone").val();
		var mem_address =$("#mem_address").val();
		var param ="mem_code="+mem_code+"&mem_name="+mem_name+"&mem_phone="+mem_phone+"&mem_address="+mem_address;
		$.ajax({
			url:"/manager/patient/patientUPD.mgr?"+param
			,success:function(data){
				if(data.trim()=="성공"){
					alert("정보수정에 성공했습니다.");
					location.href="/manager/patient/patientDetail.mgr?mem_code="+mem_code
				}else{
					alert("정보수정에 실패했습니다.");
					$("#UpdateModal").modal('hide');
				}
			}
			
		})
	}
	
</script>
</body>
</html>