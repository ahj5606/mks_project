<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.text.ParseException"    %>
<%@ page import ="java.text.SimpleDateFormat"  %>
<%@ page import ="java.util.ArrayList"        %>
<%@ page import ="java.util.Calendar"          %>
<%@ page import ="java.util.Date"              %>
<%@ page import ="java.util.HashMap"           %>
<%@ page import ="java.util.List"              %>
<%@ page import ="java.util.Map"               %>
<%
	String hp_name = null;// 페이지 이동하면서 파라미터로 넘어온 **** 병원이름 
	if( request.getParameter("hp_name")!=null){
		hp_name =  request.getParameter("hp_name");
	}
	String dept_code = null;// 페이지 이동하면서 파라미터로 넘어온 **** 부서코드
	if( request.getParameter("dept_code")!=null){
		hp_name =  request.getParameter("dept_code");
	}
	
	String doc_code = null;//  페이지 이동하면서 파라미터로 넘어온 **** 선택된 의사코드
	if( request.getParameter("doc_code")!=null){
		hp_name =  request.getParameter("doc_code");
	}
	
	String mem_name = null;// 세션에 저장되어있는 **** 회원이름
	if(session.getAttribute("mem_name")!=null){
		mem_name = (String)session.getAttribute("mem_name");
	};
	
	/*************************************************************************
	* 불규칙한 예약시간 목록 리스트를 가지고 아래와 같은 형식으로 뽑아야함!!!!!!!!!
		[{
	   		start: '2020-06-01',
	    	end: '2020-06-10',
	    	rendering: 'background'
		},{
			start: '2020-06-15',
	    	end: '2020-06-24',
	    	rendering: 'background'
		},{
			start: '2020-06-27',
	    	end: '2020-07-05',
	    	rendering: 'background'
		}]
		
	*/
	List<Map<String, Object>> resList = new ArrayList<Map<String,Object>>();
	Map<String,Object> map = null;
	map = new HashMap<String, Object>();
	map.put("res_date", "2020-06-19");
	resList.add(map);
	map = new HashMap<String, Object>();
	map.put("res_date", "2020-06-20");
	resList.add(map);
	map = new HashMap<String, Object>();
	map.put("res_date", "2020-06-26");
	resList.add(map);
	map = new HashMap<String, Object>();
	map.put("res_date", "2020-06-27");
	resList.add(map);
	map = new HashMap<String, Object>();
	map.put("res_date", "2020-06-28");
	resList.add(map);
	map = new HashMap<String, Object>();
	map.put("res_date", "2020-07-05");
	resList.add(map);
	map = new HashMap<String, Object>();
	map.put("res_date", "2020-07-06");
	resList.add(map);
	
	StringBuilder sb = new StringBuilder();
	for(int i=0; i<resList.size(); i++){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			String ddd1 = resList.get(i).get("res_date").toString();
			String ddd2 = null;
			Date date1 = sdf.parse(ddd1);
			Date date2 = null;
			String date1_str = null;
			if(i!=resList.size()-1) {
				if(i==0) {
					sb.append("[{");
					sb.append("start: "+"'"+ddd1+"',");
				}
				ddd2 = resList.get(i+1).get("res_date").toString();
				date2 = sdf.parse(ddd2);
				Calendar cal1 = Calendar.getInstance();
		        cal1.setTime(date1);
		        cal1.add(Calendar.DATE, +1);
		        date1 = cal1.getTime();
		        date1_str = sdf.format(date1);
		        
		        if(!date1.equals(date2)) {
		        	sb.append("end: "+"'"+date1_str+"',");
					sb.append("rendering: 'background'");
					sb.append("},{");
					sb.append("start:"+"'"+ddd2+"',");
		        }
			}else {
				Calendar cal1 = Calendar.getInstance();
		        cal1.setTime(date1);
		        cal1.add(Calendar.DATE, +1);
		        date1 = cal1.getTime();
		        date1_str = sdf.format(date1);
		        sb.append("end: "+"'"+date1_str+"',");
				sb.append("rendering: 'background'");
				sb.append("}]");
			}
		} catch (ParseException e) {
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>예약상세 화면</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c4b678674e7c8512ebf2cadc156977&libraries=services"></script>
<%@ include file="/common/bootStrap4UI.jsp"%>

<style type="text/css">
	.container{
		padding:5px;
	}
	a.navbar-brand{/*네비바 글자 가운데 정렬*/
		margin: auto;
	}
	.navbar .navbar-brand {
	  	color: #F6F6F6;
	  	font-family: 'Do Hyeon', sans-serif;
	 	font-size: xx-large;
	}
	.navbar .navbar-brand:hover,
	.navbar .navbar-brand:focus {
	 	color: #FFFFFF;
	 	font-family: 'Do Hyeon', sans-serif;
	}
	footer {
		left: 0;
		bottom: 0;
		width: 100%;
		overflow-x:hidden;
		text-align: center;
		font-family:'Do Hyeon';
		margin-top:30px;
	}
</style>
<script type="text/javascript">
	var day_of_choice = "";
	function make_reservation(){
		alert("예약하기 버튼!!");
	}
</script>
</head>
<body>
	<!-- 네이게이션 -->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#007bff;">
	    <a class="navbar-brand" href="#">가산독산병원</a>
    </nav>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:20px;">
	  	<div class="row mb-3 mt-2">
			<!-- 우측 -->
	  		<div class="col-md">
	  			<!-- 검색 -->
				<div class="row">
					<div class="col-md">
						<select class="form-control" id="s_doc">
							<option value="담당의사">담당의사</option>
							<option value="고길동">고길동</option>
							<option value="김유신">김유신</option>
							<option value="강감찬">강감찬</option>
						</select>
					</div>
				</div>
	  			<!-- 날짜테이블 -->
				<div class="row pt-2">
					<div class="col-md">
						<div id='calendar'></div>
					</div>
				</div>
	  			<!-- 예약확인 -->
				<div class="row pt-2">
					<div class="col-md">
						<div class="card">
					  		<h6 class="card-header"><%=mem_name %> 님 예약정보</h6>
					  		<div class="card-body py-2">
								<div class="row my-1">
									<div class="col-md px-3">
										<table id="t_my_resevation">
											<tr><th style='padding:2px;'>진료과목</th><td id="dept_name" style='padding:2px;'></td></tr>
											<tr><th style='padding:2px;'>담당의사</th><td  id="doc_name" style='padding:2px;'></td></tr>
											<tr><th style='padding:2px;'>예약날짜</th><td id="res_date" style='padding:2px;'></td></tr>
											<tr><th style='padding:2px;'>예약시간</th><td id="res_time" style='padding:2px;'></td></tr>
										</table>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-md">
      									<input type="text" class="form-control" id="i_sym" name="i_sym" type="search" placeholder="(선택) 증상을 입력해주세요.">
									</div>
								</div>
								<div class="row">
									<div class="col-md" style="text-align:right">
      									<button class="btn btn-dark btn-inline" onClick="make_reservation()">예약하기</button>
									</div>
								</div>
					  		</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 좌측 -->
	  		<div class="col-md">
	  			<!-- 예약시간 테이블 -->
				<div class="row">
					<div class="col-md">
						<div class="table-responsive-md" style="overflow-y: scroll;height:510px;">
							<table class="table table-hover" id="t_reservationlList" style="text-align:center;">
								<thead class="thead-light">
									<tr>
										<th data-field="RES_TIME">예약가능시간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">9:00</td>
									</tr>
									<tr>
										<td scope="row">9:30</td>
									</tr>
									<tr>
										<td scope="row">9:40</td>
									</tr>
									<tr>
										<td scope="row">10:30</td>
									</tr>
									<tr>
										<td scope="row">11:30</td>
									</tr>
									<tr>
										<td scope="row">11:40</td>
									</tr>
									<tr>
										<td scope="row">12:00</td>
									</tr>
									<tr>
										<td scope="row">1:30</td>
									</tr>
									<tr>
										<td scope="row">1:30</td>
									</tr>
									<tr>
										<td scope="row">1:30</td>
									</tr>
									<tr>
										<td scope="row">1:30</td>
									</tr>
									<tr>
										<td scope="row">1:30</td>
									</tr>
									<tr>
										<td scope="row">1:30</td>
									</tr>
								</tbody>
							</table>
						</div>	
					</div>
				</div>
				<!-- 안내문구 -->
				<div class="row pt-2 mt-4" style="height:250px;background-color:#000000">
					<div class="col-md">
					</div>
				</div>
	  		</div>
		</div>
	</div>
	<!-- footer -->
	<!-- <footer>
		<div class="row bg-light pt-3">
		</div>
	</footer> -->
	
	<!-- 돔 구성이 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function(){
			<%if(doc_code!=null){// 의사가 선택된 채로 예약하러 왔다면 *****%>
				/* 
					1) 해당 의사코드를 가진 의사를 찾고 setAttribute("doc_name","고길동") ==> 아래 정보카드 담당의사 옆에 text 넣기
					2) 그 의사의 예약가능 리스트 setattribute("resList",resList)		==> 달력 리프레시
					3) 해당의사의 부서이름 setattribute("dept_name","내과")			==> 아래 정보카드 진료과목 옆에 text 넣기
					4) 그 부서의 모든 의사목록 setattribute("docList",docList) 		==> 의사 카테고리 리프레시
					
				*/
				
			<%}else{//전체 선택으로 예약하러 왔다면 *****%>
				/*  
					1) 해당 부서의 이름 setattribute("dept_name","내과")   				==> 아래 정보카드 진료과목 옆에 text 넣기
					2) 해당 부서의  모든 의사목록 setattribute("docList",docList)			==> 의사 카테고리 리프레시
					3) 해당 부서의 모든 의사의 예약가능 리스트 setattribute("resList",resList) ==> 달력 리프레시
				*/
			<%}%>
		});
		$("#s_doc").change(function(){
			alert(this.value);
		});
		$("#s_month").change(function(){
			alert(this.value);
		});
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				 plugins: [ 'interaction', 'dayGrid' ]
				,defaultView: 'dayGridMonth'
				,selectable: true
				,dateClick: function(info) {
					//전변에 클릭한 날짜 저장해놓고 저장되어 있다면 이벤트가 일어나지 않게....
					var click_day = new Date(info.dateStr);
					<%
						for(int i=0; i<resList.size(); i++){
							String day_str = resList.get(i).get("res_date").toString();
						%>
							var day = new Date(day);
							if(day=click_day){
								//전변에 클릭한 ctn
								alert('선택: ' + info.dateStr);
								//info.dayEl.style.backgroundColor = 'red';
								day_of_choice = info.dateStr;
								$("#res_date").html(day_of_choice);
								$("#res_date").css('color','red');
							}
							return;
														
						<%}%>
				}
				,events:<%=sb.toString()%>
				,dragOpacity: 1
			});
			calendar.render();
		});
	</script>
</body>
</html>