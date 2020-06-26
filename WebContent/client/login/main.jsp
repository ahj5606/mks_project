<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	//세션에 저장된 값 꺼냄
	Object parameter = session.getAttribute("mem_name");
	Object obj = session.getAttribute("mks_id");
	String mem_name = null;
	String mks_id = null;
	if(parameter!=null){
		mem_name = (String)parameter;
		mks_id = (String)obj;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>메인화면</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c4b678674e7c8512ebf2cadc156977&libraries=services"></script>
<%@ include file="/common/bootStrap4UI.jsp"%>
<style type="text/css">
.container {
	padding: 5px;
}

h5.card-header a, h6.card-header, .card-body {
	color: #353535;
}

th, td {
	height: 5px;
	font-size: small;
	/* padding:2px; ===> 왜 안먹지...?*/
}

a.page-link {
	color: #4C4C4C;
}
</style>
<script type="text/javascript">

var marker;//5개가 출력(json으로 스캔-jsonMapList.jsp)
var mArray=new Array();
var dept_name="";
var sts =new Array();
	function sample7(){
		document.getElementById("sample1").value = "검색완료";
	}
	function popup_reservation(hos,code){
		// *** 예약화면 호출  *** 지금은 '병원 버튼'에 상수로 박아져 있지만, 
		//1) 마커 속 예약버튼 눌렀을 때 함수 호출한다...  2)파라미터(hp_name)에 병원이름 박아야함!
		var hp_name = hos;
		var hp_code = code;
		//dept_name=dept;
		alert("popup_reservation 호출!");
		cmm_window_popup('/client/reservation/reservationList.jsp?hp_name='+hp_name+'&dept_name='+dept_name+'&hp_code='+hp_code,'1200','700','병원 대기&예약 화면');
	}
	function res_pageGet(num){
		$.ajax({
			url:"/client/reservation/jsonMyReservList.jsp?num="+num
			,success:function(data){
				var imsi = data.trim();
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
	
	function pageMove(click){
		var imsi = $(click).children(".sr-only").text();
		if(imsi=="Previous"){
			previous();
		}else if(imsi=="Next"){
			$.ajax({
				url: "/client/login/jsonMyReservList.jsp?num=0"
				,dataType: "text"
				,success: function(data){
					next(data, 1);
				}
			});
		}
	}
	
	function login(){
		alert("로그인 버튼!");

		$("#f_login").attr("method","post");
		$("#f_login").attr("action","/login/login.crm?requestName=login");//로그인 url ****
		$("#f_login").submit();
	

		location.href='/client/login/loginpro.jsp'
	}
	
	function search_addr() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.sigungu; 
                var addr1 = data.sido; 
                var addr2 = data.bname;
                document.getElementById("h_addr").value = addr+" "+addr1+" "+addr2;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        map.setCenter(coords);
                        map.setLevel(4);          
                    }
                });
            }
        }).open();        
    };
    
	function search_h_name(){
		alert("입력한 병원이름: "+$("#h_name").val());
		$.ajax({
			url:'/login/hospitalList.crm?hp_name='+$("#h_name").val()
		   ,dataType: 'json'
		   ,success:function(data){
			   var result = JSON.stringify(data);
			   var jsonDoc = JSON.parse(result);
			   for(var i=0;i<jsonDoc.length;i++){
				 //  var imsi = $("#h_name").val()+"";       
				   var imsi2 = jsonDoc[i].HP_NAME+"";
				 //  if(imsi== imsi2){
					   var coords3 = new daum.maps.LatLng(jsonDoc[i].HP_LAT-0.1,jsonDoc[i].HP_LNG+0.1);
					   map.setCenter(coords3);
					   map.setLevel(4); 
				  // }			
			   }
		   }
		});
	}
	
	function s_categori(){
    	$.ajax({
           url:'/hospital/categori.crm'
           ,dataType: 'json'
           ,success:function(data){
              var res = JSON.stringify(data);
              var res2 = JSON.parse(res);
              var imsi="";
              imsi += '<option value="전체">전체</option>';
              for(var i=0; i<res2.length; i++){
                 var dept_name = res2[i].DEPT_NAME;
                 imsi += '<option value='+"'"+dept_name+"''"+'>'+dept_name+'</option>';
              }
              $("#s_gwa").html(imsi);
           }   
        });
  	}
	
	function categori_map() {
		var i;//마커 생성시 부여한 인덱스값 0~4   
		$.ajax({
			url: '/login/hospitalList.crm'
		   ,dataType: 'json'
		   ,success:function(data){
			   result = JSON.stringify(data);//직관적인 정보로 변환(구조체-덩어리)-알아봄.
			   //$("#d_map").text(result);
			   jsonDoc = JSON.parse(result);//배열로 전환-다시 객체화처리됨.(배열)
//			   alert(jsonDoc.length);
			   
			   for (var i = 0; i < mArray.length; i++) {
				   mArray[i].setMap(null);
				   mArray[i] = null;
			   }
			   
			   for(var i=0;i<jsonDoc.length;i++){ 
	
				   var imsi = jsonDoc[i].DEPT_NAME.toString();
					sts[i] =imsi.indexOf(dept_name);//-1이면 없는거 밑에 마커 없애기. 카테고리정한걸 예약리스트에  보내기

					   marker = new daum.maps.Marker({
						  id: i
						 ,position: new daum.maps.LatLng(jsonDoc[i].HP_LAT-0.1,jsonDoc[i].HP_LNG+0.1)
					     ,map: map//지도는 하나
					     ,title: jsonDoc[i].HP_NAME// 마커가 5개이므로 식당이름 5개 분류
					   });////////////////end of marker
					   
					   mArray[i] = marker;
					   
						if (imsi.indexOf(dept_name) == -1) {
							marker.setMap(null);
			   			} else {

				       daum.maps.event.addListener(marker, 'click',(function(marker,i){
					   return function() {
						   var content = '<b>병원이름 : '+jsonDoc[i].HP_NAME+'</b>';
						   content += '<br>';
						   content += '<b>전화번호 :<br>  '+jsonDoc[i].HP_PHONE+'</b>';
						   content += '<br>';
						   content += '<br>';
						   content += '<b>진료과 : </b>'+jsonDoc[i].DEPT_NAME+'</b>';
						   content += '<b>진료과 : </b>'+dept_name+'</b>';
						   //content += '<b>진료과 : </b>'+array[i]+'</b>';		  
								  
<%
				if(parameter!=null){ 				
%>
									var imsi = jsonDoc[i].HP_NAME;
									var imsi1 = jsonDoc[i].HP_CODE;
									alert(imsi1);
								   //content += '<a href="javascript:popup_reservation('+imsi+')">';																	
								   //content +='<img src=./bookbutton.png width=20 height=20/></a><br>';
								   content += '<button class="btn btn-dark btn-block" onClick="popup_reservation('+"'"+imsi+"'"+","+"'"+imsi1+"'"+')" style="width:46px;font-size:1px;">예약</button><br>'
<%
				}
%>
													content += '<br>';
													content += '<br>';

													infowindow.setContent(content);
													infowindow.open(map, marker);
													map.setCenter(this.getPosition());

												}//end of 반환함수
											})(marker, i));////////////end of addLitener
							//마커를 생성했을때 click이벤트 처리하기
							}//indexof else end
						}///////////////end of for
					}///////////////////end of success
				});////////////////////end of ajax
		map.relayout();
	}
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="./menu.jsp" />
	<!-- 본문 -->
	<div class="container"
		style="font-family: 'Do Hyeon', sans-serif; margin-top: 15px;">
		<div class="row pt-4">
			<!-- 지도 검색 -->
			<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size: x-large; font-color: #4C4C4C;">병원
							검색</label>
					</div>
				</div>
				<hr>
				<!-- 진료과 -->
				<div class="row mb-2 mt-4">
					<div class="col-md">
						<select class="form-control" id="s_gwa">

						</select>
					</div>
				</div>
				<!-- 병원이름 -->
				<div class="row mb-2 pr-1">
					<div class="col-md mr-2 pr-1">
						<div class="input-group">
							<input type="text" class="form-control" id="h_name" name="h_name"
								type="search" placeholder="Ex) 가산독산병원">
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
						<div id="map" style="width: 100%; height: 330px;"></div>
					</div>
				</div>
			</div>
			<!-- 사이드 -->
			<div class="col-md-4">
				<%
					if (mem_name == null) {// 로그인 전이니? ****
				%>
				<!-- 로그인 폼1 -->
				<div class="container" style="background-color: #EAEAEA;">
					<div class="row mt-2 mb-2">
						<div class="col-md">
							<button class="btn btn-md bg-lignt"
								onClick="location.href='/client/mypage/createAccount.jsp'">회원가입</button>
						</div>
						<div class="col-md">
							<button class="btn btn-md btn-dark btn-block"
								onClick="popup_reservation('가산독산병원')">병원</button>
						</div>
					</div>
					<form id="f_login">
						<!-- 로그인 폼전송 -->
						<div class="row mb-2">
							<div class="col-md">
								<input type="text" class="form-control" id="u_id" name="u_id"
									placeholder="아이디" aria-label="Id">
							</div>
						</div>
						<div class="row mb-2">
							<div class="col-md">
								<input type="password" class="form-control" id="u_pw"
									name="u_pw" placeholder="비밀번호" aria-label="Password">
							</div>
						</div>
					</form>
					<div class="row mb-1">
						<div class="col-md">
							<button class="btn btn-md btn-dark btn-block" onClick="login()">로그인</button>
							<%
								if (session.getAttribute("msg") != null) {
							%>
							<small id="loginFail" class="text-danger">아이디 혹은 비밀번호가
								일치하지 않습니다.</small>
							<%
								} else {
							%>
							<small id="loginFail" class="text-danger"></small>

							<%
								}
							%>


						</div>
					</div>
				</div>
				<!-- 옆 상단 배너 -->
				<div class="container" style="background-color: #EAEAEA;">
					<div class="card">
						<h5 class="card-header">
							<a href="../info/citeIntro.jsp">About Kosmo</a>
						</h5>
						<div class="card-body">
							<p class="card-text">
								코스모 메디컬 사이트 방문을 환영합니다.<br>첫방문이신가요?
							</p>
						</div>
					</div>
				</div>
				<%
					} else {// 로그인 되었니? ****
				%>
				<!-- 로그인 폼2 -->
				<div class="container" style="background-color: #EAEAEA;">
					<!-- 회원이름 문구 -->
					<div class="row mb-2">
						<div class="col-md">
							<label style="font-size: large;"><%=mem_name%> 님 환영합니다.</label>
						</div>
						<div class="col-md">
							<button class="btn btn-md btn-dark btn-block"
								onClick="location.href='./logout.jsp'">로그아웃</button>
						</div>
					</div>
					<!-- 예약정보 -->
					<div class="row mb-1">
						<div class="col-md">
							<!-- 정보 -->
							<div class="card">
								<h6 class="card-header"
									style="height: 35px; background-color: #007bff; color: #FFFFFF;">예약정보</h6>
								<div class="card-body pt-1"
									style="background-color: #FAED7D; height: 110px;">
									<div class="row">
										<div class="col-md py-1 px-3" style="height: 100px;">
											<table>
												<tr>
													<td style="padding-right: 50px;">
														<table id="t_my_resevation">
														</table>
													</td>
													<td>
														<table id="qr_img">
															<tr>
																<td><img src="./qrCode.jpg" class="rounded"
																	alt="qr코드 이미지"></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- 페이지네이션 -->
							<ul class="pagination pagination-small justify-content-center mb-0">
								<li class="page-item">
									<a class="page-link py-1 px-2 my-1 mr-1" href="#" onClick="pageMove(this)" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a>
								</li>
								<li class="page-item mr-1" id="p_1"><a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a></li>
								<li class="page-item mr-1" id="p_2"><a class="page-link p-1 px-2 my-1" href="#" id="page_2"  onClick="page(this)" >2</a></li>
								<li class="page-item mr-1" id="p_3"><a class="page-link p-1 px-2 my-1" href="#" id="page_3"  onClick="page(this)" >3</a></li>
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
								<h6 class="card-header" style="height: 35px;">즐겨찾는 병원</h6>
								<!-- 컬러 블루로 -->
								<div class="card-body py-3">
									<!-- 컬러 노랑이로 -->
									<div class="row">
										<div class="col-md">
											<a href="#" style="color: #353535;"><img src="./star.jpg"
												class="rounded">&nbsp;&nbsp;가산</a>
										</div>
										<div class="col-md">
											<a href="#" style="color: #353535;"><img src="./star.jpg"
												class="rounded">&nbsp;&nbsp;독산</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md">
											<a href="#" style="color: #353535;"><img src="./star.jpg"
												class="rounded">&nbsp;&nbsp;광명</a>
										</div>
										<div class="col-md">
											<a href="#" style="color: #353535;"><img src="./star.jpg"
												class="rounded">&nbsp;&nbsp;영등포</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<!-- 옆 하단 배너 -->
				<div class="container"
					style="background-color: #EAEAEA; padding-bottom: 15px;">
					<div class="card">
						<h5 class="card-header">
							<a href="#">Customer Service</a>
						</h5>
						<div class="card-body">
							<h6 class="card-title">고객센터</h6>
							<p class="card-text">
								전화번호: 02-123-4567<br>FAX번호: 122-3442<br>운영시간: 9:00 ~
								18:00
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="./footer.jsp" />
	<!-- 돔 구성 완료되었을 떄 -->
	<script type="text/javascript">
	$(document).ready(function(){
	<%if (mem_name != null) {%>
			$.ajax({
					url : "/client/reservation/jsonMyReservList.jsp?num=" + 1,
					success : function(data) {
						var imsi = data.trim();
						var res = JSON.parse(imsi);
						var inner = "";
						for (var i = 0; i < res.length; i++) {
							inner += "<tr><th style='padding:2px;'>진료과목</th><td style='padding:2px;'>"
									+ res[i].GAW + "</td></tr>";
							inner += "<tr><th style='padding:2px;'>담당의사</th><td style='padding:2px;'>"
									+ res[i].DOC + "</td></tr>";
							inner += "<tr><th style='padding:2px;'>예약날짜</th><td style='padding:2px;'>"
									+ res[i].DATE + "</td></tr>";
							inner += "<tr><th style='padding:2px;'>예약시간</th><td style='padding:2px;'>"
									+ res[i].TIME + "</td></tr>";
						}
						$("#t_my_resevation").html(inner);
					}
				});
		//************************* 즐겨찾기병원 목록 가져오기!! (hidden으로 병원코드 숨겨놓기)
	<%}%>
	$.ajax({
		url: "/client/login/jsonMyReservList.jsp?num=0"
		,dataType: "text"
		,success: function(data){
			var totalSize = Number(data.trim()); 
			var mok = parseInt(totalSize);
			if(mok<3){
				$("#page_3").remove();
				if(mok<2){
					$("#page_2").remove();
					if(mok<1){
						$("#page_1").remove();
					}
				}
			}
			res_pageGet(1);
		}
	});
	
	$("#s_gwa").change(function(){
		alert(this.value);
	});
});

		$(document).ready(function() { //카테고리 선택
			s_categori();//dept name 선택
			categori_map();
			
			$("#s_gwa").change(function() {
				alert(this.value);
				dept_name = $('#s_gwa').val();
				alert("dept_name: " + dept_name);
				categori_map();
			});

		});
	</script>
	<!-- 지도 API -->
	<script>
		var geocoder = new daum.maps.services.Geocoder();

		var map = new daum.maps.Map(document.getElementById('map'), {
			zoom : 20,
			center : new daum.maps.LatLng(37.478513, 126.877800),
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		});
		var infowindow = new daum.maps.InfoWindow();//말풍선을 클릭했을 때 열리는 창
	</script>
</body>
</html>