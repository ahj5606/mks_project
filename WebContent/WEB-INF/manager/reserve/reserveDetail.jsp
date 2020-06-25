<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> rList = (List<Map<String, Object>>)request.getAttribute("rList");
if(rList==null){
	rList = new ArrayList();
}
String res_time = null;
String hour =null;
String min  =null;
String mem_name = request.getParameter("mem_name");
String doc_name = request.getParameter("doc_name");
String sch_code = request.getParameter("sch_code");
//시간=>시:분 으로 나눔
String getRes_time = (String)rList.get(0).get("RES_TIME");
	hour =getRes_time.substring(0,2);
	min =getRes_time.substring(2,4);
	res_time=hour+":"+min;


if(sch_code==null){
	sch_code="";
	out.print("안됨");
}
%>
<script type="text/javascript">

	function back(){
		location.href="/manager/reserve/reserveList.mgr";
	}
	function reserve_remove(){
		alert("삭제");

	}
</script>
	<div class="container-fluid" id="sidebar">
		<h1>예약 등록</h1>
		<div class="container">
			<h2>예약 정보</h2>
			<form role="form">
				<div class="form-group">
					<label for="patientName">성명</label>
					<input type="text" class="form-control" id="patientName" value="<%=rList.get(0).get("MEM_NAME")%>" placeholder="Enter patientName">
				</div>
				<div class="form-group">
					<label for="socialNum">주민등록번호</label>
					<input type="text" class="form-control" id="socialNum" value="<%=rList.get(0).get("MEM_SOCIALNUM")%>" placeholder="Enter patientName">
				</div>
				<div class="form-group">
					<label for="patientNumber">전화번호</label>
					<input type="text" class="form-control" id="patientName" value="<%=rList.get(0).get("MEM_PHONE")%>" placeholder="Enter patientName">
				</div>
				<div class="form-group">
					<label for="dept">진료과</label>
					<input type="text" class="form-control" id="dept" value="<%=rList.get(0).get("DEPT_NAME")%>" placeholder="Enter dept">
				</div>
				<div class="form-group">
					<label for="doctor">담당의</label>
					<input type="text" class="form-control" id="doctor" value="<%=rList.get(0).get("DOC_NAME")%>" placeholder="Enter doctor">
				</div>
				<div class="form-group">
					<label for="memo">증상</label>
					<input type="text" class="form-control" id="doctor" value="<%=rList.get(0).get("RES_MEMO")%>" placeholder="Enter doctor">
				</div>
				<div class="form-group">
				<label for="reserveDate">예약 날짜</label> 
						<input type="text" id="resDate" value="<%=rList.get(0).get("SCH_DATE")%>"
							class="form-control mb-2" placeholder="date input"> 
<%-- 						<input type="date" id="resDate" value="<%=rList.get(0).get("SCH_DATE")%>"
							class="form-control mb-2" placeholder="date input">  --%>
				</div>
				<div class="form-group">
				<label for="reserveDate">예약 시간</label> 
						<input type="text" id="resTime" value="<%=res_time%>" class="form-control mb-2" placeholder="time input"> 
				</div>
				

			</form>
				<button class="text-center btn btn-primary">
						수정
						</button>
				<button class="text-center btn btn-danger" onclick="reserve_remove()">
						삭제
						</button>
				<button class="text-center btn btn-default btn-outline-secondary" onclick="back()">
						닫기
				</button>
		</div>
</div>
