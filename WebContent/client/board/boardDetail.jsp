<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%

	String id = request.getParameter("mks_id");//선택한 글의 아이디
	String eva_code = request.getParameter("eva_code");//선택한 글의 번호
	String sch_code = request.getParameter("sch_code");//선택한 글의 스케줄코드
	
	String u_eva_code = request.getParameter("u_eva_code");//댓글 수정모드
	
	Object parmeter = session.getAttribute("mks_id");//회원의 아이디
	String mks_id = null;
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
	a.click_yes, span.split_yes{
		color:#353535;
	}
	a.click_no, a.click_no:hover, span.split_no{
		color:#D5D5D5;
	}
</style>
<script type="text/javascript">
	var eva_code = '<%=eva_code%>';
	var u_eva_code = '<%=u_eva_code%>';
	var d_eva_code;
	var mks_id = '<%=mks_id%>';
	var id = '<%=id%>';
	var sch_code = '<%=sch_code%>';
	function modal_del(){
		$("#modal_del").modal('show');
	}
	function board_del(){
		var i_pw = $("#i_pw").val();
		alert("입력한 비번: "+i_pw);
		var param = "mks_id="+mks_id+"&mks_pw="+i_pw+"&eva_code="+eva_code;
		$.ajax({
			url: '/board/boardDel.crm'
			,data: param
			,success:function(data){
				var res = data.trim();
				if(res=='불일치'){
					alert('비밀번호가 일치하지 않습니다.');
				}else if(res=='실패'){
					alert('삭제실패');
				}else{
					alert('삭제성공');
					location.href="/client/board/boardList.jsp"
				}
			}
		});
	}
	function board_upd(){
		alert("수정모드로!");
		location.href = "/client/board/boardForm.jsp?eva_code="+eva_code;
	}
	function board_list(){
		alert("목록으로!");
		location.href="/client/board/boardList.jsp"
	}
	function reply_ins(){
		var eva_content = $("#reply_content").val();
		if(eva_content==0){
			alert("내용이 비어있습니다.");
		}else{
			var param = 'eva_content='+eva_content+'&mks_id='+mks_id+'&sch_code='+sch_code+'&group_no='+eva_code+"&eva_code="+eva_code;
			$.ajax({
				url: '/board/boardIns.crm'
				,data: param
				,success:function(data){
					var res = data.trim();
					if(res=='실패'){
						alert('입력실패');
					}else{
						alert('입력성공');
						location.href= '/client/board/boardDetail.jsp?eva_code='+eva_code+'&mks_id='+id+"&sch_code="+sch_code;
					}
				}
			});
		}
	}
	function reply_upd_mode(el){
		alert("수정모드로!");
		var u_eva_code = $(el).children("input").val();
		location.href = location.href= '/client/board/boardDetail.jsp?eva_code='+eva_code
											+'&mks_id='+id+"&sch_code="+sch_code+"&u_eva_code="+u_eva_code;
	}
	function reply_upd(){
		alert("수정!");
		var eva_content = $("#reply_content").val();
		if(eva_content==0){
			alert("내용이 비어있습니다.");
		}else{
			var param = 'eva_content='+eva_content+'&eva_code='+u_eva_code+"&eva_title=''"
			alert("param: "+param);
			$.ajax({
				url: '/board/boardUpd.crm'
				,data: param
				,success:function(data){
					var res = data.trim();
					if(res=='실패'){
						alert('댓글수정실패');
					}else{
						alert('댓글수정성공');
						location.href= '/client/board/boardDetail.jsp?eva_code='+eva_code+'&mks_id='+id+"&sch_code="+sch_code;
					}
				}
			});
		}
	}
	function reply_del(){
		var i_pw = $("#i_rpw").val();
		alert("입력한 비번: "+i_pw);
		var param = "mks_id="+mks_id+"&mks_pw="+i_pw+"&eva_code="+d_eva_code;
		$.ajax({
			url: '/board/boardDel.crm'
			,data: param
			,success:function(data){
				var res = data.trim();
				if(res=='불일치'){
					alert('비밀번호가 일치하지 않습니다.');
				}else if(res=='실패'){
					alert('댓글삭제실패');
				}else{
					alert('댓글삭제성공');
					location.href= '/client/board/boardDetail.jsp?eva_code='+eva_code+'&mks_id='+id+"&sch_code="+sch_code;
				}
			}
		});
	}
	function modal_rdel(el){
		d_eva_code = $(el).children("input").val();
		$("#modal_rdel").modal('show');
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
							<label for="board_title" style="width:50px;margin-left:12px;">후기병원</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="hp_name" style="width:400px;">
	    					</div>
	    				</div>
						<div class="form-group row mb-2">
							<label for="board_title" style="width:50px;margin-left:12px;">제목</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="eva_title" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-2">
							<label for="board_writer" style="width:50px;margin-left:12px;">작성자</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="eva_writer" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-4">
							<label for="board_date" style="width:50px;margin-left:12px;">작성날짜</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="eva_date" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row">
							<textarea readonly class="form-control ml-1" rows="10" id="eva_content" placeholder="내용을 입력해 주세요" ></textarea>
	    				</div>
					</form>
				</div>
				<!-- 버튼 -->
				<div class="row mb-2">
					<div class="col-md" style="text-align:right">
						<%if(id.equals(mks_id)){ //자신의 글일때만 삭제, 수정 가능!!!%>
							<button class="btn btn-md btn-dark" onClick="modal_del()">삭제</button>
							<button class="btn btn-md btn-dark" onClick="board_upd()">수정</button>
						<%}%>
							<button class="btn btn-md btn-dark" onClick="board_list()">목록</button>
					</div>
				</div>
				<!-- 댓글달기 폼-->
				<div class="border mb-0 mt-4 pt-2 pb-0 px-3" style="background-color: #EAEAEA;">
					<div class="container py-1 px-2">
						<div class="row">
							<textarea class="form-control ml-1" rows="2" id="reply_content" placeholder="댓글을 입력해 주세요" ></textarea>
	    				</div>
	    				<div class="row mb-2">
							<div class="col-md pt-2 pb-0 pr-0" style="text-align:right">
							<%if(u_eva_code!=null){ %>
								<button class="btn btn-md btn-dark" onClick="reply_upd()">댓글수정</button>
							<%}else{ %>
								<button class="btn btn-md btn-dark" onClick="reply_ins()">댓글등록</button>
							<%}%>
							</div>
						</div>
					</div>
				</div>
				<!-- 댓글 목록-->
				<div class="border my-3 pb-4 px-3 pt-2">
					<div class="row mb-0">
						<div class="col-md">
							<label style="font-size:large;font-color:#4C4C4C;margin-left:5px;">
									댓글&nbsp;&nbsp;<span id="reply_size">reply_size</span></label>
						</div>
					</div>
					<hr style="margin-top:0px;margin-bottom:15px;">
					<div class="container pt-3 pb-2 px-2" id="reply_list" style="background-color: #EAEAEA;">
					</div>
				</div><!-- 댓글 목록 끝-->
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
        			<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="board_del()">삭제</button>
        			<button type="button" class="btn btn-primary" data-dismiss="modal" data-dismiss="modal">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>
	<!-- 댓글 삭제 모달 -->
	<div class="modal fade bd-example-modal-sm" id="modal_rdel" tabindex="-1" role="dialog" aria-hidden="true">
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
     					 		<input type="password" class="form-control" id="i_rpw">
    						</div>
  						</div>
     				</div>
     			</div>
     			<!-- footer -->
     			<div class="modal-footer">
        			<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="reply_del()">삭제</button>
        			<button type="button" class="btn btn-primary" data-dismiss="modal" data-dismiss="modal">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>
	<!-- 돔구성 완료 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url: '/board/boardList.crm?num=1&eva_code='+eva_code
				,success: function(data){
					var res = JSON.parse(data);
					alert("본문사이즈: "+res.length);
					$("#hp_name").val(res[0].HP_NAME);
					$("#eva_title").val(res[0].EVA_TITLE);
					$("#eva_writer").val(res[0].MKS_ID);
					$("#eva_date").val(res[0].EVA_DATE);
					$("#eva_content").val(res[0].EVA_CONTENT);
				}
			});
			$.ajax({
				url:'/board/boardReplyList.crm?eva_code='+eva_code
				,success: function(data){
					var res = JSON.parse(data);
					alert("댓글사이즈: "+res.length);
					$("#reply_size").html(res.length);
					var imsi = "";
					if(res.length>0){
						for(var i=0; i<res.length; i++){
							imsi += '<div class="card mb-2">';
							imsi += '<div class="card-header pr-0 pl-3 py-2">';
							imsi += '<div class="row pl-1">';
							imsi += '<div class="col-md-2">'+res[i].MKS_ID+'</div>';
							imsi += '<div class="col-md">'+res[i].EVA_DATE+'</div>';
							imsi += '<div class="col-md"></div>';
							imsi += '<div class="col-md-2">';
							imsi += '<div class="row" style="justify-content: center">';
							if(res[i].MKS_ID==mks_id){
								imsi += '<a class="click_yes" href="#" onClick="reply_upd_mode(this)">';
								imsi += '<input type="hidden" value="'+res[i].EVA_CODE+'">수정</a>';
								imsi += '<span class="split_yes">&nbsp;&nbsp;|&nbsp;&nbsp;</span>';
								imsi += '<a class="click_yes" href="#" onClick="modal_rdel(this)">';
								imsi += '<input type="hidden" value="'+res[i].EVA_CODE+'">삭제</a>';
							}else{
								imsi += '<a class="click_no">수정</a>';
								imsi += '<span class="split_no">&nbsp;&nbsp;|&nbsp;&nbsp;</span>';
								imsi += '<a class="click_no">삭제</a>';
							}
							imsi += '</div></div></div></div>';
							imsi += '<div class="card-body p-3">';
							imsi += res[i].EVA_CONTENT;
							imsi += '</div></div>';
						}
						$("#reply_list").html(imsi);
					}else{
						$("#reply_list").removeAttr('style');
					}
				}
			});
			<%if(u_eva_code!=null){ %>
			$.ajax({
				url:'/board/boardReplyList.crm?eva_code='+u_eva_code
				,success: function(data){
					var res = JSON.parse(data);
					alert("댓글수정: "+res.length);
					$("#reply_content").val(res[0].EVA_CONTENT);
				}
			});
			<%}%>
		});
	</script>
</body>
</html>