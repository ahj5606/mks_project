<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../../common/bootStrap4UI.jsp" %>
<script type="text/javascript">
	function test(){
		$.ajax({
			url:'/login/login.mgr'
			,success:function(data){
				alert(data);
			}
		})
	}

</script>
</head>
<body>
<button onClick="test()">버튼 </button>

</body>
</html>