<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dept = request.getParameter("dept");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function back(){
		location.href="/manager/notice/noticeSEL.mgr";
	}
	function notice_save(){
		alert("저장 버튼 호출 성공");
		//$("#modalBox").modal("show");
<%-- 		var title = $("#notice_title").val();
		var writer = $("#notice_writer").val();
		var content = $("#notice_content").val();
		//alert(title+"/"+writer+"/"+content);

		location.href="/notice/noticeINS.mgr?title="+title+"&writer="+writer+"&content="+content+"&dept="+<%=dept %>; --%>
		$("#notice_write_form").attr('method','get');
		$("#notice_write_form").attr('action','/notice/noticeINS.mgr');
		$("#notice_write_form").submit();
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
		    <input id="notice_title" name="title" type="text" class="form-control" placeholder="제목">
	    </div>
		<div class="col-md-4">
		    <label>작성자</label>
		    <input id="notice_writer" name="writer" type="text" class="form-control" value="<%=dept %>" readonly>
	   </div>
	 </div>
	  
	  <div  class="row" style="margin-bottom:30px;">
	  <div class="col-md-12">
		<span >첨부파일</span>
		<div class="custom-file" style="margin-bottom:30px;margin-top:10px;">
			<div>
			<label id="fileName" name="fileName" class="custom-file-label" for="customFile">첨부파일</label>
			<input type="file" class="custom-file-input" id="board_file" name="board_file">
			</div>
		</div>
		

		<label>내용</label>
	    <input id="notice_content" name="content" type="text" class="form-control" placeholder="     내용을 입력해주세요." style="height:500px;">
	    </div>
	</div>
	<div class="row">
		  <div class="col-md-12" style="text-align:right;">
	
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#saveModal">저장</button>


	<!-- 저장모달창 시작  -->
	<div class="modal fade" id="saveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">저장확인창</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" style="text-align:left;"><p style="margin:10px;">저장하시겠습니까?</p></div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary" onclick="javascript:notice_save()">확인</button>
	        <button type="button" class="btn btn-light btn-outline-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 저장모달창 끝  -->
	
	
	  <button type="button" class="btn btn-default btn-light btn-outline-secondary" onClick="javascript:back()">취소</button>
	 </div>
	  </div>
	</form>	
</div>



</body>
</html>