<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부</title>
<%@include file="../../common/ManagerCommon.jsp" %>

</head>
<body>
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
<div class="form-group">
	<label for="InputSubject1">파일첨부</label>
	<input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" tabindex="-1" style="position:absolute;clip:rect(0px 0px 0px 0px);">
	<div class="bootstrap-filestyle input-group">
		<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
		<span class="group-span-filestyle input-group-btn" tabindex="0">
		<label for="fileInput" class="btn btn-default">
		<span class="glyphicon fa fa-upload"></span>
		</label>
		</span>
	</div>
</div>
</body>
</html>