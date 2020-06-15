<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//병원 이름 받아오기창
	String hName = request.getParameter("hName");
	String hDept = request.getParameter("hDept");
	if (hName == null) {
		hName = "가산병원";
	}
	if (hDept == null) {
		hDept = "원무과";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원관리</title>
<style type="text/css">
#sidebar {
	margin-top: 100px;
	margin-left: 30px;
}
.my-custom-scrollbar {
position: relative;
height: 200px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
</style>

<%@ include file="../common/bootStrap4UI.jsp"%>
</head>
<body>
	<%@ include file="./manager_navbar.jsp"%>
	<!-- 리스트 처리 시작  -->

	<div class="container-fluid" id="sidebar">
		<div class="row">
			<div class="col-sm-2" id="sticky-sidebar">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active"
						id="list-reservation-list" data-toggle="list" href="#list-patient"
						role="tab" aria-controls="home">예약 확인</a>
					<a class="list-group-item list-group-item-action"
						id="list-profile-list" data-toggle="list" href="#list-d_write"
						role="tab" aria-controls="profile">예약 등록</a>
				</div>

			</div>
			<div class="col-sm-8" id="main">
				<h1>예약</h1>

				<div class="row">
					
				<div class="col-md-2">
						<%@ include file="./cal2st.jsp"%>
						<br>
						 <div class="col-xs-1">
	   						   <input type="date" class="form-control" placeholder="date input">
      					</div>
      					<br>
      					<div class="col-xs-1">
	   					<input type="search" class="form-control" placeholder="search input">
      					</div>
      					<br>
      					<button onClick="find()">검색</button>
      					 
				</div>
					<div class="span5">
						<div class="tab-content" id="nav-tabContent">
						<button onClick="find()">추가</button>
							<div class="tab-pane fade show active" id="list-patient"
								role="tabpanel" aria-labelledby="list-patient-list">
								<div class="table-wrapper-scroll-y my-custom-scrollbar"><!-- 스크롤 -->
								<table id="res_list" class="table table-sm"
									style="width: 600px;">
									<thead>
										<tr>
											<th scope="col" data-field="reservedate">예약일자</th>
											<th scope="col" data-field="dept">진료과</th>
											<th scope="col" data-field="pname">환자이름</th>
											<th scope="col" data-field="number">연락처</th>
											<th scope="col" data-field="doctor">담당의</th>
										</tr>
									</thead>
								</table>
								<button onClick="reserve()">json으로 데이터</button>
							</div>
							</div>
							<div class="tab-pane fade" id="list-write" role="tabpanel"
								aria-labelledby="list-write-list">글쓰기 폼</div>
						</div>
					</div>
				</div>
		</div>
	</div>

	<!-- 리스트 처리 끝  -->


</body>
</html>