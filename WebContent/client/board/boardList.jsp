<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object parameter = session.getAttribute("mem_name");
	String mem_name = null;
	if(parameter!=null){
		mem_name = (String)parameter;
	}
	
	Object parmeter2 = session.getAttribute("mks_id");
	String mks_id = null;
	if(parmeter2!=null){
		mks_id = (String)parmeter2;
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
<title>게시판 화면</title>
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
		height:40px;
		font-size:medium;
		color:#353535;
		/* padding:2px; ===> 왜 안먹지...?*/
	}
	a.page-link{
		color:#4C4C4C;
	}
</style>
<script type="text/javascript">
	var b_order ="날짜별";
	var b_title = "";
	var b_writer = "";
	var hp_name = "";
	function res_pageGet(num){
		alert("카테고리: "+b_order);
		alert(b_title);
		alert(b_writer);
		alert(b_writer);
		if(b_order=="날짜별"){
			$('#t_boardList').bootstrapTable('refreshOptions', {
				 url: "/board/boardList.crm?num="+num+"&b_title="+b_title+"&b_writer="+b_writer+"&hp_name="+hp_name
			});
		}else{
			$('#t_boardList').bootstrapTable('refreshOptions', {
				url: "/board/boardList.crm?num="+num+"&b_title="+b_title+"&b_writer="+b_writer+"&hp_name="+hp_name+"&b_order="+b_order
			});
		}
		$("div.fixed-table-loading").remove(); 
	} 
	function pageMove(click){
		var imsi = $(click).children(".sr-only").text();
		if(imsi=="Previous"){
			previous();
		}else if(imsi=="Next"){
			$.ajax({
				url: "/board/boardList.crm?num=0"
				,dataType: "text"
				,success: function(data){
					next(data, 5);
				}
			});
		}
	}
	function page_btn(){
		$.ajax({
			url: "/board/boardList.crm?num=0&b_title="+b_title+"&b_writer="+b_writer+"&hp_name="+hp_name
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
	function board_write(){
		var mks_id = '<%=mks_id%>'
		$.ajax({
			url: '/board/boardResList.crm?mks_id='+mks_id
			,success:function(data){
				var res = JSON.parse(data);
				alert("사이즈: "+res.length);
				if(res.length>0){
					location.href='/client/board/boardForm.jsp'
				}else{
					alert("후기를 작성할 수 있는 예약정보가 존재하지 않습니다.");
				}
			}
		});
	}
	function con_search(){
		b_title = $("#b_title").val();
		b_writer = $("#b_writer").val();
		hp_name = $("#hp_name").val();
		b_order = $("#b_order").val();
		alert("b_title: "+b_title+", b_writer: "+b_writer+", hp_name: "+hp_name+", b_order:"+b_order);
		if(b_order=="날짜별"){
			$('#t_boardList').bootstrapTable('refreshOptions', {
				 url: "/board/boardList.crm?num=1&b_title="+b_title+"&b_writer="+b_writer+"&hp_name="+hp_name
			});
		}else{
			alert(b_order);
			$('#t_boardList').bootstrapTable('refreshOptions', {
				 url: "/board/boardList.crm?num=1&b_title="+b_title+"&b_writer="+b_writer+"&hp_name="+hp_name+"&b_order="+b_order
			});
		}
		page_btn();
		$("div.fixed-table-loading").remove();
	}
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../login/menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:15px;">
	  	<div class="row pt-4">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">고객참여</label>
					</div>
				</div>
				<hr>
				<!-- 검색 -->
				<div class="row">
					<div class="col-md pr-2 mr-2">
						<div class="form-group row">
							<!-- 제목검색 -->
	    					<div class="col-md mb-2">
		    					<div class="input-group">
		      						<input type="text" class="form-control" id="b_title" name="b_title" type="search" placeholder="제목">
		   						</div>
	    					</div>
							<!-- 이름검색 -->
	    					<div class="col-md mb-2">
		    					<div class="input-group">
		      						<input type="text" class="form-control" id="b_writer" name="b_writer" type="search" placeholder="작성자">
		   						</div>
	    					</div>
	    					<!-- 병원검색 -->
	    					<div class="col-md mb-2">
		    					<div class="input-group">
		      						<input type="text" class="form-control" id="hp_name" name="hp_name" type="search" placeholder="병원이름">
		   						</div>
	    					</div>
	    					<div class="col-md-1 mb-2">
	    						<button class="btn btn-dark btn-block" onClick="con_search()">검색</button>
	    					</div>
	    					<div class="col-md-2">
	    					</div>
	    					<!-- 카테고리 검색 -->
	    					<div class="col-md mb-2">
	      						<select class="form-control" id="b_order">
	      							<option value="날짜별">날짜별</option>
	      							<option value="조회수별">조회수별</option>
								</select>
	    					</div>
	    				</div>
   					</div>
				</div>
				<!-- 테이블 -->
				<div class="row mb-0" >
					<div class="col-md">
						<div class="table-responsive-md">
							<table class="table" id="t_boardList" data-toggle="table">
								<thead class="thead-light">
									<tr>
										<th class="d-none" data-field="EVA_CODE">글번호</th>
										<th data-field="HP_NAME">후기병원</th>
										<th data-field="MKS_ID">작성자</th>
										<th data-field="EVA_TITLE">제목</th>
										<th data-field="EVA_DATE">작성날짜</th>
										<th data-field="HIT">조회수</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				<!-- 버튼 -->
				<div class="row mb-2">
					<div class="col-md" style="text-align:right">
					<%if(mem_name!=null) {//로그인이 된 상태에서만 글쓰기 가능!!%>
						<button class="btn btn-md btn-dark" onClick="board_write()">글쓰기</button>
					<%}else{%>
						<div class="container"></div>
					<%} %>
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
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../login/footer.jsp"/>
	<!-- 돔 구성이 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$('#t_boardList').bootstrapTable('refreshOptions', {
		          url: "/board/boardList.crm?num=1"
				  ,onClickRow : function(row,element,field){
					  var eva_code = row.EVA_CODE;
					  var mks_id = row.MKS_ID;
					  var sch_code = row.SCH_CODE;
					  //alert("sch_code: "+sch_code);
					  alert("eva_code: "+eva_code);
					  <%if(mks_id==null){%>
					  	  	alert("로그인이 필요한 서비스입니다.");
					  <%}else{%>
							$.ajax({
								url: '/board/boardHit.crm?eva_code='+eva_code
								,success: function(data){
									var res = data.trim();
									alert(res);
									if(res=='실패'){
										alert('조회수 올리기 실패');
									}else{
										alert('조회수 올리기 성공');
									}
								}
							});
						  	location.href= '/client/board/boardDetail.jsp?eva_code='+eva_code+'&mks_id='+mks_id+"&sch_code="+sch_code;
					  <%}%>
				  }
			});
			$("div.fixed-table-loading").remove();
			page_btn();
			$("#b_order").change(function() {
				alert(this.value);
				con_search();
			});
		});
	</script>
</body>
</html>