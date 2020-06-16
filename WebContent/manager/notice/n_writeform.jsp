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
<h2>글쓰기</h2>
</div>
<div style="margin-top:30px;margin-bottom:10px;margin-right:10px; margin-left:30px;width:1200px;">
	<form id="notice_write_form">
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-8">
		    <label>제목</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="제목">
	    </div>
		<div class="col-md-4">
		    <label>작성자</label>
		    <input id="notice_writer" type="text" class="form-control" value="<%=dept %>" readonly>
	   </div>
	 </div>
	  <div  class="row" style="margin-bottom:30px;">
	  <div class="col-md-12">
		<label>내용</label>
	    <input id="notice_content" type="text" class="form-control" placeholder="     내용을 입력해주세요." style="height:500px;">
	    </div>
	</div>
	<div class="row">
		  <div class="col-md-12" style="text-align:right;">
	  <button type="submit" class="btn btn-default btn-light btn-outline-secondary" onclick="javascript:notice_save()">저장</button>
	  <button type="button" class="btn btn-default btn-light btn-outline-secondary" onClick="javascript:back()">취소</button>
	 </div>
	  </div>
	</form>	
</div>
</body>
</html>