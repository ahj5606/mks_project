<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_code = request.getParameter("mem_code");

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
<h2>환자추가</h2>
</div>
<div style="margin-top:30px;margin-bottom:10px;margin-right:10px; margin-left:30px;width:1200px;">
	<form id="notice_write_form">
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-4">
		    <label>환자번호</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="제목">
	    </div>
		<div class="col-md-8">
		    <label>환자이름</label>
		    <input id="notice_writer" type="text" class="form-control" placeholder="환자이름">
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-6">
		    <label>주민번호</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="주민번호">
	    </div>
		<div class="col-md-6">
		    <label>전화번호</label>
		    <input id="notice_writer" type="text" class="form-control" placeholder="전화번호">
	   </div>
	 </div>
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>주소</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="주소">
	    </div>
	 </div>
	 
	  <div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
		    <label>진료내역</label>
		    <input id="notice_title" type="text" class="form-control" placeholder="진료내역 입력" style="height:200px;">
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