<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원관리</title>

<%@ include file ="/common/ManagerCommon.jsp" %>
</head>
<body>

<!-- 리스트 처리 시작  -->
	<div>
		asds
	</div>
	
	<div class="container-fluid" id="sidebar">
	    <div class="row">
	    	<div class="col-sm-8" id="main">
	        	<div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-doctor" role="tabpanel" aria-labelledby="list-doctor-list">
			      	<table id="doc_list" class="table table-sm">
					  <thead>
					    <tr>
						  <th scope="col" data-field="subject">전공</th> 	
						  <th scope="col" data-field="name">이름</th> 
						  <th scope="col" data-field="edu">학력</th>
						  <th scope="col" data-field="docCode">의사코드</th>
						  <th scope="col" data-field="phoneNum">전화</th>
						  <th scope="col" data-field="state">상태</th>
					    </tr>
					  </thead>
					</table>
			      </div>
			      </div>
	        </div>
	    </div>
	</div>
	<div>
	asd
	</div>
<!-- 리스트 처리 끝  -->
<script type="text/javascript">
	$(document).ready(function(){
		doc_list();
	});
</script>
</body>
</html>