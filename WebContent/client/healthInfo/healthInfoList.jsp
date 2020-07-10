<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object parameter = session.getAttribute("mks_id");
	String mks_id = null;
	if(parameter!=null){
		mks_id = (String)parameter;
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
<title>건강정보 화면</title>
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
		var h_order ="날짜별";
		var i_title = "";
		function res_pageGet(num){
			if(h_order=="날짜별"){
				$('#t_healthInfoList').bootstrapTable('refreshOptions', {
					 url: "/health/healthList.crm?num="+num+"&i_title="+i_title
				});
			}else{
				$('#t_healthInfoList').bootstrapTable('refreshOptions', {
					url: "/health/healthList.crm?num="+num+"&h_order="+h_order+"&i_title="+i_title
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
					url: "/health/healthList.crm?num=0"
					,dataType: "text"
					,success: function(data){
						next(data, 5);
					}
				});
			}
		}
		function page_btn(){
			$.ajax({
				url: "/health/healthList.crm?num=0&i_title="+i_title
				,dataType: "text"
				,success: function(data){
					var totalSize = Number(data.trim()); 
					var mok = Math.ceil(totalSize/5);
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
			$("#page_1").focus();
		}
		function info_write(){
			 location.href= '/client/healthInfo/healthInfoForm.jsp';
		}
		function search_h_title(){
			i_title = $("#h_title").val();
			if(h_order=="날짜별"){
				$('#t_healthInfoList').bootstrapTable('refreshOptions', {
					 url: "/health/healthList.crm?num=1&i_title="+i_title
				});
			}else{
				$('#t_healthInfoList').bootstrapTable('refreshOptions', {
					 url: "/health/healthList.crm?num=1&h_order="+h_order+"&i_title="+i_title
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
	  		<div class="col-md" style="min-height: 590px">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">건강정보</label>
					</div>
				</div>
				<hr>
				<!-- 제목검색 -->
				<div class="row">
					<div class="col-md pr-2 mr-2">
						<div class="form-group row">
	    					<div class="col-md mb-2">
		    					<div class="input-group">
		      						<input type="text" class="form-control" id="h_title" name="h_title" type="search" placeholder="제목">
		      						<div class="input-group-prepend">
		      							<button class="btn btn-dark btn-block" onClick="search_h_title()">검색</button>
		      						</div>
		   						</div>
	    					</div>
	    					<div class="col-md-5">
	    					</div>
	    					<!-- 카테고리 검색 -->
	    					<div class="col-md mb-2">
	      						<select class="form-control" id="h_order">
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
							<table class="table" id="t_healthInfoList" data-toggle="table">
								<thead class="thead-light">
									<tr>
										<th class="d-none" data-field="BOARD_NO">글번호</th>
										<th data-field="BOARD_TITLE">제목</th>
										<th data-field="MKS_ID">작성자</th>
										<th data-field="BOARD_DATE">작성날짜</th>
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
					<%
						if(mks_id!=null&&"kosmo".equals(mks_id)) {//로그인이 된 상태에서만 글쓰기 가능!!
					%>
						<button class="btn btn-md btn-dark" onClick="info_write()">글쓰기</button>
					<%
						}else {
					%>
						<div class="container"></div>
					<%
						}
					%>
					</div>
				</div>
				<!-- 페이지네이션 -->
				<div class="row mb-4">
					<div class="col-md">
						<ul class="pagination pagination-small justify-content-center mb-0">
							<li class="page-item">
								<a class="page-link py-1 px-2 my-1 mr-1" href="#" id="pre" onClick="pageMove(this)" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
								</a>
							</li>
							<li class="page-item mr-1" id="p_1"><a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a></li>
							<li class="page-item mr-1" id="p_2"><a class="page-link p-1 px-2 my-1" href="#" id="page_2"  onClick="page(this)" >2</a></li>
							<li class="page-item mr-1" id="p_3"><a class="page-link p-1 px-2 my-1" href="#" id="page_3"  onClick="page(this)" >3</a></li>
							<li class="page-item mr-1">
								<a class="page-link p-1 px-2 my-1" href="#" id="next" onClick="pageMove(this)" aria-label="Next">
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
			$('#t_healthInfoList').bootstrapTable('refreshOptions', {
		          url: "/health/healthList.crm?num=1&&i_title="+i_title
				  ,onClickRow : function(row,element,field){
					   var board_no = row.BOARD_NO;
					   $.ajax({
							url: '/health/healthHit.crm?board_no='+board_no
							,success: function(data){
								var res = data.trim();
								if(res=='실패'){
									alert('조회수 올리기 실패');
								}else{
									location.href= '/client/healthInfo/healthInfoDetail.jsp?board_no='+board_no;
								}
							}
					  });
				  }
			});
			$("div.fixed-table-loading").remove();
			page_btn();
			$("#h_order").change(function() {
				h_order = this.value;
				search_h_title();
			});
		});
	</script>
</body>
</html>