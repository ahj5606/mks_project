<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file ="../common/bootStrap4UI.jsp" %>
<style type="text/css">
 	#sidebar{
 		margin-top: 100px
 	}
 	#sticky-sidebar{
 		margin-left: 100px;
 	}
</style>
</head>
<body>
<div class="container-fluid" id="sidebar">
    <div class="row">
        <div class="col-3 px-1" id="sticky-sidebar">
	        <button type="button" class="btn btn-secondary btn-lg">Large button</button>
	        <button type="button" class="btn btn-secondary btn-lg">Large button</button>
	        <button type="button" class="btn btn-secondary btn-lg">Large button</button>
	        <button type="button" class="btn btn-secondary btn-lg">Large button</button>
	        <button type="button" class="btn btn-secondary btn-lg">Large button</button>
        </div>
        <div class="col offset-3" id="main">
            <h1>Main Area</h1>
            ...
        </div>
    </div>
</div>
</body>
</html>