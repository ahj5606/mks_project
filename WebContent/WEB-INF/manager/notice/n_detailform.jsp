<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> nList = (List<Map<String,Object>>)request.getAttribute("nList");
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
		//$("#modalBox").modal("show");
/* 		var title = $("#notice_title").val();
		var writer = $("#notice_writer").val();
		var content = $("#notice_content").val();
		//alert(title+"/"+writer+"/"+content);
		$("#notice_write_form").attr('method','get');
		$("#notice_write_form").attr('action','./save.jsp');
		$("#notice_write_form").submit(); */
	}
	function notice_update(){
		alert("수정 확인 버튼 호출 성공");
		
	}
	function notice_delete(){
		alert("삭제 확인 버튼 호출 성공");
	}
</script>
</head>
<body>
<div style="margin:20px;">
<h2>글쓰기</h2>
</div>
<div style="margin-top:30px;margin-bottom:10px;margin-right:10px; margin-left:30px;width:1200px;">
	<form id="notice_write_form">
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-8">
		    <label>제목</label>
		    <input id="notice_title" name="title" type="text" class="form-control" placeholder="제목" value="<%=nList.get(0).get("BOARD_TITLE") %>">
	    </div>
		<div class="col-md-4">
		    <label>작성자</label>
		    <input id="notice_writer" name="writer" type="text" class="form-control" value="<%=nList.get(0).get("DEPT_NAME") %>" readonly>
		    <input data-visible="false" id="mks_id" name="mks_id" type="text" class="form-control" value="<%=nList.get(0).get("MKS_ID") %>" readonly>
	   </div>
	 </div>
	  <div  class="row" style="margin-bottom:30px;">
	  <div class="col-md-12">
		<label>내용</label>
	    <input id="notice_content" name="content" type="text" class="form-control" value="<%=nList.get(0).get("BOARD_CONTENT") %>" placeholder="     내용을 입력해주세요." style="height:500px;">
	    </div>
	</div>
	<div class="row">
		  <div class="col-md-12" style="text-align:right;">
			
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal">수정</button>
		
			<!-- 수정모달창 시작  -->
			<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">수정확인창</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" style="text-align:left;"><p style="margin:10px;">수정하시겠습니까?</p></div>
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-primary" onclick="javascript:notice_update()">확인</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 수정모달창 끝  -->
			
			
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal">삭제</button>
		
			<!-- 삭제모달창 시작  -->
			<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">삭제확인창</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body" style="text-align:left;"><p style="margin:10px;">삭제하시겠습니까?</p></div>
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-primary" onclick="javascript:notice_delete()">확인</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 삭제모달창 끝  -->
	
	
	
	  <button type="button" class="btn btn-default btn-light btn-outline-secondary" onClick="javascript:back()">취소</button>
	 </div>
	  </div>
	</form>	
</div>



</body>
</html>