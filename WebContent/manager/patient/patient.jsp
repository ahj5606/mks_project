<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 페이지 </title>
 <script src="jquery.twbsPagination.js" type="text/javascript"></script>
</head>
<body>  
	<div class="container-fluid" id="sidebar">
	    <div class="row">
	        <div class="col-sm-2">
	        	 <input type="text" class="form-control" style="margin-top: 30px;" placeholder="환자이름" aria-label="patientName" aria-describedby="basic-addon1">
	        	 <input type="text" class="form-control" style="margin-top: 30px;" placeholder="주민번호" aria-label="patientName" aria-describedby="basic-addon1">
	        	 <button type="button" class="btn btn-success btn-lg btn-block" style="margin-top: 30px;">환자 검색</button>
	        </div>
	        <div class="col-sm-8" id="main">
	        	 <div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      	<div class="float-right">
			      	<button type="button" class="btn btn-outline-success">환자추가</button>
			      	</div>
			      	<table id="hp_list" class="table table-sm">
					  <thead>
					    <tr>
						  <th scope="col" data-field="subject">환자번호</th> 	
						  <th scope="col" data-field="name">환자이름</th> 
						  <th scope="col" data-field="number">주민등록번호</th>
						  <th scope="col" data-field="number">전화번호</th>
					    </tr>
					  </thead>
					</table>
			      </div>
			      <!--  -->
						<table>
							<tr>
								<td></td>
							</tr>
						</table>
			      <!--  -->
			     </div>
	        </div>
	    </div>
	</div>
</body>
</html>