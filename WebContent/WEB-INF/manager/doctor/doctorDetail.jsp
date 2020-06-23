<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> docDetail = (List<Map<String,Object>>)request.getAttribute("docDetail");
		Map<String,Object> rmap = null;
		if(docDetail==null){
			rmap=docDetail.get(0);
			}
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 상세</title>
<script type="text/javascript">
	function docIns() {
		alert("저장");
		location.href="./docIns.jsp";
	}
	function docUpd() {
		alert("수정");
		location.href="./docUpd.jsp";
	}
	function docDel() {
		alert("삭제");
		location.href="./docDel.jsp";
	}
	function docClose() {
		alert("닫기");
		location.href="./mgr_doctor.jsp";
	}
</script>
	<%@include file="/common/ManagerCommon.jsp" %>
<body>
<div style="margin:20px;">
<h2>의사추가</h2>
</div>
	<div class="container">
  				<div>
	     		<div class="form-group" style="margin-top: 30px">
		      	  <label>의사코드</label>
		      	  <input type="text" class="form-control" id="doc_code" name="doc_code" value="" style="width: 245px">
		    	</div>
			    <div class="form-group">
			      <label>병원코드</label>
			      <input type="text" class="form-control" id="hp_code" name="hp_code" style="width: 245px">
			    </div>
			    <div class="form-group">
			      <label>부서</label>
			      <input type="text" class="form-control" id="dept_name" name="dept_name" style="width: 245px">
			    </div>
			    <div class="form-group">
			      <label>이름</label>
			      <input type="text" class="form-control" id="doc_name" name="doc_name" style="width: 245px">
			    </div>
			    <div class="form-group">
			      <label>직급</label>
			      <input type="text" class="form-control" id="doc_position" name="doc_position" style="width: 245px">
			    </div>
			    </div>
			    
			   	<div>
		    	<div class="form-group">
			      <label>전공</label>
			      <input type="text" class="form-control" id="doc_education" name="doc_education" style="width: 245px">
			    </div>
		    	<div class="form-group">
			      <label>전화</label>
			      <input type="text" class="form-control" id="doc_phone" name="doc_phone" style="width: 245px">
			    </div>
			    <div class="form-group">
			      <label>휴무일</label>
			      <input type="text" class="form-control" id="doc_offday" name="doc_offDay" style="width: 245px">
			    </div>
			    <div class="form-group">
			      <label>상태</label>
			      <input type="text" class="form-control" id="doc_state" name="doc_state" style="width: 245px">
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
				        <button type="button" class="btn btn-primary" onclick="docDel()">저장</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
		    <button type="button" class="btn btn-primary" onclick="docClose()">닫기</button>
		    <!--버튼 끝 -->
		    </div>
	</div>
</body>
</html>