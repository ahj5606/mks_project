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
<script type="text/javascript">
	function doc_search() {
		alert("검색 성공");
	}
	function doc_ins() {
		alert("추가성공");
	}
	
</script>
</head>
<body>

<!-- 리스트 처리 시작  -->
	<div class="dropdown">
	  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
	    과
	  </button>
	  <div class="dropdown-menu">
	    <a class="dropdown-item" href="#">Link 1</a>
	    <a class="dropdown-item" href="#">Link 2</a>
	    <a class="dropdown-item" href="#">Link 3</a>
	  </div>
	</div>
	
	
	<span class="input-group-btn pull-right"></span>

       <input type="text" class="pull-right form-control" placeholder="Search" style="width:200px;"/>
       <button id="doc_search" type="button" class="btn btn-primary" onclick="doc_search()">검색</button>
       
    <span>
    	<button id="doc_ins" type="button" class="btn btn-primary" onclick="doc_ins()">의사추가</button>
    </span>
	
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
		<ul class="pagination">
	    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">4</a></li>
	    <li class="page-item"><a class="page-link" href="#">Next</a></li>
	  </ul>
	</div>
	
<!-- 리스트 처리 끝  -->
<script type="text/javascript">
	$(document).ready(function(){
		doc_list();
	});
</script>
</body>
</html>