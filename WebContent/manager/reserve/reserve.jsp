<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
	//db연결
	String hp_code = "647HP";//실제론쿠키로 가져올 값임.
	List<Map<String, Object>> rList = (List<Map<String, Object>>)request.getAttribute("rList");
	if(rList==null){
		rList = new ArrayList();
	}

%>


<!-- 리스트 처리 시작  -->

<div class="container-fluid" id="sidebar">
			<h1>예약</h1>
	<div class="row">
		<div class="col-sm-2" id="sticky-sidebar">
			<div class="bg-danger text-center" id="calendar"></div>
					<%-- <%@ include file="./test.jsp"%> --%>
					<br>
					<div class="col-xs-1 text-center m-2 bg-primary ">
						<label>시작날짜</label> 
						<input type="date" id="startDate"
							class="form-control mb-2" placeholder="date input"> 
						<label>종료날짜</label>
						<input type="date" id="endDate" class="form-control mb-2"
							placeholder="date input">
						<button class="btn btn-outline-success" onclick="selectSDate()"
							value="sdate">시작날짜 체크</button>
					</div>
						<button class="text-center btn btn-primary" onclick="reserveDetail()">
						예약 등록
						</button>

		</div>
		<div class="col-sm-4" id="main">
			<div class="row">
				<div id="searchMenu" class="col-md-2 text-center">
				</div>
				<div class="span5">
					<div class="tab-content" id="nav-tabContent">
						<div class="col-xs-1 ">

							<!-- 검색 추가 바 -->
							<div class="row ">
								<div class="btn-group">
									<!-- 버튼태그 -->
									<button class="btn btn-default dropdown-toggle" type="button"
										data-toggle="dropdown">
										진료과 전체
										<!-- 버튼태그 우측 메뉴출력을 위한 화살표표시
							        (없어도 무관하나 메뉴버튼이라는것을 알려주기 위함) -->
										<span class="caret"></span>
									</button>
									<!--메뉴버튼 클릭시 하단 표출된 리스트 영역  -->
									<ul class="dropdown-menu text-center">
										<li><a href="#" onClick="reserve()">내과</a></li>
										<li><a href="#" onClick="reserve()">외과</a></li>
									</ul>
										</div>
									<div id="" class="text-center style='width: 300px; padding:15px;'">
									<form class="form-inline" role="form">
										<div class="form-group">
											<label class="sr-only" for="exampleInputEmail2">담당의 검색</label>
											<input type="search" id="docSearch" class="form-control"
												placeholder="담당의 검색">
										</div>
										<div class="form-group">
											<label class="sr-only" for="exampleInputPassword2">환자검색</label>
											<input type="search" id="patiSearch" class="form-control"
												placeholder="환자검색">
										</div>
									</form>
									</div>

									<button class="text-center btn btn-primary" onClick="resSearch()">검색</button>
							
							</div>

							<!-- 검색 추가 바 -->
						</div>
						<div class="tab-pane fade show active" id="list-patient"
							role="tabpanel" aria-labelledby="list-patient-list">
							<table id="res_list" class="table table-sm col text-center"
								style="width: 800px;">
								<thead>
									<tr>
										<th scope="col" data-field="MEM_MEMCODE">예약일자</th>
										<th scope="col" data-field="DEPT_NAME">진료과</th>
										<th scope="col" data-field="MEM_NAME">환자이름</th>
										<th scope="col" data-field="MEM_PHONE">연락처</th>
										<th scope="col" data-field="DOC_NAME">담당의</th>
									</tr>
								</thead>
								<tbody>
<%
	for(int i=0;i<rList.size();i++){

%>
	<tr>
					<td><%=rList.get(i).get("MEM_MEMCODE") %></td>
					<td><%=rList.get(i).get("MEM_NAME") %></td>
					<td><%=rList.get(i).get("DEPT_NAME") %></td>
					<td><%=rList.get(i).get("MEM_PHONE") %></td>
					<td><%=rList.get(i).get("DOC_NAME") %></td>
	</tr>
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
						<!-- 테이블 테스트	<button onClick="reserve()">json으로 데이터</button> -->
						</div>
						<div class="tab-pane fade" id="list-write" role="tabpanel"
							aria-labelledby="list-write-list">글쓰기 폼</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 리스트 처리 끝  -->