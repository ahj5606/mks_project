<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%
	//************ 글을 선택하고 들어왔을 때
	List<Map<String,Object>> bList = new ArrayList<>();//화면에 뿌릴 내용이 담김

	String id = request.getParameter("mks_id");//선택한 글의 아이디
	
	Object parmeter = session.getAttribute("mks_id");//회원의 아이디
	String mks_id = "star1";
	if(parmeter!=null){
		mks_id = (String)parmeter;
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
<title>게시판 상세 화면</title>
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
	label{
		margin:8px;
	}
	body{
	  	font-family: 'Do Hyeon', sans-serif;
	}
</style>
<script type="text/javascript">
	function res_pageGet(num){
		$('#t_hospitalList').bootstrapTable('refreshOptions', {
			 url: "/client/board/jsonBoardList.jsp?num="+num
		});
		$("div.fixed-table-loading").remove(); 
	}
	function modal_del(){
		alert("삭제할까?");
		$("#modal_del").modal('show');
	}
	function board_del(){
		alert("삭제!");
		var i_pw = $("#i_pw").val();
		alert("입력한 비번: "+i_pw);
	}
	function board_upd(){
		alert("수정모드로!");
		var board_title = $("#board_title").val();
		var board_writer = $("#board_writer").val();
		var board_date = $("#board_date").val();
		var content = $("#content").val();
		location.href = "/client/board/boardForm.jsp?board_title="+board_title
									+"&board_writer="+board_writer+"&board_date="+board_date+"&content="+content;
	}
	function board_list(){
		alert("목록으로!");
		location.href="/client/board/boardList.jsp"
	}
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../login/menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:15px;">
	  	<div class="row pt-3">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;margin-left:0;">고객참여</label>
					</div>
				</div>
				<hr>
				<!-- 테이블 -->
				<div class="row m-2" style="justify-content:center;">
					<form id="f_board">
						<div class="form-group row mb-2 mt-3">
							<label for="board_title" style="width:50px;margin-left:12px;">제목</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="board_title" style="width:400px;" value="글씁니다">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-2">
							<label for="board_writer" style="width:50px;margin-left:12px;">작성자</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="board_writer" style="width:400px;" value="이진아">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-4">
							<label for="board_date" style="width:50px;margin-left:12px;">작성날짜</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="board_date" style="width:400px;" value="2020/06/22">
	    					</div>
	    				</div>
	    				<div class="form-group row">
							<textarea readonly class="form-control ml-1" rows="10" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
	    				</div>
					</form>
				</div>
				<!-- 바디:내용 -->
				<div class="row mb-0" >
				</div>
				<!-- 버튼 -->
				<div class="row mb-2">
					<div class="col-md" style="text-align:right">
						<%if(mks_id.equals(id)){ //자신의 글일때만 삭제, 수정 가능!!!%>
							<button class="btn btn-md btn-dark" onClick="modal_del()">삭제</button>
							<button class="btn btn-md btn-dark" onClick="board_upd()">수정</button>
						<%}%>
							<button class="btn btn-md btn-dark" onClick="board_list()">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../login/footer.jsp"/>
	
	<!-- 삭제 모달 -->
	<div class="modal fade bd-example-modal-sm" id="modal_del" tabindex="-1" role="dialog" aria-hidden="true">
  		<div class="modal-dialog modal-sm" role="document">
   			<div class="modal-content">
   				<!-- head -->
     	 		<div class="modal-header">
        			<h5 class="modal-title">삭제 확인창</h5>
      			</div>
      			<!-- body -->
      			<div class="modal-body">
   					<div class="row" style="justify-content: center">
        				<h6 class="modal-title">가입된 비밀번호를 입력해주세요.</h6>
        				<div class="form-group row">
    						<div class="col-md">
     					 		<input type="password" class="form-control" id="i_pw">
    						</div>
  						</div>
     				</div>
     			</div>
     			<!-- footer -->
     			<div class="modal-footer">
        			<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="board_del();">삭제</button>
        			<button type="button" class="btn btn-primary" data-dismiss="modal" data-dismiss="modal">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>
</body>
</html>