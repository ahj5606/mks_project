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
		//alert("저장 버튼 호출 성공"+$("#userfile").val());
		//$("#modalBox").modal("show");
 		//var title = $("#notice_title").val();
		//var writer = $("#notice_writer").val();
		//var content = $("#notice_content").val();
		//var board_file = $("#board_file").val();
		//var board_file = $("#userfile").val();
		

		//alert(title+"/"+writer+"/"+content);
		//alert("board_file=>"+board_file);
<%-- 		location.href="/manager/notice/noticeINS.mgr?title="+title+"&writer="+writer+"&content="+content+"&dept=<%=dept %>&board_file="+board_file; 
 --%>
 /* 		$("#notice_write_form").attr('method','get');
		$("#notice_write_form").attr('action','/notice/noticeINS.mgr'); */
		$("#notice_write_form").submit();
	}

</script>
</head>
<body>
<div style="margin:30px;">
<h2>글쓰기</h2>
</div>
<form id="notice_write_form" enctype="multipart/form-data" action="/manager/notice/noticeINS.mgr" method="post">
<div style="margin-top:30px;margin-bottom:10px;margin-right:10px; margin-left:30px;width:1200px;">
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-8">
		    <label>제목</label>
		    <input id="notice_title" style="margin-top:8px;" value="새움병원 도수치료 이전 안내"name="board_title" type="text" class="form-control" placeholder="제목">
	    </div>
		<div class="col-md-4">
		    <label>작성자</label>
		    <input id="notice_writer" style="margin-top:8px;" name="writer" type="text" class="form-control" value="<%=dept_name %>" readonly>
	   </div>
	 </div>
	  
	  <div  class="row" style="margin-bottom:30px;">
	  <div class="col-md-12">
<!-- 		
		<span >첨부파일</span>
		<div class="custom-file" style="margin-bottom:30px;margin-top:10px;">
			<div>
			<label id="fileName" name="fileName" class="custom-file-label" for="customFile">첨부파일</label>
			<input type="file" class="custom-file-input" id="board_file" name="board_file">
			</div>
		</div>
		 -->
		 
		<!--  <div>
			<label for="InputSubject1">파일첨부</label>
			<input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default btn-outline-secondary" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" tabindex="-1" style="position:absolute;clip:rect(0px 0px 0px 0px);">
			<div class="bootstrap-filestyle input-group">
				<input type="text" id="userfile" class="form-control" name="board_file" disabled="">
				<span class="group-span-filestyle input-group-btn" tabindex="0">
				<span class="glyphicon fa fa-upload"></span>
				</label>
				</span>
			</div>
		</div> -->
		
		<div class="form-group">
			<label for="InputSubject1">파일첨부</label>
			<div style="margin-top:8px;">
			<input id="fileInput" filestyle=""  value="" type="file" name="board_file"data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" tabindex="-1" style="position:absolute;clip:rect(0px 0px 0px 0px);">
			</div>
			<div class="bootstrap-filestyle input-group">
				<input type="text" id="userfile" class="form-control"  disabled="" >
				<span class="group-span-filestyle input-group-btn" tabindex="0">
				<label for="fileInput" class="btn btn-default btn-outline-primary" style="margin-left:5px;">
				<span class="glyphicon fa fa-upload"></span>
				</label>
				</span>
			</div>
		</div>

		<label style="margin-top:8px;">내용</label>
		<!-- 
	    <input id="notice_content" name="board_content" multiline=true type="text" class="form-control" placeholder="     내용을 입력해주세요." style="height:500px; ">
	     -->
	     <div style="margin-left:-4px;">
	     <textarea class="form-control ml-1" rows="10" style="margin-top:8px;" name="board_content" id="notice_content" placeholder="내용을 입력해 주세요" >
새움병원 도수치료가 보다 넓고 쾌적한 환경에서 환자분들께 더욱 높은 만족도를 드리기 위해 장소를 이전하였습니다!

	[기존] 별관 3층 
			▼
	[이전] 별관 4층
	
도수치료를 받는 분들은 혼동하지 마시고!!

새움병원 별관 4층을 찾아주세요^^</textarea>
	    </div>
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
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$("#fileInput").on('change',function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		}else{
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$("#userfile").val(filename);
	});
});

</script>


</body>
</html>