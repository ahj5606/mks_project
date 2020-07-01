<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 상세</title>
<script type="text/javascript">
	function docIns() {
		//alert("저장호출 성공");
		$("#f_doctor").attr("method","get");
		$("#f_doctor").attr("action","./doctorINS.mgr");
		$("#f_doctor").submit();
		
	}
	function docDel() {
		//alert("삭제호출 성공");
		$("#f_doctor").attr("method","get");
		$("#f_doctor").attr("action","./doctorDEL.mgr");
		$("#f_doctor").submit();
	}
	function docClose() {
		//alert("닫기");
		location.href="./doctorList.mgr";
	}
	$(document).ready(function(data){
		$("#d_list").bootstrapTable({
			onDblClickRow:function(row, $element, field)
		     { 
				var jo = JSON.stringify(row);
				var d = JSON.parse(jo);
				var DEPT_CODE = d.DEPT_CODE;
				var DEPT_NAME = d.DEPT_NAME;
				var HP_NAME = d.HP_NAME;
				var HP_CODE = d.HP_CODE;
				$("#dept_code").val(DEPT_CODE);
				$("#dept_name").val(DEPT_NAME);
				$("#hp_name").val(HP_NAME);
				$("#hp_code").val(HP_CODE);
				$("#deptSearch").modal('hide');
		     }
		})
		$("#d_list").bootstrapTable('hideLoading');
	})
	
	function d_search(){
		var hp_code= "280HP";
		$("#d_list").bootstrapTable('refreshOptions', {
			    url:'/manager/doctor/deptSearch.mgr?hp_code='+hp_code
		  })
	}
	
	
</script>
	 <%@include file="../../common/ManagerCommon.jsp" %> 
<body>
<div style="margin:20px;">
<h2>의사추가</h2>
</div>

	<div class="container">
	<form id="f_doctor">
  				<div>
			    <div class="form-group">
			        <input type="text" class="form-control" id="dept_code" name="dept_code" placeholder="부서코드" style="width: 245px"readonly>
			        <button style="margin-top: 10px" type="button" class="btn btn-default btn-light btn-outline-secondary" data-toggle="modal" data-target="#deptSearch">부서코드</button>
			    </div>
	     		<div class="form-group" style="margin-top: 30px">
	     		    <input type="text" class="form-control" id="hp_code" name="hp_code" placeholder="병원코드" style="width: 245px"readonly>
			    </div>
			    <div class="form-group">
			    	<input type="text" class="form-control" id="dept_name" name="dept_name" placeholder="부서" style="width: 245px"readonly>
			    </div>
			    <div class="form-group">
			        <input type="text" class="form-control" id="hp_name" name="hp_name" placeholder="병원이름" style="width: 245px" readonly>
			    </div>
			    <div class="form-group">
		      	    <input type="text" class="form-control" id="doc_code" name="doc_code" placeholder="의사코드" style="width: 245px">
		    	</div>
			    <div class="form-group">
			        <input type="text" class="form-control" id="doc_name" name="doc_name" placeholder="이름" style="width: 245px">
			    </div>
			    <div class="form-group">
			       <input type="text" class="form-control" id="doc_position" name="doc_position" placeholder="직급" style="width: 245px">
			    </div>
			    </div>
			    <div>
		    	<div class="form-group">
		    	   <input type="text" class="form-control" id="doc_education" name="doc_education" placeholder="학력" style="width: 245px">
			    </div>
		    	<div class="form-group">
		    	   <input type="text" class="form-control" id="doc_phone" name="doc_phone" placeholder="전화"style="width: 245px">
			    </div>
			    <div class="form-group">
			       <input type="text" class="form-control" id="doc_offday" name="doc_offday" placeholder="휴무일" style="width: 245px">
			    </div>
			    <div class="form-group">
			       <input type="text" class="form-control" id="doc_state" name="doc_state" placeholder="상태" style="width: 245px">
			    </div>
		    	</div>
		    <div>
		    
		    <!--버튼시작  -->
		    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#InsertModal">
					저장
				</button>
				<!-- Modal -->
				<div class="modal fade" id="InsertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
				        <button type="button" class="btn btn-primary" onclick="docIns()">저장</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
		    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#UpdateModal">
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
				        <button type="button" class="btn btn-primary" onclick="docUpd()">저장</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
		    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#DeleteModal">
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
				       			삭제 하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" onclick="docDel()">확인</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
		    <button type="button" class="btn btn-primary" onclick="docClose()">닫기</button>
		    <!--버튼 끝 -->
		    </div>
		 </form>
		 <!-- 부서검색 모달창 -->
		<div class="modal" id="deptSearch" aria-hidden="true" style="display: none; z-index: 1060;">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="Search">부서 검색</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				      </div>
				      <div class="modal-body">
				      <div>
				      <div class='text-center'>
							 <button class="btn btn-outline-primary btn-lg" type="button" onClick="d_search()">부서 검색</button>
					</div>
					<br>
				      <table class="table table-hover" id="d_list" data-page-size="10" data-search="true"  data-pagination="true" data-pagination-loop="false">
						<thead>
						 	<tr>
								 <th scope="col" data-field="DEPT_CODE">부서 코드</th>
					 			 <th scope="col" data-field="DEPT_NAME">부서 이름</th> 
								 <th scope="col" data-field="HP_NAME">병원 이름</th>
								 <th scope="col" data-field="HP_CODE">병원 코드</th>
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
</body>
</html>