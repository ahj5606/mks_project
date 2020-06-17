<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 페이지 </title>
<script type="text/javascript">
	function docIns(){
		alert("의사추가");
		location.href="./mgr_doctorDetail.jsp"
	}
	function docSel(){
		alert("의사검색");
		location.href="./docList.jsp"
		
	}
	
</script>
	
</head>
<body>  
	

	<div class="container-fluid" id="sidebar">
	    <div class="row">
	        <div class="col-sm-2" style="margin-top: 45px">
	        <div class="dropdown" style="margin-bottom: 10px">
		    <button class="btn btn-primary dropdown-toggle" style="margin-top: 30px;" data-toggle="dropdown">과</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">가정의학과</a>
			      <a class="dropdown-item" href="#">내과</a>
			      <a class="dropdown-item" href="#">외과</a>
			      <a class="dropdown-item" href="#">산부인과</a>
			    </div>
		    </div>
	        	 <input type="text" class="form-control" style="margin-top: 30px;" placeholder="의사이름" aria-label="patientName" aria-describedby="basic-addon1">
	        	 <input type="text" class="form-control" style="margin-top: 30px;" placeholder="의사코드" aria-label="patientName" aria-describedby="basic-addon1">
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
						  <th scope="col" data-field="docCode">의사코드</th>
						  <th scope="col" data-field="subject">전공</th> 	
						  <th scope="col" data-field="name">이름</th> 
						  <th scope="col" data-field="position">직급</th> 
						  <th scope="col" data-field="edu">학력</th>
						  <th scope="col" data-field="phoneNum">전화</th>
						  <th scope="col" data-field="offday">상태</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<tr>
					  	  <td>
					  	  	123
					  	  </td>
					  	</tr>
					  	
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
</body>
</html>