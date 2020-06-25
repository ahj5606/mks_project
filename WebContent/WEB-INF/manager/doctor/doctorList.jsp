<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%
	String hp_code = "280HP";
	List<Map<String,Object>> docList = (List<Map<String, Object>>)request.getAttribute("docList");
		if(docList==null){
			docList = new ArrayList();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 페이지 </title>
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> -->
</head>
<body>  
	<div class="container-fluid" id="sidebar">
	    <div class="row">
	        <div class="col-sm-2" style="margin-top: 45px">
	        <div class="dropdown" style="margin-bottom: 10px">
		    <button class="btn btn-primary dropdown-toggle" style="margin-top: 30px;" data-toggle="dropdown">과</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">원무과</a>
			      <a class="dropdown-item" href="#">소아과</a>
			      <a class="dropdown-item" href="#">신경과</a>
			      <a class="dropdown-item" href="#">신경외과</a>
			      <a class="dropdown-item" href="#">정형외과</a>
			      <a class="dropdown-item" href="#">내과</a>
			      <a class="dropdown-item" href="#">외과</a>
			      <a class="dropdown-item" href="#">영상의학과</a>
			      <a class="dropdown-item" href="#">마취통증의학과</a>
			      <a class="dropdown-item" href="#">정신건강의학과</a>
			    </div>
		    </div>
	        	 <input id="d_name" type="text" class="form-control" style="margin-top: 30px;" placeholder="의사이름" aria-label="doctorName" aria-describedby="basic-addon1">
	        	 <input id="d_code" type="text" class="form-control" style="margin-top: 30px;" placeholder="의사코드" aria-label="doctorCode" aria-describedby="basic-addon1">
	        	 <button type="button" class="btn btn-success btn-lg btn-block" style="margin-top: 30px;" onclick="docSel()">의사 검색</button>
	        </div>
	        <div class="col-sm-8" id="main">
	        	 <div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      	<div style="margin-top: 25px">
			      		<div class="float-right" style="margin-bottom: 10px">
			      			<button type="button" class="btn btn-outline-success" onclick="docIns()">의사추가</button>
			      		</div>
				
			      	<table id="doc_list" class="table table-sm">
					  <thead>
					    <tr>
						  <th scope="col" data-field="DEPT_NAME">부서</th>
						  <th scope="col" data-field="DOC_CODE">의사코드</th>
						  <th scope="col" data-field="HP_CODE">병원코드</th>
						  <th scope="col" data-field="DOC_STATE">상태</th> 	
						  <th scope="col" data-field="DOC_NAME">이름</th> 
						  <th scope="col" data-field="DOC_POSITION">직급</th> 
						  <th scope="col" data-field="DOC_EDUCATION">학력</th>
						  <th scope="col" data-field="DOC_PHONE">전화</th>
						  <th scope="col" data-field="DOC_OFFDAY">휴무일</th>
					    </tr>
					  </thead>
					  <tbody>
<%
	for(int i=0;i<docList.size();i++){
%>
					  	<tr class='clickable-row' data-href='url://link-for-first-row/'> 
    					  <td><%=docList.get(i).get("DEPT_NAME") %></td>
					  	  <td><%=docList.get(i).get("DOC_CODE") %></td>
					  	  <td><%=docList.get(i).get("HP_CODE") %></td>
					  	  <td><%=docList.get(i).get("DOC_STATE") %></td>
					  	  <td><%=docList.get(i).get("DOC_NAME") %></td>
					  	  <td><%=docList.get(i).get("DOC_POSITION") %></td>
					  	  <td><%=docList.get(i).get("DOC_EDUCATION") %></td>
					  	  <td><%=docList.get(i).get("DOC_PHONE") %></td>
					  	  <td><%=docList.get(i).get("DOC_OFFDAY") %></td>
					  	<tr>
<%
	}
%>					  	
					  </tbody>
					</table>
					<ul class="pagination">
						  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						  <li class="page-item"><a class="page-link" href="#">1</a></li>
						  <li class="page-item"><a class="page-link" href="#">2</a></li>
						  <li class="page-item"><a class="page-link" href="#">3</a></li>
						  <li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
					</div>
			      </div>
			     </div>
	        </div>
	    </div>
	</div>
	<div>
	  
	</div>
<script type="text/javascript">
	$(document).ready(function(data){
		$("#doc_list").bootstrapTable({
			onDblClickRow:function(row, $element, field)
		     { 
				var jo = JSON.stringify(row);
				var d = JSON.parse(jo);
				var DOC_NAME = d.DOC_NAME;
				var DEPT_NAME = d.DEPT_NAME;
				var DEPT_CODE = d.DEPT_CODE;
				var DOC_CODE = d.DOC_CODE;
				var HP_NAME = d.HP_NAME;
				$("#modal_docname").val(DOC_NAME);
				$("#modal_deptname").val(DEPT_NAME);
				$("#modal_deptcode").val(DEPT_CODE);
				$("#modal_doccode").val(DOC_CODE);
				$("#modal_hp_name").val(HP_NAME);
				$("#doctorSearch").modal('hide');
		     }
		})
		$("#d_list").bootstrapTable('hideLoading');
	})
	function docSel(){
		alert("의사검색");
		var d_name = $("#d_name").val();
		var d_code =$("#d_code").val();
		location.href="./doctorSEL.mgr?hp_code=<%=hp_code%>&doc_name="+d_name+"&doc_code="+d_code
	}
	function docIns(){
		alert("의사추가");
		location.href="./mgr_doctorDetail.jsp"
	}
	
	
</script>
</body>
</html>