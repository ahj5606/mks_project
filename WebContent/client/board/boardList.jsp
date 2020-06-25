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
	function res_pageGet(num){
		$('#t_boardList').bootstrapTable('refreshOptions', {
			 url: "/client/board/jsonBoardList.jsp?num="+num
		});
		$("div.fixed-table-loading").remove(); 
	}
	function board_write(){
		 location.href= '/client/board/boardForm.jsp';
	}
	function search_b_title(){
		alert("제목검색");
		var i_title = $("#b_title").val();
		alert("i_title: "+i_title);
	}
	function search_b_writer(){
		alert("작성자 검색");
		var i_writer = $("#b_writer").val();
		alert("i_writer: "+i_writer);
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
		      						<div class="input-group-prepend">
		      							<button class="btn btn-dark btn-block" onClick="search_b_title()">검색</button>
		      						</div>
		   						</div>
	    					</div>
							<!-- 이름검색 -->
	    					<div class="col-md">
		    					<div class="input-group">
		      						<input type="text" class="form-control" id="b_writer" name="b_writer" type="search" placeholder="작성자">
		      						<div class="input-group-prepend">
		      							<button class="btn btn-dark btn-block" onClick="search_b_writer()">검색</button>
		      						</div>
		   						</div>
	    					</div>
	    					<div class="col-md-6"></div>
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
										<th data-field="BOARD_TITLE">제목</th>
										<th data-field="MKS_ID">작성자</th>
										<th data-field="BOARD_DATE">작성날짜</th>
										<th class="d-none" data-field="BOARD_NO">글번호</th>
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
							<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_1" onClick="page(this)" >1</a></li>
							<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_2"  onClick="page(this)" >2</a></li>
							<li class="page-item mr-1"><a class="page-link p-1 px-2 my-1" href="#" id="page_3"  onClick="page(this)" >3</a></li>
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
		          url: "/client/board/jsonBoardList.jsp?num="+1
				  ,onClickRow : function(row,element,field){
					  var board_no = row.BOARD_NO;
					  var id = row.MKS_ID;
					  alert("글쓴이 id: "+id);
					  location.href= '/client/board/boardDetail.jsp?mks_id='+id;
					  //==> board_no를 넘겨주면 해당 게시글을  select!!
				  }
			});
			$("div.fixed-table-loading").remove();
		});
	</script>
</body>
</html>