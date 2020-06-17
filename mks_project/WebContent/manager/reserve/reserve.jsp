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


<!-- 리스트 처리 시작  -->

<div class="container-fluid" id="sidebar">
	<div class="row">
		<div class="col-sm-2" id="sticky-sidebar">
			<div class="list-group" id="list-tab" role="tablist">
				<a class="list-group-item list-group-item-action active"
					id="list-reservation-list" data-toggle="list" href="#list-patient"
					role="tab" aria-controls="home">예약 확인</a> <a
					class="list-group-item list-group-item-action"
					id="list-profile-list" data-toggle="list" href="#list-d_write"
					role="tab" aria-controls="profile">예약 등록</a>
			</div>

		</div>
		<div class="col-sm-8" id="main">
			<h1>예약</h1>

			<div class="row">

				<div id="searchMenu" class="col-md-2 text-center">
					<div id="kCalendar"></div>
					<%-- <%@ include file="./cal2st.jsp"%> --%>
					<br>
					<div class="col-xs-1">
						<label>시작날짜</label> 
							<input type="date" id="startDate"
							class="form-control" placeholder="date input">
						<label>종료날짜</label>
							<input type="date" id="endDate" class="form-control"
							placeholder="date input">
						<button onclick="selectSDate()">체크</button>
					<br>
					
						<input type="search" id="docSearch" class="form-control"
							placeholder="담당의 검색">
						<input type="search" id="patiSearch" class="form-control"
							placeholder="환자검색">
					</div>
					<br>
					<div class="col text-center">
						<button onClick="find()">검색</button>
					</div>
				</div>
				<div class="span5">
					<div class="tab-content" id="nav-tabContent">
					<div class="col-xs-1">
						<div class="col text-left">
							<div class="btn-group">
							    <!-- 버튼태그 -->
								<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
							    진료과 전체
							    <!-- 버튼태그 우측 메뉴출력을 위한 화살표표시
							        (없어도 무관하나 메뉴버튼이라는것을 알려주기 위함) -->
							    <span class="caret"></span>
							    </button>
							    <!--메뉴버튼 클릭시 하단 표출된 리스트 영역  -->
							    <ul class="dropdown-menu text-center" >
							        <li><a href="#" onClick="reserve()">내과</a></li>
							        <li><a href="#" onClick="reserve()">외과</a></li>
							    </ul>
							</div>
						</div>					
						<div class="col text-right">
							<button onClick="find()">추가</button>
						</div>
					</div>
						<div class="tab-pane fade show active" id="list-patient"
							role="tabpanel" aria-labelledby="list-patient-list">

						
								<!-- 스크롤 -->
								<table id="res_list" class="table table-sm col text-center"
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
						<div class="tab-pane fade" id="list-write" role="tabpanel"
							aria-labelledby="list-write-list">글쓰기 폼</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 리스트 처리 끝  -->