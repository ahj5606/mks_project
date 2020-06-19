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
	#board_1 > a, #board_2 > a, #doc_1 > a, #doc_2 > a,#doc_3 > a{
		color:#4C4C4C;
	}
</style>
<script type="text/javascript">
	function res_pageGet(num){
		$.ajax({
			url:"/mks_project/client/login/jsonReservList.jsp?num="+num
			,success:function(data){
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
			}
		});
	}
	function search_doc_name(){
		alert("입력한 의사이름: "+$("#doc_name").val());
	}
	function popup_board(){
		alert("공지사항목록 팝업!");
		cmm_window_popup('/mks_project/client/reservation/boardList.jsp?hp_name='+<%=hp_name%>,'1200','800','공지사항');
	}
	function board_detail(b_choice){
		//*** input 태그 안에 공지사항 b_no(pk) 숨겨 놓고 클릭할때 그 값을 가져온다..
		var b_no = $(b_choice).children("input").val();
		alert("공지사항번호: "+b_no+" ==> 모달띄워야함!!");
	}
	function waiting(){
		alert("대기버튼!");
	}
	function doc_detail(doc_choice){//의사상세정보 
		//*** input 태그 안에 doc_code(pk) 숨겨 놓고 클릭할때 그 값을 가져온다..
		var doc_code = $(doc_choice).children("input").val();
		alert("의사 코드: "+doc_code);
		/* 
		$.ajax({
			url:"/mks_project/client/login/jsonReservation.jsp?doc_code="+doc_code
			,success:function(data){
				//모달창에 정보 뿌리기
				$('#modal_doc').modal('show')
			}
		}); 
		*/
		$('#modal_doc').modal('show')
	}
	//예약버튼을 눌렀을 때 *******************************************************************************
	function reservation_detail(doc_choice){//상세예약하는 화면 열기!
		//*** input 태그 안에  doc_code & dept_code(pk) 숨겨 놓고 클릭할때 그 값을 가져온다..
		var doc_code = $(doc_choice).children("input").val();
		var doc_name = $(doc_choice).children("a").text();
		alert("예약하기 원하는 의사이름: "+doc_name);
		if(doc_name.length==0){//만약 의사이름이 없다면 == 일반내과 전체
			alert("전체");
			cmm_window_popup('/mks_project/client/reservation/reservation.jsp?dept_code='+doc_code+"&hp_name="+'<%=hp_name%>','1200','920','병원 대기&예약 화면');
			/* ****과 코드를 넘겨서 상세예약화면에서 dept_code로 
					1)해당 과의 전체 의사 목록 뽑아서 카테고리완성, dept_name 전달   2)과전체 의사의 예약가능 날짜 List로 전달
			*/
		}else{
			alert("의사 코드: "+doc_code);
			cmm_window_popup('/mks_project/client/reservation/reservation.jsp?doc_code='+doc_code+"&hp_name="+'<%=hp_name%>','1200','920','병원 대기&예약 화면');
			/* ****의사 코드를 넘겨서 상세예약화면에서 doc_code로		
					1)해당 의사의 dept_code를 뽑아서 의사 카테고리완성, dept_name 전달   2)해당의사의 예약가능날짜  List로 전달
			}); 
			*/
		}
	}
</script>
</head>
<body>
	<!-- 네이게이션 -->
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#007bff;">
	    <a class="navbar-brand" href="#"><%=hp_name%></a>
    </nav>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:20px;">
	  	<!-- 상단1 -->
	  	<div class="row mb-3 mt-2">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">[<%=mem_name%>] 님 예약 화면</label>
					</div>
				</div>
			</div>
		</div>
		<!-- 상단2 -->
	  	<div class="row mb-3 mt-2">
	  		<!-- 검색 -->
	  		<div class="col-md pr-1">
	  			<!-- 진료과 -->
				<div class="row">
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
	  			<!-- 의사이름 -->
				<div class="row pt-2">
					<div class="col-md">
						<div class="input-group">
		      				<input type="text" class="form-control" id="doc_name" name="doc_name" type="search" placeholder="Ex) 고길동">
		      				<div class="input-group-prepend">
		      					<button class="btn btn-dark btn-block" onClick="search_doc_name()">이름검색</button>
		      				</div>
		   				</div>
					</div>
				</div>
			</div>
			<!-- 공지사항 -->
	  		<div class="col-8">
				<div class="row">
					<div class="col-md">
						<button class="btn btn-dark btn-block bg-light btn-outline-light" onClick="popup_board()">공지사항</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md">
						<div class="border mb-0">
							<ul id="board_list" style="margin-bottom:0;">
								<!-- 
									** 돔구성이 완료되었을 때 li를 2개 넣어 준다!
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
							<table class="table table-hover" id="t_reservationlList" style="text-align:center;">
								<!-- 
									** 돔구성이 완료되었을 때  tbody를 완성해준다.
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
								<tbody>
									<tr>
										<th scope="row">원무과</th>
										<td></td>
										<td>15분</td>
										<td><button class="btn btn-dark btn-small" onClick="waiting()">대기</button></td>
									</tr>
									<tr>
										<th scope="row">일반내과</th>
										<td id="doc_1"><a href="javascript:doc_detail($('#doc_1'))"></a><input type="hidden" value="55555"></td>
										<td></td>
										<td><button class="btn btn-dark btn-small" onClick="reservation_detail($('#doc_1'))">예약</button></td>
									</tr>
									<tr>
										<th scope="row">일반내과</th>
										<td id="doc_2"><a href="javascript:doc_detail($('#doc_2'))">고길동2</a><input type="hidden" value="122"></td>
										<td></td>
										<td><button class="btn btn-dark btn-small" onClick="reservation_detail($('#doc_2'))">예약</button></td>
									</tr>
									<tr>
										<th scope="row">일반내과</th>
										<td id="doc_3"><a href="javascript:doc_detail($('#doc_3'))">고길동3</a><input type="hidden" value="131"></td>
										<td></td>
										<td><button class="btn btn-dark btn-small" onClick="reservation_detail($('#doc_3'))">예약</button></td>
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
	
	<!-- Modal -->
	<div class="modal fade" id="modal_doc" tabindex="-1" role="dialog" aria-hidden="true">
  		<div class="modal-dialog" role="document">
   			<div class="modal-content">
   				<!-- head -->
     	 		<div class="modal-header">
        			<h5 class="modal-title">의사 상세 정보</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
      			<!-- body -->
      			<div class="modal-body">
       				<table class="table table-hover" style="text-align:center;">
						<thead class="thead-light">
							<tr>
								<th scope="col">이름</th>
								<th scope="col">진료과목</th>
								<th scope="col">전공</th>
								<th scope="col">직급</th>
							</tr>
						</thead>
						<tbody id="doc_detail">
							<!-- 의사이름 눌렀을 떄, doc_code가 넘어가서 select한 값을  뿌려준다...-->
						</tbody>
					</table>
     			</div>
     			<!-- footer -->
     			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        			<button type="button" class="btn btn-primary">저장</button>
      			</div>
    		</div>
  		</div>
	</div>
	
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
		$(document).ready(function(){
			$("#s_gwa").change(function(){
				alert(this.value);
			});
		});
	</script>
</body>
</html>