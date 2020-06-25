<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 상세</title>
<script type="text/javascript">
	function docIns() {
		alert("저장호출 성공");
		$("#f_doctor").attr("method","get");
		$("#f_doctor").attr("action","./doctorINS.mgr");
		$("#f_doctor").submit();
	}
	function docUpd() {
		alert("수정호출 성공");
		$("#f_doctor").attr("method","get");
		$("#f_doctor").attr("action","./doctorUPD.mgr");
		$("#f_doctor").submit();
	}
	function docDel() {
		alert("삭제호출 성공");
		$("#f_doctor").attr("method","get");
		$("#f_doctor").attr("action","./doctorDEL.mgr");
		$("#f_doctor").submit();
	}
	function docClose() {
		alert("닫기");
		location.href="./doctorList.mgr";
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
	     		<div class="form-group" style="margin-top: 30px">
		      	  <input type="text" class="form-control" id="doc_code" name="doc_code" placeholder="의사코드" style="width: 245px">
		    	</div>
			    <div class="form-group">
			      <input type="text" class="form-control" id="hp_code" name="hp_code" placeholder="병원코드" style="width: 245px">
			    </div>
			    <div class="form-group">
			      <input type="text" class="form-control" id="dept_name" name="dept_name" placeholder="부서" style="width: 245px">
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
			      <input type="text" class="form-control" id="doc_education" name="doc_education" placeholder="전공" style="width: 245px">
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
			    <div class="form-group">
			      <input type="text" class="form-control" id="dept_code" name="dept_code" placeholder="부서코드" style="width: 245px">
			    </div>
			    <div class="form-group">
			      <input type="text" class="form-control" id="hp_name" name="hp_name" placeholder="병원이름" style="width: 245px">
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
	</div>
</body>
</html>