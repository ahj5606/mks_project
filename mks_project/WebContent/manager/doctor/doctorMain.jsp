<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function doc_search() {
			alert("검색 성공");
		}
		function doc_ins() {
			alert("추가성공");
		}
	</script>
	
</head>

<!-- 리스트 처리 시작  -->
<body> 
	<div class="container">
		 <div class="dropdown">
		    <button class="btn btn-primary dropdown-toggle" style="margin-top: 30px;" data-toggle="dropdown">과</button>
		    <div class="dropdown-menu">
		      <a class="dropdown-item" href="#">가정의학과</a>
		      <a class="dropdown-item" href="#">내과</a>
		      <a class="dropdown-item" href="#">외과</a>
		      <a class="dropdown-item" href="#">산부인과</a>
		    </div>
		  </div>
	</div>
	
	<span class="input-group-btn pull-right"></span>
	<div class="col-sm-3" style="text-align:center">
       <input id="doc_search" type="text" class="pull-right form-control" placeholder="Search" style="width:200px;"/>
    </div>
    	<button id="doc_search" type="button" class="btn btn-primary" style="margin-right: 30px" onclick="doc_search()">검색</button>
	<div class="container-fluid" id="sidebar">
	    <div class="row">
	    	<div class="col-sm-8" id="main">
	        	<div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-doctor" role="tabpanel" aria-labelledby="list-doctor-list">
			      
			      	<div class="float-right">
			      		<button type="button" class="btn btn-primary" onclick="doc_ins()">의사추가</button>
			      	</div>
			      	<table id="doc_list" class="table table-sm">
					  <thead>
					    <tr>
						  <th scope="col" data-field="docCode">의사코드</th>
						  <th scope="col" data-field="subject">전공</th> 	
						  <th scope="col" data-field="name">이름</th> 
						  <th scope="col" data-field="position">직급</th> 
						  <th scope="col" data-field="edu">학력</th>
						  <th scope="col" data-field="phoneNum">전화</th>
						  <th scope="col" data-field="offday">상태</th>
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
