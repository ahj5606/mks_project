<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//세션에 저장된 값 꺼냄
	Object parameter = session.getAttribute("mem_name");
	String mem_name = null;
	if(parameter!=null){
		mem_name = (String)parameter;
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
<title>메인화면</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c4b678674e7c8512ebf2cadc156977&libraries=services"></script>
<%@ include file="/common/bootStrap4UI.jsp"%>
<style type="text/css">
	.container{
		padding:5px;
	}
	h5.card-header a, h6.card-header, .card-body{
		color:#353535;
	}
	th, td{
		height:5px;
		font-size:small;
		/* padding:2px; ===> 왜 안먹지...?*/
	}
	a.page-link{
		height:28px;
		color:#4C4C4C;
	}
</style>
<script type="text/javascript">
	function sample7(){
		document.getElementById("sample1").value = "검색완료";
	}
	function res_pageGet(num){
		$.ajax({
			url:"/mks_project/client/login/jsonMyReservList.jsp?num="+num
			,success:function(data){
				var imsi = data.trim();
				alert(imsi);
				var res = JSON.parse(imsi);
				var inner = "";
				for(var i=0; i<res.length; i++){
					inner += "<tr><th style='padding:2px;'>진료과목</th><td style='padding:2px;'>"+res[i].GAW+"</td></tr>";
				    inner += "<tr><th style='padding:2px;'>담당의사</th><td style='padding:2px;'>"+res[i].DOC+"</td></tr>";
				    inner += "<tr><th style='padding:2px;'>예약날짜</th><td style='padding:2px;'>"+res[i].DATE+"</td></tr>";
				    inner += "<tr><th style='padding:2px;'>예약시간</th><td style='padding:2px;'>"+res[i].TIME+"</td></tr>";
				}
				$("#t_my_resevation").html(inner);
			}
		});
	}
	<%@ include file="/common/pagination.js"%>
	function search_h_name(){
		alert("입력한 병원이름: "+$("#h_name").val());
	}
	function login(){
		alert("로그인 버튼!");
		/* 
		$("#f_login").attr("method","post");
		$("#f_login").attr("action","");//로그인 url ****
		$("#f_login").submit();
		*/
		location.href='/mks_project/client/login/loginpro.jsp'
	}
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="./menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:20px;">
	  	<div class="row pt-4">
	  		<!-- 지도 검색 -->
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">병원 검색</label>
					</div>
				</div>
				<hr>
				<!-- 진료과 -->
				<div class="row mb-2 mt-4">
					<div class="col-md">
						<select class="form-control" id="s_gwa">
							<option value="진료과">진료과</option>
							<option value="내과">내과</option>
							<option value="외과">외과</option>
							<option value="소아과">소아과</option>
							<option value="이비인후과">이비인후과</option>
						</select>
					</div>
				</div>
				<!-- 병원이름 -->
				<div class="row mb-2 pr-1">
					<div class="col-md mr-2 pr-1">
						<div class="input-group">
      						<input type="text" class="form-control" id="h_name" name="h_name" type="search" placeholder="Ex) 가산독산병원">
      						<div class="input-group-prepend">
      							<button class="btn btn-dark btn-block" onClick="search_h_name()">이름검색</button>
      						</div>
   						</div>
					</div>
				</div>
				<!-- 주소 -->
				<div class="row mb-4 pr-1">
					<div class="col-md mr-2 pr-1">
						<div class="input-group">
      						<input class="form-control " id="h_addr" type="search" 
															placeholder="주소찾기 버튼을 눌러주세요." aria-label="Search">
      						<div class="input-group-prepend">
      							<button class="btn btn-dark btn-block" onClick="search_addr()">주소검색</button>
      						</div>
   						</div>
					</div>
				</div>
				<!-- 지도화면 -->
				<div class="row mb-2">
					<div class="col-md">
						<div id="map" style="width:100%;height:330px;"></div>
					</div>
				</div>
	  		</div>
	  		<!-- 사이드 -->
	   		<div class="col-md-4">
	   			<% if(mem_name==null){// 로그인 전이니? **** %>
	   			<!-- 로그인 폼1 -->
			   	<div class="container" style="background-color:#EAEAEA;">
					<div class="row mt-2 mb-2">
						<div class="col-md">
							<button class="btn btn-md bg-lignt" onClick="location.href='/mks_project/client/login/createAccount.jsp'">회원가입</button>
						</div>
						<div class="col-md">
							<button class="btn btn-md btn-dark btn-block">병원</button>
						</div>
					</div>
					<form id="f_login"><!-- 로그인 폼전송 -->
						<div class="row mb-2">
							<div class="col-md">
								<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="아이디" aria-label="Id">
							</div>
						</div>
					    <div class="row mb-2">
					    	<div class="col-md">
					    		<input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호" aria-label="Password">
					    	</div>
					    </div>
				    </form>
				    <div class="row mb-3">
				    	<div class="col-md">
				    		<button class="btn btn-md btn-dark btn-block" onClick="login()">로그인</button>
				    	</div>
				    </div>
			   	</div>
			   	<!-- 옆 상단 배너 -->
			   	<div class="container" style="background-color:#EAEAEA;">
			   		<div class="card">
  						<h5 class="card-header">
   							<a href="../info/citeIntro.jsp">About Kosmo</a>
  						</h5>
  						<div class="card-body">
							<p class="card-text">코스모 메디컬 사이트 방문을 환영합니다.<br>첫방문이신가요?</p>
  						</div>
					</div>
			   	</div>
			   	<%}else {// 로그인 되었니? **** %>
			   	<!-- 로그인 폼2 -->
			   	<div class="container" style="background-color:#EAEAEA;">
			   		<!-- 회원이름 문구 -->
				   	<div class="row mb-2">
				   		<div class="col-md">
				   			<label style="font-size:large;">코스모 님 환영합니다.</label>
				   		</div>
				   		<div class="col-md">
			   				<button class="btn btn-md btn-dark btn-block" onClick="location.href='./logout.jsp'">로그아웃</button>
			   			</div>
				   	</div>
				   	<!-- 예약정보 -->
				   	<div class="row mb-3">
				   		<div class="col-md">
				   			<!-- 정보 -->
					   		<div class="card">
	  							<h6 class="card-header" style="height:35px;background-color:#007bff;color:#FFFFFF;">예약정보</h6>
	  							<div class="card-body pt-1" style="background-color:#FAED7D;height:110px;">
									<div class="row">
										<div class="col-md py-1 px-3" style="height:100px;">
											<table id="t_my_resevation">
												<tr>
													<th style="padding:2px;">진료과목</th>
													<td style="padding:2px;">내과</td>
												</tr>
												<tr>
													<th style="padding:2px;">담당의사</th>
													<td style="padding:2px;">고길동</td>
												</tr>
												<tr>
													<th style="padding:2px;">예약날짜</th>
													<td style="padding:2px;">2020/06/14</td>
												</tr>
												<tr>
													<th style="padding:2px;">예약시간</th>
													<td style="padding:2px;">13:30</td>
												</tr>
											</table>
										</div>
										<div class="col-md-5 py-1 px-3" style="height:100px;">
											<div class="text-center bg-light" id="qr_img">
 												<img src="./qrCode.jpg" class="rounded" alt="qr코드 이미지">
											</div>
										</div>
									</div>
	  							</div>
							</div>
							<!-- 페이지네이션 -->
							<ul class="pagination justify-content-center" style="height:5px;">
								<li class="page-item mx-1">
									<a class="page-link p-1 px-2 my-1" href="#" onClick="pageMove(this)" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
								</li>
								<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)">1</a></li>
								<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_2" onClick="page(this)">2</a></li>
								<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_3" onClick="page(this)">3</a></li>
								<li class="page-item mr-1">
									<a class="page-link p-1 px-2 my-1" href="#" onClick="pageMove(this)" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
									</a>
								</li>
							</ul>
				   		</div>
				   	</div>
				   	<!-- 즐겨찾기 병원 -->
			      	<div class="row mb-1">
			      		<div class="col-md">
			      			<div class="card">
	  							<h6 class="card-header" style="height:35px;">즐겨찾는 병원</h6><!-- 컬러 블루로 -->
	  							<div class="card-body py-3"><!-- 컬러 노랑이로 -->
									<div class="row">
										<div class="col-md">
											<a href="#" style="color:#353535;"><img src="./star.jpg" class="rounded">&nbsp;&nbsp;가산</a>
										</div>
										<div class="col-md">
											<a href="#" style="color:#353535;"><img src="./star.jpg" class="rounded">&nbsp;&nbsp;독산</a>	
										</div>
									</div>
									<div class="row">
										<div class="col-md">
											<a href="#" style="color:#353535;"><img src="./star.jpg" class="rounded">&nbsp;&nbsp;광명</a>	
										</div>
										<div class="col-md">
											<a href="#" style="color:#353535;"><img src="./star.jpg" class="rounded">&nbsp;&nbsp;영등포</a>		
										</div>
									</div>
	  							</div>
							</div>
			      		</div>
			      	</div>
			   	</div>
	   			<%} %>
	   			<!-- 옆 하단 배너 -->
			   	<div class="container" style="background-color:#EAEAEA;padding-bottom:15px;">
			   		<div class="card">
  						<h5 class="card-header">
  							<a href="#">Customer Service</a>
  						</h5>
  						<div class="card-body">
							<h6 class="card-title">고객센터</h6>
							<p class="card-text">전화번호: 02-123-4567<br>FAX번호: 122-3442<br>운영시간: 9:00 ~ 18:00</p>
  						</div>
					</div>
			   	</div>
	   		</div>
	  	</div>
	</div>
	<!-- 돔 구성 완료되었을 떄 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$("#s_gwa").change(function(){
				alert(this.value);
			});
		});
	</script>
	<!-- 지도 API -->
	<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
    var element_wrap = document.getElementById('wrap');
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(50.537187, 127.005476),
        map: map
    });
    function search_addr() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.sigungu; // 최종 주소 변수
                var addr1 = data.sido; // 최종 주소 변수
                var addr2 = data.bname; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("h_addr").value = addr+" "+addr1+" "+addr2;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
    mapContainer.style.display = "block";
    map.relayout();
    setTimeout(function(){ map.relayout();}, 0);
	</script>
</body>
</html>