<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="mks.util.PageBarManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hp_code = "280HP";//실제론쿠키로 가져올 값임.
	List<Map<String, Object>> pList = (List<Map<String, Object>>)request.getAttribute("pList");
	if(pList==null){
		pList = new ArrayList();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 페이지 </title>

</head>
<body>  
	<div class="container-fluid" id="sidebar">
	    <div class="row">
	        <div class="col-sm-2">
	        	 <input id="p_name" type="text" class="form-control" style="margin-top: 30px;" placeholder="환자이름" aria-label="patientName" aria-describedby="basic-addon1">
	        	 <input id="p_social" type="text" class="form-control" style="margin-top: 30px;" placeholder="주민번호" aria-label="patientName" aria-describedby="basic-addon1">
	        	 <button type="button" class="btn btn-success btn-lg btn-block" style="margin-top: 30px;" onClick="p_search()">환자 검색</button>
	        </div>
	        <div class="col-sm-8" id="main">
	        	 <div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      	<div class="float-right">
			      	<button type="button" class="btn btn-outline-success">환자추가</button>
			      	</div>
			      	<table class="table table-hover" id="p_list" data-page-size="10">
					  <thead>
					    <tr>
						  <th scope="col" data-field="MEM_MEMCODE">환자번호</th> 	
						  <th scope="col" data-field="MEM_NAME">환자이름</th> 
						  <th scope="col" data-field="MEM_SOCIALNUM">주민등록번호</th>
						  <th scope="col" data-field="MEM_PHONE">전화번호</th>
					    </tr>
					  </thead>
					    <tbody>
<%
	for(int i=0;i<pList.size();i++){

%>
	<tr>
					<td><%=pList.get(i).get("MEM_MEMCODE") %></td>
					<td><%=pList.get(i).get("MEM_NAME") %></td>
					<td><%=pList.get(i).get("MEM_SOCIALNUM") %></td>
					<td><%=pList.get(i).get("MEM_PHONE") %></td>
	</tr>
<%
	}
%>
				    </tbody>
					</table>
			      </div>
			      <!--  -->
			      
			      <!--  -->
			     </div>
	        </div>
	    </div>
	</div>
</body>
</html>