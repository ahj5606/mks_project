<%@page import="java.util.TreeSet"%>
<%@page import="mks.util.PageBarManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//response.setCharacterEncoding("UTF-8");
	String r_pname	=null;
	String r_pcode	=null;
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
	String hp_code = "280HP";//실제론쿠키로 가져올 값임.
	List<Map<String, Object>> rList = (List<Map<String, Object>>)request.getAttribute("rList");
	if(rList==null){
		rList = new ArrayList();
	}
	List<Map<String, Object>> dList = (List<Map<String, Object>>)request.getAttribute("dList");
	if(dList==null){
		dList = new ArrayList();
	}
	
	String dept = request.getParameter("dept_name");
	String mem_name = request.getParameter("mem_name");
	String mem_memcode = request.getParameter("mem_memcode");
	String doc_name = request.getParameter("doc_name");
	String sch_code = request.getParameter("sch_code");
	String s_date = request.getParameter("startDate");
	String e_date = request.getParameter("endDate");
	
	if(mem_name==null){
		mem_name="";
	}
	if(doc_name==null){
		doc_name="";
	}
	if(sch_code==null){
		sch_code="";
	}
	if(dept==null){
		dept="진료과 전체";
	}
	if(s_date==null){
		s_date="";
	}
	if(e_date==null){
		e_date="";
	}
	int tot=rList.size();
	int numPerPage = 10;
	int nowPage =0;
	if(request.getParameter("nowPage")!=null){
		nowPage =Integer.parseInt(request.getParameter("nowPage"));
	}
%>
			<div class="container-fluid" id="sidebar">
					<h1>예약</h1>
					<div class="row" style="border: 0px solid #ccc;">
						<div class="col col-xs-4" id="sticky-sidebar">
							<div class="text-center" id="calendar"></div>
							<%-- <%@ include file="./test.jsp"%> --%>
							<br>
							
							<div style="text-align:center;">
							<button  class="btn btn-outline-success text-center" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">날짜 조건 검색</button>
							</div>
								<div style="text-align:center;">
							<div style="border: 0px solid green;">
								<div class="mt-3 collapse center justify-content-center" style="border: 0px solid black;" id="collapseExample">
									<div class="well">
								<label>시작날짜</label>
								<input type="date" id="startDate"
									class="form-control mr-2 mb-2" placeholder="date input">
								<label>종료날짜</label>
								<input type="date" id="endDate" class="form-control mr-2 mb-2"
									placeholder="date input">
								<button class="mt-3 btn btn-outline-success" onclick="r_search()"
									value="sdate">검색하기</button>
									</div>
								</div>
							</div>
							</div>
							<script type="text/javascript">
							function selectSDate(data) {
								var sdate = document.getElementById('startDate').value;
								var edate = document.getElementById('endDate').value;
								var dept = document.getElementById('selDept').value;
								alert("진료과 "+dept);
								alert("시작날짜" + sdate);
								alert("종료날짜" + edate);
							}
							</script>
							
							
						
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
										<button type="button" id="selDept"class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
											<%= dept %>
											<!-- 버튼태그 우측 메뉴출력을 위한 화살표표시
											(없어도 무관하나 메뉴버튼이라는것을 알려주기 위함) -->
											<span class="caret"></span>
										</button>
										
										<!--메뉴버튼 클릭시 하단 표출된 리스트 영역  -->
										<ul class="dropdown-menu dropdown-menu-center">
											<li><a  class="dropdown-item" href="javascript:void(0)">진료과 전체</a></li>
											 <div class="dropdown-divider"></div>
									<%
										for(int i=0;i<dList.size();i++){
											
									%>
											<li ><a  class="dropdown-item" href="javascript:void(0)"><%=dList.get(i).get("DEPT_NAME") %></a></li>
									<%
										}
									%>
										</ul>
																
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
								<button class="btn btn-primary m-3" onclick="reserveAdd()">
									예약 등록</button>
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
										<th scope="col" data-field="MEM_MEMCODE">환자코드</th>
										<th scope="col" data-field="MEM_NAME">환자이름</th>
										<th scope="col" data-field="MEM_PHONE">연락처</th>
										<th scope="col" data-field="DOC_NAME">담당의</th>
										<th scope="col" data-field="SCH_DATE">예약 일자</th>
									</tr>
								</thead>
								<tbody>
<%
	for(int i=0;i<rList.size();i++){
		if(i<numPerPage*(nowPage+1) && i>=numPerPage*nowPage){
%>
	<tr>
					<td><%=rList.get(i).get("SCH_CODE") %></td>
					<td><%=rList.get(i).get("DEPT_NAME") %></td>
					<td><%=rList.get(i).get("MEM_MEMCODE") %></td>
					<td><%=rList.get(i).get("MEM_NAME") %></td>
					<td><%=rList.get(i).get("MEM_PHONE") %></td>
					<td><%=rList.get(i).get("DOC_NAME") %></td>
					<td><%=rList.get(i).get("SCH_DATE") %></td>
	</tr>
<%
		}
	}
%>
								</tbody>
							</table>
			<!-- 	<ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
               </ul> -->
						</div>
									
						</div>			
						<!-- 테이블 -->
		<div class="row" style="margin-top:10px;justify-content: center;">
<%
if(s_date == null){
s_date = "";	
}
if(e_date == null){
e_date = "";
}


 		String pagePath ="./reserveSEL.mgr?hp_code="+hp_code+"&dept_name="+dept
 				+"&mem_name="+mem_name+"&doc_name="+doc_name
 				+"&startDate="+s_date+"&endDate="+e_date;
 		PageBarManager pb = new PageBarManager(numPerPage,tot,nowPage,pagePath);
 		String pagination = pb.getPageBar();
 		out.print(pagination);
 %>   

		</div>
						</div>
						<!-- =========================테이블쪽 col 끝======================= -->
					</div>
				</div>
<script type="text/javascript">

$(document).ready(function(){
	
$("#res_list").bootstrapTable({
	onDblClickRow:function(row, $element, field)
     { 
	 	var jo = JSON.stringify(row);
		var d = JSON.parse(jo);
		var r_pcode = d.MEM_MEMCODE;
		var imsi = JSON.stringify(row.SCH_CODE)
		r_schcode = JSON.parse(imsi);
		
		var imsi = JSON.stringify(row.MEM_NAME)
		r_pname = JSON.parse(imsi);
		
		var imsi = JSON.stringify(row.MEM_MEMCODE)
		r_pcode = JSON.parse(imsi);
		
		var imsi = JSON.stringify(row.DEPT_NAME)
		r_dept = JSON.parse(imsi);
		
		var imsi = JSON.stringify(row.MEM_PHONE)
		r_phone = JSON.parse(imsi);
		
		var imsi = JSON.stringify(row.DOC_NAME)
		r_doc = JSON.parse(imsi);
		
		alert("예약코드 " + r_schcode + " | 환자 " + r_pname +" | 환자코드 " + r_pcode+ " | 연락처 " + r_phone);
		alert("의사 " + r_doc + " | 진료과 " + r_dept);
		
		location.href="./reserveDetail.mgr?sch_code="+r_schcode+"&mem_memcode="+r_pcode;
     }
	});		
	$("#res_list").bootstrapTable('hideLoading');
});


var dept =null;
$('#deptDrop .dropdown-menu li > a').bind('click',function (e) {
	alert("눌");
    dept = $(this).html();
    $('#deptDrop button.dropdown-toggle').html(dept +' <span class="caret"></span>');
    alert("진료과:"+dept);
});
function r_search(){
	var r_name = $("#patiSearch").val();
	var doc_name =$("#docSearch").val();
	var st_date = $("#startDate").val();
	var en_date = $("#endDate").val();
	//alert ("드롭다운 진료과:"+dept);
	if(dept==null) {
		dept="진료과 전체";
	}
	alert ("날짜들:"+st_date+", "+en_date);
	var s_date="";
	var e_date="";
	
	if(st_date!="" && en_date!=""){
		if(st_date>en_date){
			alert("시작날짜가 끝 날짜보다 빠릅니다.");
		}else{
			
		alert ("둘다 들어감 - if 실행");
		var getS_date = null;//검색 시작 날짜
		var getE_date = null;//검색 종료 날짜
		getS_date = st_date.split('-');
		getE_date = en_date.split('-');
		s_date = getS_date[0]+"/"+getS_date[1]+"/"+getS_date[2]; 
		e_date = getE_date[0]+"/"+getE_date[1]+"/"+getE_date[2]; 
	//	alert(s_date+"  |  "+e_date);
		location.href="./reserveSEL.mgr?hp_code=<%=hp_code%>&dept_name="+dept
										+"&mem_name="+r_name+"&doc_name="+doc_name
										+"&startDate="+s_date+"&endDate="+e_date;		
		}
	}
	else if(st_date=="" && en_date==""){
		alert("둘 다 안 들어감");
		location.href="./reserveSEL.mgr?hp_code=<%=hp_code%>&dept_name="+dept
										+"&mem_name="+r_name+"&doc_name="+doc_name
										+"&startDate="+s_date+"&endDate="+e_date;		
	}else{
		alert("날짜를 명확하게 선택해주세요.");
	} 
	
}
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	 height: 500,
    	 contentHeight: 600,
        plugins: [ 'interaction', 'dayGrid' ]
       ,defaultView: 'dayGridMonth'
       ,selectable: true
       ,dateClick: function(info) {
   		var r_name = $("#patiSearch").val();
   		var doc_name =$("#docSearch").val();
   		var dept = null;
   		$('#deptDrop .dropdown-menu li > a').bind('click',function (e) {
   			alert("눌");
   		    dept = $(this).html();
   		    $('#deptDrop button.dropdown-toggle').html(dept +' <span class="caret"></span>');
   		    alert("진료과:"+dept);
   		});
   		if(dept==null) {
   			dept="진료과 전체";
   		}
        var day = info.dateStr;
         alert("선택: "+day);
  		getday = day.split('-');
		days = getday[0]+"/"+getday[1]+"/"+getday[2]; 
          s_date = days;
          e_date = days;
          alert("days:"+days);
         location.href="./reserveSEL.mgr?hp_code=<%=hp_code%>&dept_name="+dept
			+"&mem_name="+r_name+"&doc_name="+doc_name
			+"&startDate="+s_date+"&endDate="+e_date; 	
          
       }

    });
    calendar.render();
 });

function reserveAdd(){
	alert("추가");
	location.href="/manager/reserve/mgr_reserveAdd.jsp";
}

</script>
