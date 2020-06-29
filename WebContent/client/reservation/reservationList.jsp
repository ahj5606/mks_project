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
   
   String dept_name=null;
   if( request.getParameter("dept_name")!=null){
	      dept_name =  request.getParameter("dept_name");
	      if(dept_name.length()==0 || "전체".equals(dept_name)){
	    	  dept_name=null;
	      }
	   }
   String hp_code=null;
   if( request.getParameter("hp_code")!=null){
	     hp_code =  request.getParameter("hp_code");
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
<title>예약목록 화면</title>
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
	#board_1 > a, #board_2 > a, #doc_1 > a, #doc_2 > a,#doc_3 > a{
		color:#4C4C4C;
	}
	#board, #board:hover{
		color:#4C4C4C;
		background-color:#EAEAEA;
		border-color:#EAEAEA; 
	}
	a.page-link{
		color:#4C4C4C;
	}
	body{
	  	font-family: 'Do Hyeon', sans-serif;
	}
</style>
<script type="text/javascript">
var hp_code = '<%=hp_code%>'
var dept_name = '<%=dept_name%>';
var doc_name = "";
function res_pageGet(num){
	alert("hp_code: "+hp_code+", dept_name: "+dept_name+", doc_name: "+doc_name);
	$.ajax({
        url:'/reservation/proc_reservelist.crm?hp_code='+hp_code+'&dept_name='+dept_name+'&num='+num+'&doc_name='+doc_name
        ,dataType: 'json'
        ,success:function(data){
           var result = JSON.stringify(data);
           var jsonDoc = JSON.parse(result);
           var imsi="";
           alert(hp_code);
           alert("아작스후: "+dept_name);
           for(var i=0; i<jsonDoc.length; i++){
              	imsi +=	'<tr>';
			  	imsi +=	'<th scope="row">'+jsonDoc[i].DEPT_NAME+'</th>';
			  	imsi += '<td>';
				if( jsonDoc[i].DOC_NAME !=null){
			  	imsi +=	"<a href='#' onClick=doc_detail(this)><input type='hidden' value="+"'"+jsonDoc[i].DOC_CODE+"'>"+jsonDoc[i].DOC_NAME+"</a>";
			  	}
			  	imsi += '</td>';
			  	imsi +='<td></td>';
		  		if(jsonDoc[i].DEPT_NAME=="원무과"){

		  			imsi += "<td><button class='btn btn-dark btn-small' onClick='waiting()'>대기</button></td>"
		  		}else{
		  			if(jsonDoc[i].DOC_CODE==null){				  		
		  			imsi +="<td><button class='btn btn-dark btn-small' onClick=reservation_detail(this)><input class='doc_no' type='hidden' value="+"'"+jsonDoc[i].DEPT_NAME+"'>예약</button></td>";
		  			}else{
		  			imsi +="<td><button class='btn btn-dark btn-small' onClick=reservation_detail(this)><input class='doc_yes' type='hidden' value="+"'"+jsonDoc[i].DOC_CODE+"'>예약</button></td>";
		  			}
		  		imsi += '</tr>';
		  		}
           }
           $("#tbody").html(imsi);
        }   
	});
}	
function pageMove(click){
	var imsi = $(click).children(".sr-only").text();
	if(imsi=="Previous"){
		previous();
	}else if(imsi=="Next"){
		$.ajax({
			url: '/reservation/proc_reservelist.crm?hp_code='+hp_code+'&dept_name='+dept_name+'&num=0&doc_name='+doc_name
			,dataType: "text"
			,success: function(data){
				next(data, 5);
			}
		});
	}
}
function page_btn(){
	$.ajax({
		url: '/reservation/proc_reservelist.crm?hp_code='+hp_code+'&dept_name='+dept_name+'&num=0&doc_name='+doc_name
		,dataType: "text"
		,success: function(data){
			var totalSize = Number(data.trim()); 
			var mok = Math.ceil(totalSize/5);
			alert("page_btn*mok: "+mok);
			$("#p_1").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a>');
			$("#p_2").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_2" onClick="page(this)" >2</a>');
			$("#p_3").html('<a class="page-link p-1 px-2 my-1" href="#" id="page_3" onClick="page(this)" >3</a>');
			if(mok<3){
				$("#page_3").remove();
				if(mok<2){
					$("#page_2").remove();
					if(mok<1){
						$("#page_1").remove();
					}
				}
			}
		}
	});
}
//------------------------진료과 선택--------------------------
function s_categori(){
	$.ajax({
       url:'/reservation/deptCategory.crm?hp_code='+'<%=hp_code%>'+'&num=1'
       ,dataType: 'json'
       ,success:function(data){
          var res = JSON.stringify(data);
          var res2 = JSON.parse(res);
          var imsi="";
          <%if(dept_name!=null){%>
          alert("not null"+'<%=dept_name%>');
          imsi += '<option value="'+'<%=dept_name%>'+'">'+'<%=dept_name%>'+'</option>';
          imsi += '<option value="전체">전체</option>';
          <%}else{%>
          alert("null: "+'<%=dept_name%>');
          imsi += '<option value="전체">전체</option>';
          <%}%>
          for(var i=0; i<res2.length; i++){
        	  <%if(dept_name!=null){%>
        	  var d_name = '<%=dept_name%>';
        	  if(res2[i].DEPT_NAME!=d_name){
	             imsi += '<option value='+"'"+res2[i].DEPT_NAME+"''"+'>'+res2[i].DEPT_NAME+'</option>';
        	  }
             <%}else{%>
	             imsi += '<option value='+"'"+res2[i].DEPT_NAME+"''"+'>'+res2[i].DEPT_NAME+'</option>';
             <%}%>
          }
          $("#s_gwa").html(imsi);
       }   
    });
	}
//------------------------의사 검색---------------------------
 function search_doc_name(){
		doc_name = $("#doc_name").val();
		if(dept_name=="전체"){
			dept_name = "";
		}
		alert("입력한 의사이름: "+doc_name);
		$.ajax({
			 url:'/reservation/proc_reservelist.crm?hp_code='+hp_code+'&dept_name='+dept_name+'&num=1&doc_name='+doc_name
		   ,dataType: 'json'
		   ,success:function(data){
			    var result = JSON.stringify(data);
	               var jsonDoc = JSON.parse(result);
	               var imsi="";
	               for(var i=0; i<jsonDoc.length; i++){
	                  	imsi +=	'<tr>';
					  	imsi +=	'<th scope="row">'+jsonDoc[i].DEPT_NAME+'</th>';
					  	imsi += '<td>';
						if( jsonDoc[i].DOC_NAME !=null){
					  	imsi +=	"<a href='#' onClick=doc_detail(this)><input type='hidden' value="+"'"+jsonDoc[i].DOC_CODE+"'>"+jsonDoc[i].DOC_NAME+"</a>";
					  	}
					  	imsi += '</td>';
					  	imsi +='<td></td>';
					  		if(jsonDoc[i].DEPT_NAME=="원무과"){

					  			imsi += "<td><button class='btn btn-dark btn-small' onClick='waiting()'>대기</button></td>"
					  		}else{
					  			if(jsonDoc[i].DOC_CODE==null){				  		
					  			imsi +="<td><button class='btn btn-dark btn-small' onClick=reservation_detail(this)><input class='doc_no' type='hidden' value="+"'"+jsonDoc[i].DEPT_NAME+"'>예약</button></td>";
					  			}else{
					  			imsi +="<td><button class='btn btn-dark btn-small' onClick=reservation_detail(this)><input class='doc_yes' type='hidden' value="+"'"+jsonDoc[i].DOC_CODE+"'>예약</button></td>";
					  			}
					  		imsi += '</tr>';
					  		}
	               }	
	               $("#tbody").html(imsi);
		   		}
		});
		page_btn();
	} 
//------------------------의사 검색 끝---------------------------	
	function popup_board(){
		alert("공지사항목록 팝업!");
		cmm_window_popup('/client/reservation/h_boardList.jsp?hp_name='+'<%=hp_name%>','1000','700','공지사항');
	}
	function board_detail(b_choice){
		//*** input 태그 안에 공지사항 b_no(pk) 숨겨 놓고 클릭할때 그 값을 가져온다..
		var b_no = $(b_choice).children("input").val();
		alert("공지사항번호: "+b_no+" ==> 모달띄워야함!!");
	}
	function waiting(){
		alert("대기 팝업!");
		cmm_window_popup('/client/reservation/waitting.jsp','400','400','원무과 대기 정보');
	}
	function doc_detail(el){//의사상세정보 
		//*** input 태그 안에 doc_code(pk) 숨겨 놓고 클릭할때 그 값을 가져온다..
		var doc_code = $(el).children("input").val();
		alert("의사 코드: "+doc_code);
		
		$('#doc_detail').bootstrapTable('refreshOptions', {
	           url:'/reservation/docSel.crm?doc_code='+doc_code
		});
		$("div.fixed-table-loading").remove();	 
		
		$('#modal_doc').modal('show');
	}
	//예약버튼을 눌렀을 때 *******************************************************************************
	function reservation_detail(doc_choice){//상세예약하는 화면 열기!
		//*** input 태그 안에  doc_code & dept_code(pk) 숨겨 놓고 클릭할때 그 값을 가져온다..
		var doc_code = $(doc_choice).children("input").val();
		
		var imsi = $(doc_choice).children("input").attr('class');
		alert(imsi);
		if(imsi=='doc_yes'){//만약 의사이름이 없다면 == 일반내과 전체
			alert("의사 코드: "+doc_code);
			cmm_window_popup('/client/reservation/reservation.jsp?doc_code='+doc_code+"&hp_code="+'<%=hp_code%>','1200','950','상세예약');
			/* ****과 코드를 넘겨서 상세예약화면에서 dept_code로 
					1)해당 과의 전체 의사 목록 뽑아서 카테고리완성, dept_name 전달   2)과전체 의사의 예약가능 날짜 List로 전달
			*/
		}else{
			alert("전체"+doc_code);
			cmm_window_popup('/client/reservation/reservation.jsp?dept_code='+doc_code+"&hp_code="+'<%=hp_code%>','1200','950','상세예약');
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
	    <a class="navbar-brand" href="#"><%=hp_name%><input type="hidden" value="12345"></a><!-- 병원코드 숨겨두기 -->
    </nav>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:15px;">
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
	  		<div class="col-md py-1 pr-1">
	  			<!-- 진료과 -->
				<div class="row mr-1">
					<div class="col-md">
						<select class="form-control" id="s_gwa">
						</select>
					</div>
				</div>
	  			<!-- 의사이름 -->
				<div class="row mr-1 pt-2">
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
	  		<div class="col-8 pt-1 ml-1">
				<div class="row">
					<div class="col-md">
						<button class="btn btn-dark btn-block" onClick="popup_board()" id="board">공지사항</button>
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
						<tbody id="tbody">
									<!--   <tr>
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
									</tr> -->	 
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
				</div><!-- 페이지네이션 끝 -->
	  		</div>
	  	</div>
	</div>
	<!-- footer -->
	<!-- <footer>
		<div class="row bg-light pt-3">
		</div>
	</footer> -->
	<!-- 의사 모달 -->
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
       				<table class="table table-hover" id="doc_detail" style="text-align:center;">
						<thead class="thead-light">
							<tr>
								<th scope="col">이름</th>
								<th scope="col">진료과목</th>
								<th scope="col">전공</th>
								<th scope="col">직급</th>
							</tr>
						</thead>
					</table>
     			</div>
     			<!-- footer -->
     			<div class="modal-footer">
        			<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
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
			 s_categori();
			 res_pageGet(1);
			 page_btn();
			$("#s_gwa").change(function(){
				alert("카테코리 선택: "+this.value);
				dept_name = $('#s_gwa').val();
				search_doc_name();
			}); 
		});
		
	</script>
</body>
</html>