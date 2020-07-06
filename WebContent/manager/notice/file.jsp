<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = "2.PNG";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부</title>
<%@include file="../../common/ManagerCommon.jsp"%>
<!--  id="f_file" action="modal.jsp" method="post" enctype="multipart/form-data" -->
<script type="text/javascript">
	function send(){
		$("#f").submit();
	}
</script>
</head>
<body>
	<form id="f" enctype="mulipart/form-data" method="post" action="downLoad.jsp" >
		  
		   <input id="fileInput" filestyle="" type="file" name="s_file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
		 
		   <div class="bootstrap-filestyle input-group">
		     <a><label type="text" id="userfile" class="form-control"  value="<%=name%>" ></label>
		      </a> 
		      <span class="group-span-filestyle input-group-btn" tabindex="0">
		         <label for="fileInput" class="btn btn-default">
		            <span class="glyphicon fa fa-upload"></span>
		         </label>
		      </span>
		</div>

	</form>
	<button onclick="send()">전송</button>
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


