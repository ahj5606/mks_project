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
	    Dropdown button
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
       
    <div>
    	<button id="doc_ins" type="button" class="btn btn-primary" onclick="doc_ins()">의사추가</button>
    </div>
	
	<div class="container">
             
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>
	
	<div class="container">
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