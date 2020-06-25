<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String r_pname	=null;
	String r_doc	=null;
	String r_dept	=null;
	String r_phone	=null;
	String r_code	=null;

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
	String mem_name = request.getParameter("mem_name");
	String doc_name = request.getParameter("doc_name");
	String sch_code = request.getParameter("sch_code");
	out.print(mem_name);
	if(sch_code==null){
		sch_code="";
	}

%>
			<div class="container-fluid" id="sidebar">
					<h1>예약</h1>
					<div class="row" style="border: 0px solid #ccc;">
						<div class="col-sm-2" id="sticky-sidebar">
							<div class="text-center" id="calendar"></div>
							<%-- <%@ include file="./test.jsp"%> --%>
							<br>
							<div class="col-xs-1 text-center m-2">
								<label>시작날짜</label> <input type="date" id="startDate"
									class="form-control mb-2" placeholder="date input"> <label>종료날짜</label>
								<input type="date" id="endDate" class="form-control mb-2"
									placeholder="date input">
								<button class="btn btn-outline-success" onclick="selectSDate()"
									value="sdate">시작날짜 체크</button>
							</div>
							<div class="text-center">
								<button class="btn btn-primary" onclick="reserveAdd()">
									예약 등록</button>
							</div>
						</div>
						<!-- =========================달력측 col 끝======================= -->
						<div name="세로여백" style="width: 20px;">
						</div>
						<!-- =========================테이블쪽 col 시작======================= -->
						<div class="col-sm-8">
							<!-- 테이블 위쪽 검색바 -->
						<div class="row">
							<div class="col">
										<!-- 진료과 드롭다운 태그 -->
									<div id="deptDrop"class="btn-group btn-default m-3" >
										<button id="selDept"class="btn dropdown-toggle" type="button"
											data-toggle="dropdown">
											진료과 전체
											<!-- 버튼태그 우측 메뉴출력을 위한 화살표표시
											(없어도 무관하나 메뉴버튼이라는것을 알려주기 위함) -->
											<span class="caret"></span>
										</button>
										<!--메뉴버튼 클릭시 하단 표출된 리스트 영역  -->
										<ul class="dropdown-menu text-center">
											<li><a href="javascript:void(0)">내과</a></li>
											<li><a href="javascript:void(0)">외과</a></li>
										</ul>
									<script type="text/javascript">
										$('#deptDrop .dropdown-menu li > a').bind('click',function (e) {
											alert("눌");
										    var dept = $(this).html();
										    $('#deptDrop button.dropdown-toggle').html(dept +' <span class="caret"></span>');
										    alert(dept);
										});
									</script>
																
										<!-- 진료과 드롭다운 태그 -->
									</div>
							</div>		
							<div class="col">
								<div class="row" style="width:700px;">
									<div class="col-xs-4 form-group m-3">
										<label class="sr-only" for="exampleInputEmail2">담당의 검색</label>
										<input type="search" id="docSearch" class="form-control"
											placeholder="담당의 검색">
									</div>
									
									<div class="col-xs-4 form-group m-3">
										<label class="sr-only" for="exampleInputPassword2">환자검색</label>
										<input type="search" id="patiSearch" class="form-control"
											placeholder="환자검색">
									</div>
								
									<button class="text-center btn btn-default btn-primary m-3" onClick="r_search()">검색</button>
								</div>
							</div>	
						</div>
						<!-- 테이블 위쪽 검색바 끝 -->
						
						<!-- 테이블 -->
						<div class="row">
						<div class="tab-pane fade show active" id="list-reserve"
							role="tabpanel" aria-labelledby="list-reserve-list" style="width: 100%;">
							<table id="res_list" class="table table-sm col text-center table-hover" data-page-size="10">
								<thead>
									<tr>
										<th scope="col" data-field="SCH_CODE">예약번호</th>
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
					<td><%=rList.get(i).get("SCH_CODE") %></td>
					<td><%=rList.get(i).get("DEPT_NAME") %></td>
					<td><%=rList.get(i).get("MEM_NAME") %></td>
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
						</div>
									
						</div>			
						<!-- 테이블 -->
						</div>
						<!-- =========================테이블쪽 col 끝======================= -->
					</div>
				</div>
<script type="text/javascript">
$(document).ready(function(){
$("#res_list").bootstrapTable({
	onDblClickRow:function(row, $element, field)
     { 
			
		var imsi = JSON.stringify(row.SCH_CODE)
		r_schcode = JSON.parse(imsi);
		
		var imsi = JSON.stringify(row.MEM_NAME)
		r_pname = JSON.parse(imsi);
		
		var imsi = JSON.stringify(row.DEPT_NAME)
		r_dept = JSON.parse(imsi);
		
		var imsi = JSON.stringify(row.MEM_PHONE)
		r_phone = JSON.parse(imsi);
		
		var imsi = JSON.stringify(row.DOC_NAME)
		r_doc = JSON.parse(imsi);
		
		alert("예약코드 " + r_schcode + " | 환자 " + r_pname + " | 연락처 " + r_phone);
		alert("의사 " + r_doc + " | 진료과 " + r_dept);
		
		location.href="./reserveDetail.mgr?sch_code="+r_schcode;
     }
	});		
	$("#res_list").bootstrapTable('hideLoading');
});

function r_search(){
	var r_name = $("#patiSearch").val();
	var doc_name =$("#docSearch").val();
	alert("r_name doc_name"+r_name+","+doc_name);
	location.href="./reserveSEL.mgr?hp_code=<%=hp_code%>&mem_name="+r_name+"&doc_name="+doc_name;
}
function reserveAdd(){
	alert("추가");
	location.href="/manager/reserve/mgr_reserveAdd.jsp";
}
</script>
