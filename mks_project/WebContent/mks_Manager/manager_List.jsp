<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원관리</title>
<style type="text/css">
	#sidebar{
		margin-top:100px;
		margin-left:30px;
	}
</style>

<%@ include file ="../common/bootStrap4UI.jsp" %>
</head>
<body>
<%@ include file="./manager_navbar.jsp" %>
<!-- 리스트 처리 시작  -->
	
	<div class="container-fluid" id="sidebar">
	    <div class="row">
	        <div class="col-sm-2"  id="sticky-sidebar">
	        	 <div class="list-group" id="list-tab" role="tablist">
				      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">내 공지사항</a>
				      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-write" role="tab" aria-controls="profile">글쓰기</a>
			    </div>
	        </div>
	        <div class="col-sm-8" id="main">
	        	
	        	 <div class="tab-content" id="nav-tabContent">
			      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
			      	<table id="hp_list" class="table table-sm">
					  <thead>
					    <tr>
						  <th scope="col" data-field="subject">학과</th> 	
						  <th scope="col" data-field="name">이름</th> 
						  <th scope="col" data-field="number">학번</th>
					    </tr>
					  </thead>
					</table>
					<button onClick="search()">json으로 데이터</button> 
			      </div>
			      <div class="tab-pane fade" id="list-write" role="tabpanel" aria-labelledby="list-write-list">
			     		 글쓰기 폼
			      </div>
			     </div>
	        </div>
	    </div>
	</div>
<!-- 리스트 처리 끝  -->



</body>
</html>