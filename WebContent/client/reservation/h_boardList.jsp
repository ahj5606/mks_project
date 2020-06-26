<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hp_name = request.getParameter("hp_name");
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
	body{
	  	font-family: 'Do Hyeon', sans-serif;
	}
	a.page-link{
		color:#4C4C4C;
	}
</style>
<script type="text/javascript">
	function res_pageGet(num){
		$('#t_hospitalList').bootstrapTable('refreshOptions', {
			 url: "/client/board/jsonBoardList.jsp?num="+num
		});
		$("div.fixed-table-loading").remove(); 
	}
	function pageMove(click){
		var imsi = $(click).children(".sr-only").text();
		if(imsi=="Previous"){
			previous();
		}else if(imsi=="Next"){
			$.ajax({
				url: "/client/board/jsonBoardList.jsp?num=0"
				,dataType: "text"
				,success: function(data){
					next(data, 5);
				}
			});
		}
	}
	function search_b_title(){
		alert("제목검색");
		var i_title = $("#b_title").val();
		alert("i_title: "+i_title);
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
	  	<div class="row pt-4">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">공지사항</label>
					</div>
				</div>
				<hr>
				<!-- 제목검색 -->
				<div class="row">
					<div class="col-md pr-2 mr-2">
						<div class="form-group row">
	    					<div class="col-md mb-2">
		    					<div class="input-group">
		      						<input type="text" class="form-control" id="b_title" name="b_title" type="search" placeholder="제목">
		      						<div class="input-group-prepend">
		      							<button class="btn btn-dark btn-block" onClick="search_b_title()">검색</button>
		      						</div>
		   						</div>
	    					</div>
	    					<div class="col-md-8"></div>
	  					</div>
					</div>
				</div>
				<!-- 테이블 -->
				<div class="row mb-0" >
					<div class="col-md">
						<div class="table-responsive-md">
							<table class="table" id="t_hospitalList" data-toggle="table">
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
				<!-- 빈 공간 -->
				<div class="row mb-2">
					<div class="col-md" style="text-align:right">
						<div class="container"></div>
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
	
	<!-- 상세 내용 모달 -->
	<div class="modal fade bd-example-modal-lg" id="modal_detail" tabindex="-1" role="dialog" aria-hidden="true">
  		<div class="modal-dialog modal-lg" role="document">
   			<div class="modal-content">
   				<!-- head -->
     	 		<div class="modal-header">
        			<h5 class="modal-title">공지사항 상세 보기</h5>
      			</div>
      			<!-- body -->
      			<div class="modal-body">
   					<div class="row m-2" style="justify-content:center;">
						<form id="f_board">
							<div class="form-group row mb-2 mt-3">
								<label for="board_title" style="width:50px;margin-left:12px;">제목</label>
		    					<div class="col-md">
		      						<input type="text" readonly class="form-control" id="board_title" value="공지합니다." style="width:400px;">
		    					</div>
		    				</div>
		    				<div class="form-group row mb-2">
								<label for="board_writer" style="width:50px;margin-left:12px;">작성자</label>
		    					<div class="col-md">
		      						<input type="text" readonly class="form-control" id="board_writer" value="일반내과" style="width:400px;">
		    					</div>
		    				</div>
		    				<div class="form-group row mb-4">
								<label for="board_date" style="width:50px;margin-left:12px;">작성날짜</label>
		    					<div class="col-md">
		      						<input type="text" readonly class="form-control" id="board_date" value="2020/06/23" style="width:400px;">
		    					</div>
		    				</div>
		    				<div class="form-group row">
								<textarea readonly class="form-control ml-1" rows="10" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
		    				</div>
						</form>
					</div>
     			</div>
     			
     			<!-- footer -->
     			<div class="modal-footer">
        			<button type="button" class="btn btn-primary" data-dismiss="modal" data-dismiss="modal">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	<!-- 돔 구성이 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$('#t_hospitalList').bootstrapTable('refreshOptions', {
		          url: "/client/board/jsonBoardList.jsp?num="+1
				  ,onClickRow : function(row,element,field){
					  var board_no = row.BOARD_NO;
					  var id = row.MKS_ID;
					  alert("글쓴이 id: "+id);
					  /* 
					  $.ajax({
						  board_no를 넘겨주면 해당 게시글을  select!!
					  }); 
					  */
					  $("#modal_detail").modal('show');
				  }
			});
			$("div.fixed-table-loading").remove();
			$.ajax({
				url: "/client/board/jsonBoardList.jsp?num=0"
				,dataType: "text"
				,success: function(data){
					var totalSize = Number(data.trim()); 
					var mok = parseInt(totalSize/5);
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
		});
	</script>
</body>
</html>