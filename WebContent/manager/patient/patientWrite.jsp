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
<title>환자 입력</title>
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
			<button type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" onClick="d_search()">
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
					<br>
				      <table class="table table-hover" id="d_list" data-page-size="10" data-togle="table" data-search="true" data-search="true"  data-pagination="true" data-pagination-loop="false">
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
		    <!-- 
		    <input id="mem_address" name="mem_address" type="text" class="form-control" placeholder="주소">
		     -->
		     <div class="float-right"> 
			<button class="btn btn-secondary" onclick="sample6_execDaumPostcode()" style="margin-bottom: 10px;">주소 찾기</button>
		     </div>
			<input type="text" id="address" class="form-control" placeholder="주소">
			<input type="text" id="detailAddress" class="form-control" placeholder="상세주소">
	    </div>
	 </div>
	 
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>접수내역</label>
		    <input id="his_content" name="his_content" type="text" class="form-control" placeholder="접수내역 입력" style="height:200px;">
	    </div>
	 </div>
	 
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
		$("#doctorSearch").modal('show');
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
		var his_content =$("#his_content").val();
		var address =$("#address").val();
		var detailaddress =$("#detailAddress").val();
		var mem_address =address+","+detailaddress;
		if(doc_name==""){
			alert("담당을 선택하세요");
		}else if(mem_name==""){
			alert("이름을 입력하세요");
		}else  if(mem_social==""){
			alert("주민번호를 입력하세요");
		}else if(mem_phone==""){
			alert("전화번호를 입력하세요");
		}else if(mem_address==""){
			alert("주소 입력하세요");
		}else if(his_content==""){
			alert("내용을 입력하세요");
		}else if(doc_code==""){
			alert("담당을 선택하세요");
		}else if(dept_code==""){
			alert("담당을 선택하세요");
		}else {
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