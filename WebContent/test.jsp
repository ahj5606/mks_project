<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/common/ManagerCommon.jsp" %>
<script type="text/javascript">
	function send(){
		var s_file=$("#fileInput").val();
		alert(s_file)
		$("#f").submit();
	}
</script>
</head>
<body>



<form id="f" enctype="mulipart/form-data" method="post" action="./form.jsp" >
	<input id="fileInput" filestyle="" type="file" name="s_file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
	<div class="bootstrap-filestyle input-group">
		<span class="group-span-filestyle input-group-btn" tabindex="0">
			<label for="fileInput" class="btn btn-default">
				<span class="glyphicon fa fa-upload"></span>
			</label>
		</span>
	</div>
</form>
	
<button onClick="send()">전송버튼</button>

</body>
</html>