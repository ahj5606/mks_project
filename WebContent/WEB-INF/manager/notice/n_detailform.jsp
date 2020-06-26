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
		location.href="/manager/notice/noticeSEL.mgr";
	}

	function notice_update(){
		alert("수정 확인 버튼 호출 성공");
/* 		var title = $("#notice_title").val();
		alert("title=>"+title);
		var no = $("#notice_no").val();
		var writer = $("#notice_writer").val();
		var content = $("#notice_content").val();
		var file = $("#userfile").val();
		var param = "title="+title+"&wrtier="+writer+"&content="+content+"&no="+no+"&board_file="+file;
		alert(title+"/"+writer+"/"+content);
		alert("param=>"+param);
		$.ajax({
			method:'get'
			,url:"/manager/notice/noticeUPD.mgr"
			,data:param
			,success:function(data){
				alert("data=>"+data);
				if(data.trim()=="성공"){
					alert("수정성공");
					location.href="/manager/notice/noticeSEL.mgr";
				}else{
					alert("수정실패");
				}
			}
		}); 
		 */
		$("#notice_detail_form").submit();

		
	}
	function notice_delete(){
		alert("삭제 확인 버튼 호출 성공");
	/* 	var no = $("#notice_no").val();
		var param = "no="+no;
		alert("param=>"+param);
		$.ajax({
			method:'get'
			,url:"/manager/notice/noticeDEL.mgr"
			,data:param
			,success:function(data){
				alert("data=>"+data);
				if(data.trim()=="성공"){
					alert("삭제성공");
					location.href="/manager/notice/noticeSEL.mgr";
				}else{
					alert("삭제실패");
				}
			}
		}); */
		
		$("#notice_detail_form").attr('action','/manager/notice/noticeDEL.mgr?board_no=<%=nList.get(0).get("BOARD_NO") %>');
		$("#notice_detail_form").submit();
	}
</script>
<style type="text/css">
	.table{
		border-radius: 10px 10px 10px 10px;
	}
</style>
</head>
<body>
<div style="margin:20px;">
<h2>상세보기</h2>
</div>
<div style="margin-top:30px;margin-bottom:10px;margin-right:10px; margin-left:30px;width:1200px;">
 
<form id="notice_detail_form" action="/manager/notice/noticeUPD.mgr" method="post" enctype="multipart/form-data">

  <div class="row" style="margin-bottom:30px;">
	<div class="col-md-8">
		<input id="notice_no" name="board_no" type="hidden" class="form-control" placeholder="제목" value="<%=nList.get(0).get("BOARD_NO") %>">
	    <label>제목</label>
	    <input id="notice_title" name="board_title" type="text" class="form-control" placeholder="제목" value="<%=nList.get(0).get("BOARD_TITLE") %>">
    </div>
	<div class="col-md-4">
	    <label>작성자</label>
	    <input id="notice_writer" name="writer" type="text" class="form-control" value="<%=nList.get(0).get("DEPT_NAME") %>" readonly>
   </div>
 </div>
  <div  class="row" style="margin-bottom:30px;">
  <div class="col-md-12">
  
<%-- 		 <div class="form-group">
			<label for="InputSubject1">파일첨부</label>
			<input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default btn-outline-secondary" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" tabindex="-1" style="position:absolute;clip:rect(0px 0px 0px 0px);">
			<div class="bootstrap-filestyle input-group">
			<a href="downLoad.jsp?board_file=<%=nList.get(0).get("BOARD_FILE") %>"><%=nList.get(0).get("BOARD_FILE") %></a>
			
				<input type="text" id="userfile" class="form-control" name="board_file" value="<%=nList.get(0).get("BOARD_FILE") %>" disabled="">
				
				<span class="group-span-filestyle input-group-btn" tabindex="0">
				<label for="fileInput" class="btn btn-default btn-outline-secondary">
				<span class="glyphicon fa fa-upload"></span>
				</label>
				</span>
			</div>
		</div> --%>
		
		<div class="form-group">
			<label for="InputSubject1">파일첨부</label>
			<input id="fileInput" type="file" value="<%=nList.get(0).get("BOARD_FILE") %>" name="board_file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" tabindex="-1" style="position:absolute;clip:rect(0px 0px 0px 0px);">
			<div class="bootstrap-filestyle input-group" style="margin-left:-15px;">
			<div class="col">
				<table class="table table-bordered" >
				<tr><td style="background-color: #ffffff">
				<a  href="downLoad.jsp?board_file=<%=nList.get(0).get("BOARD_FILE") %>"><input id="userfile" style="border:none"value="<%=nList.get(0).get("BOARD_FILE") %>"></a>
				</td></tr>
				</table>
				</div>
				<span class="group-span-filestyle input-group-btn" tabindex="0">
				<label for="fileInput" class="btn btn-default  btn-outline-primary" style="padding:12px;">
				<span class="glyphicon fa fa-upload"></span>
				</label>
				</span>
			</div>
		</div>
		
	<label>내용</label>
	<%-- 
    <input id="notice_content" name="content" type="text" class="form-control" value="<%=nList.get(0).get("BOARD_CONTENT") %>" placeholder="     내용을 입력해주세요." style="height:500px;">
     --%>
     <textarea class="form-control" rows="10" name="board_content" id="board_content" placeholder="내용을 입력해 주세요" ><%=nList.get(0).get("BOARD_CONTENT") %></textarea>
    </div>
</div>
</form>
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
</div>
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