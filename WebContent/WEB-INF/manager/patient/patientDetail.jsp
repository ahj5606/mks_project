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
<title>환자정보 상세보기</title>
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
		     <div class="float-right"> 
			<button class="btn btn-secondary" onclick="sample6_execDaumPostcode()" style="margin-bottom: 10px;">주소 찾기</button>
		     </div>
			<%
				if(null!=pList.get(0).get("MEM_ADDRESS").toString().split(",")){
					String mem_address[] = pList.get(0).get("MEM_ADDRESS").toString().split(",");
					
			%>
				<%if(mem_address.length>1){ %>
				<input type="text" id="address" class="form-control" placeholder="주소" value="<%=mem_address[0]%>" >
				<input type="text" id="detailAddress" class="form-control" placeholder="상세주소" value="<%=mem_address[1]%>" >
				<%}else{
				
				%>
				<input type="text" id="address" class="form-control" placeholder="주소" value="<%=pList.get(0).get("MEM_ADDRESS")%>" >
				<input type="text" id="detailAddress" class="form-control" placeholder="상세주소" value="" >
				<%
					}
				
				%>
			<%
				}
	
			%>
			
	    </div>
	 </div>
		    <input id="h_doc_name" type="hidden" />
		    <input id="h_dept_name" type="hidden" />
		    <input id="h_dept_code" type="hidden" />
		    <input id="h_hp_code" type="hidden" />
		    <input id="h_his_date" type="hidden" />
		    <input id="h_his_content" type="hidden" />
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
				      
				<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" onClick="d_search()">
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
					<br>
				      <table class="table table-hover" id="d_list" data-page-size="10" data-togle="table" data-search="true"  data-pagination="true" data-pagination-loop="false">
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
		$("#doctorSearch").modal('show');
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
			var param ="mem_code="+mem_code+"&doc_name="+doc_name+"&dept_name="+dept_name+"&dept_code="+dept_code+"&doc_code="+doc_code+"&his_content="+modal_content+"&his_date="+his_date+"&hp_name="+hp_name;
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
<!--============================== 카카오 주소 검색 API 시작 ====================================  -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                
                } 
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>