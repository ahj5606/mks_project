<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%
	//************ 1) 상세읽기에서 수정버튼을 누르고 들어왔을 때....
	String b_title = request.getParameter("board_title");
	String b_writer = request.getParameter("board_writer");
	String b_date = request.getParameter("board_date");
	String b_content = request.getParameter("content");
	
	//************ 2) 글쓰기 버튼 누르고 왔을 때
	Object parmeter = session.getAttribute("mks_id");
	String mks_id = null;
	if(parmeter!=null){
		mks_id = (String)parmeter;
	} 
	
	Calendar cal = Calendar.getInstance();
	int day = cal.get(Calendar.DAY_OF_MONTH);
	int month = cal.get(Calendar.MONTH)+1;
	int year = cal.get(Calendar.YEAR);
	String today = year+"/"+month+"/"+day;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>게시판 작성 화면</title>
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
	function modal_ins(){
		$('#modal_ins').modal('show');
	}
	function board_ins(){
		alert("저장");
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
				<!-- 헤드 -->
				<div class="row m-2" style="justify-content:center;">
					<form id="f_board">
						<div class="form-group row mb-2 mt-3">
							<label for="board_title" style="width:50px;margin-left:12px;">제목</label>
	    					<div class="col-md">
	      						<input type="text" class="form-control" id="board_title" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-2">
							<label for="board_writer" style="width:50px;margin-left:12px;">작성자</label>
	    					<div class="col-md">
	      						<input type="text" class="form-control" id="board_writer" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-4">
							<label for="board_date" style="width:50px;margin-left:12px;">작성날짜</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="board_date" value="<%=today%>" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row">
							<textarea class="form-control ml-1" rows="10" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
	    				</div>
					</form>
				</div>
				<!-- 바디:내용 -->
				<div class="row mb-0" >
				</div>
				<!-- 버튼 -->
				<div class="row mb-2">
					<div class="col-md" style="text-align:right">
						<button class="btn btn-md btn-dark" onClick="modal_ins()">저장</button>
						<button class="btn btn-md btn-dark" onClick="board_list()">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../login/footer.jsp"/>
	
	<!-- 수정 모달 -->
	<div class="modal fade bd-example-modal-sm" id="modal_ins" tabindex="-1" role="dialog" aria-hidden="true">
  		<div class="modal-dialog modal-sm" role="document">
   			<div class="modal-content">
   				<!-- head -->
     	 		<div class="modal-header">
        			<h5 class="modal-title">저장 확인창</h5>
      			</div>
      			<!-- body -->
      			<div class="modal-body">
   					<div class="row" style="justify-content: center">
        				<h5 class="modal-title">다음 글을 저장하시겠습니까?</h5>
     				</div>
     			</div>
     			<!-- footer -->
     			<div class="modal-footer">
        			<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="board_ins();">저장</button>
        			<button type="button" class="btn btn-primary" data-dismiss="modal" data-dismiss="modal">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	<!-- 돔구성 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function(){
			if('<%=b_title%>'!=null){
				alert("");
				$("#board_title").val('<%=b_title%>');
				$("#board_writer").val('<%=b_writer%>');
				$("#board_date").val('<%=b_date%>');
				$("#content").val('<%=b_content%>');
			}
		});
	</script>
</body>
</html>