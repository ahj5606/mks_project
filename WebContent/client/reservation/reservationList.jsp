<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hp_name = null;// 팝업창 열릴 때 파라미터로 넘어온 **** 병원이름 
	if( request.getParameter("hp_name")!=null){
		hp_name =  request.getParameter("hp_name");
	}
	
	String mem_name = null;// 세션에 저장되어있는 **** 회원이름
	if(session.getAttribute("mem_name")!=null){
		mem_name = (String)session.getAttribute("mem_name");
	};
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>예약목록 화면</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c4b678674e7c8512ebf2cadc156977&libraries=services"></script>
<%@ include file="/common/bootStrap4UI.jsp"%>
<style type="text/css">
	.container{
		padding:5px;
	}
	.navbar .navbar-nav .nav-link {
	  color: #F6F6F6;
	  border-radius: .25rem;
	  margin: 0 0.25em;
	  font-family: 'Do Hyeon', sans-serif;
	  font-size: x-large;
	}
	.navbar .navbar-nav .nav-link:not(.disabled):hover,
	.navbar .navbar-nav .nav-link:not(.disabled):focus {
	  color: #FFFFFF;
	}
	.navbar .navbar-nav .nav-item.active .nav-link,
	.navbar .navbar-nav .nav-item.active .nav-link:hover,
	.navbar .navbar-nav .nav-item.active .nav-link:focus,
	.navbar .navbar-nav .nav-item.show .nav-link,
	.navbar .navbar-nav .nav-item.show .nav-link:hover,
	.navbar .navbar-nav .nav-item.show .nav-link:focus {
	  color: #FFFFFF;
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
	function search_h_name(){
		alert("입력한 병원이름: "+$("#h_name").val());
	}
	function popup_board(){
		alert("공지사항 검색");
	}
	function board_detail(b_choice){
		//*** input 태그 안에 공지사항 b_no(pk) 숨겨 놓고 클릭할때 그 값을 가져온다..
		var b_no = $(b_choice).children("input").val();
		alert(b_no);
		cmm_window_popup('/mks_project/client/reservation/boardList.jsp?b_no='+b_no,'1200','800','공지사항');
	}
	function waiting(){
		alert("대기버튼!");
	}
	function doc_detail(doc_choice){//의사상세정보
		//*** input 태그 안에 공지사항 doc_code(pk) 숨겨 놓고 클릭할때 그 값을 가져온다..
		var doc_code = $(doc_choice).children("input").val();
		alert("정보를 원하는 의사: "+doc_code);
		cmm_window_popup('/mks_project/client/reservation/docterDetail.jsp?doc_code='+doc_code,'500','500','의사상세정보');
	}
	function reservation_detail(doc_choice){//예약하러 가기!!
		//*** input 태그 안에 공지사항 doc_code(pk) 숨겨 놓고 클릭할때 그 값을 가져온다..
		var doc_code = $(doc_choice).children("input").val();
		alert("예약하기 원하는 의사: "+doc_code);
		location.href= '/mks_project/client/reservation/reservation.jsp?doc_code='+doc_code;
	}
</script>
</head>
<body>
	<!-- 네이게이션 -->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#007bff;">
	    <button class="navbar-toggler" aria-controls="popup_title" aria-expanded="false">
	    	<span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-md-center" id="popup_title">
	    	<ul class="navbar-nav">
	   			<li class="nav-item active">
	    			<a class="nav-link" href="#"><%if(hp_name!=null){ out.print(hp_name); }%></a>
	    		</li>
	    	</ul>
	    </div>
    </nav>
	
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:20px;">
	  	<!-- 상단 -->
	  	<div class="row mb-3 mt-2">
	  		<!-- 우측 -->
	  		<div class="col-md">
	  			<!-- ~님 -->
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">[<%=mem_name%>] 님 예약 화면</label>
					</div>
				</div>
				<!-- 검색 -->
				<div class="row pt-4">
					<!-- 진료과  -->
					<div class="col-md pr-0">
						<select class="form-control" id="s_gwa">
							<option value="진료과">진료과</option>
							<option value="내과">내과</option>
							<option value="외과">외과</option>
							<option value="소아과">소아과</option>
							<option value="이비인후과">이비인후과</option>
						</select>
					</div>
					<!-- 이름 -->
					<div class="col-md">
						<div class="input-group">
      						<input type="text" class="form-control" id="h_name" name="h_name" type="search" placeholder="Ex) 가산독산병원">
      						<div class="input-group-prepend">
      							<button class="btn btn-dark btn-block" onClick="search_h_name()">이름검색</button>
      						</div>
   						</div>
					</div>
					
				</div>
			</div>
			<!-- 좌측: 공지사항 -->
	  		<div class="col-md pt-4">
				<div class="row">
					<div class="col-md">
						<button class="btn btn-dark w-50" onClick="popup_board()">공지사항</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md">
						<div class="border mb-0">
							<ul id="board_list" style="margin-bottom:0;">
								<!-- 
									** 돔구성이 완료되었을 때 html()로 li를 2개 넣어 준다!
									1) 공지사항 목록 2개 가져오면서 b_no을 input의 value 값으로 박아놓고 hidden으로 숨긴다...
									2) 클릭하면 "공지사항상세화면 주소?b_no=3"으로 요청을 보낸다...
								 -->
								<li id="board_1"><a href="javascript:board_detail($('#board_1'))">자바라기</a><input type="hidden" value="1"></li>
								<li id="board_2"><a href="javascript:board_detail($('#board_2'))">프로젝트</a><input type="hidden" value="2"></li>
							</ul>		
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 하단 -->
	  	<div class="row">
	  		<div class="col-md">
	  			<!-- 테이블 -->
				<div class="row mb-0">
					<div class="col-md">
						<div class="table-responsive-md">
							<table class="table table-hover" style="text-align:center;">
								<!-- 
									** 돔구성이 완료되었을 때  html()로 테이블 tbody를 완성해준다.
									1) 의사 목록 가져오면서 doc_code을 input의 value 값으로 박아놓고 hidden으로 숨긴다...
									2) 의사를 클릭하면 "의사 상세화면 주소?doc_code=3222"으로 요청을 보낸다...
									3) 예약버튼을 클릭하면 "예약 상세화면 주소?doc_code=3222"으로 요청...
								 -->
								<thead class="thead-light">
									<tr>
										<th scope="col">진료 과목</th>
										<th scope="col">의사선생님</th>
										<th scope="col">대기 시간</th>
										<th scope="col">대기 및 예약</th>
									</tr>
								</thead>
								<tbody id="t_reservationlList">
									<tr>
										<th scope="row">원무과</th>
										<td></td>
										<td>15분</td>
										<td><button class="btn btn-dark w-50" onClick="waiting()">대기</button></td>
									</tr>
									<tr>
										<th scope="row">일반내과(전체)</th>
										<td id="doc_1"><a href="javascript:doc_detail($('#doc_1'))"></a><input type="hidden" value="일반내과전체"></td>
										<td></td>
										<td><button class="btn btn-dark w-50" onClick="reservation_detail($('#doc_1'))">예약</button></td>
									</tr>
									<tr>
										<th scope="row">일반내과1</th>
										<td id="doc_2"><a href="javascript:doc_detail($('#doc_2'))">고길동2</a><input type="hidden" value="122"></td>
										<td></td>
										<td><button class="btn btn-dark w-50" onClick="reservation_detail($('#doc_2'))">예약</button></td>
									</tr>
									<tr>
										<th scope="row">일반내과2</th>
										<td id="doc_3"><a href="javascript:doc_detail($('#doc_3'))">고길동3</a><input type="hidden" value="131"></td>
										<td></td>
										<td><button class="btn btn-dark w-50" onClick="reservation_detail($('#doc_3'))">예약</button></td>
									</tr>
								</tbody>
							</table>
						</div>	
					</div>
				</div>
				<!-- 페이지네이션 -->
				<div class="row mb-4">
					<div class="col-md">
						<ul class="pagination pagination-small justify-content-center mb-0">
							<li class="page-item">
								<a class="page-link py-1 px-2 my-1 mr-1" href="#" onClick="pageMove(this)" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
								</a>
							</li>
							<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a></li>
							<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_2" onClick="page(this)" >2</a></li>
							<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_3" onClick="page(this)" >3</a></li>
							<li class="page-item mr-1">
								<a class="page-link p-1 px-2 my-1" href="#" onClick="pageMove(this)" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
							</li>
						</ul>
					</div>
				</div><!-- 페이지네이션 끝 -->
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
			$.ajax({// **** 공지사항 가져오는 아작스
				/* 
				#board_list 에 html() 함수를 써서 아래 식으로 html을 넣어준다.
				<li id="board_1"><a href="javascript:board_detail($('#board_1'))">자바라기</a><input type="hidden" value="1"></li>
				<li id="board_2"><a href="javascript:board_detail($('#board_2'))">프로젝트</a><input type="hidden" value="2"></li> 
				*/
			});
			$.ajax({// **** 테이블 목록 가져오는 아작스
				/* 
				#t_reservationlList 에 html() 함수를 써서 아래 식으로 html을 넣어준다.
				**** 일반내과(전체)와 같은 경우는.... 음... 부서코드를 박아야되나...?
				<tr>
					<th scope="row">일반내과1</th>
					<td id="doc_2"><a href="javascript:doc_detail($('#doc_2'))">고길동2</a><input type="hidden" value="122"></td>
					<td></td>
					<td><button class="btn btn-dark w-50" onClick="reservation_detail($('#doc_2'))">예약</button></td>
				</tr>
				*/
			});
		});
	</script>
</body>
</html>