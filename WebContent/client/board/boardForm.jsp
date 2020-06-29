<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%
	Object parmeter = session.getAttribute("mks_id");
	String mks_id = null;
	if(parmeter!=null){
		mks_id = (String)parmeter;
	} 
	
	Calendar cal = Calendar.getInstance();
	String day = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
	if(day.length()==1){
		day = "0"+day;
	}
	String month = Integer.toString(cal.get(Calendar.MONTH)+1);
	if(month.length()==1){
		month = "0"+month;
	}
	String year = Integer.toString(cal.get(Calendar.YEAR));
	String today = year+"-"+month+"-"+day;
	
	String eva_code = request.getParameter("eva_code");
	
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
	var mks_id = '<%=mks_id%>'
	function modal_ins(){
		var sch_code;
		var eva_title = $("#eva_title").val().length;
		var eva_content = $("#eva_content").val().length;
		<%if(eva_code==null){//글쓰기 버튼을 누르고 들어왔니?%>
			sch_code = $("#res_list").val();
		<%}else{%>
			sch_code ="unnecessary";
		<%}%>
		if(sch_code==0){
			alert("예약 정보를 선택해주세요.");
		}else if(eva_title==0||eva_content==0){
			alert("제목 혹은 내용이 비어있습니다.");
		}else{
			$('#modal_ins').modal('show');
		}
	}
	function board_ins(){
		alert("입력 저장");
		var sch_code = $("#res_list").val();
		var eva_content = $("#eva_content").val();
		var eva_title = $("#eva_title").val();
		var eva_date = $("#eva_date").val();
		var param = 'eva_content='+eva_content+'&mks_id='+mks_id+'&sch_code='+sch_code+'&eva_title='+eva_title+'&eva_date='+eva_date;
		alert("param: "+param);
		$.ajax({
			url: '/board/boardIns.crm'
			,data: param
			,success:function(data){
				var res = data.trim();
				alert(res);
				if(res=='실패'){
					alert('입력실패');
				}else{
					alert('입력성공');
					location.href="/client/board/boardList.jsp"
				}
			}
		});
	}
	function board_upd(){
		alert("수정 저장");
		var eva_code = '<%=eva_code%>'
		var eva_content = $("#eva_content").val();
		var eva_title = $("#eva_title").val();
		var param = 'eva_content='+eva_content+'&eva_title='+eva_title+'&eva_code='+eva_code
		alert("param: "+param);
		$.ajax({
			url: '/board/boardUpd.crm'
			,data: param
			,success:function(data){
				var res = data.trim();
				alert(res);
				if(res=='실패'){
					alert('수정실패');
				}else{
					alert('수정성공');
					location.href="/client/board/boardList.jsp"
				}
			}
		});
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
				<!-- 내용 -->
				<div class="row m-2" style="justify-content:center;">
					<form id="f_board">
					<%if(eva_code==null){//글쓰기 버튼을 누르고 들어왔니?%>
						<div class="form-group row mb-2 mt-3">
							<label for="board_title" style="width:50px;margin-left:12px;">예약정보</label>
	    					<div class="col-md">
	      						<select class="form-control" id="res_list">
								</select>
	    					</div>
	    				</div>
	    			<%}else{//수정버튼을 누르고 들어왔지?%>
	    				<div class="form-group row mb-2 mt-3">
							<label for="board_title" style="width:50px;margin-left:12px;">후기병원</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="hp_name" style="width:400px;">
	    					</div>
	    				</div>
	    			<%}%>
						<div class="form-group row mb-2">
							<label for="board_title" style="width:50px;margin-left:12px;">제목</label>
	    					<div class="col-md">
	      						<input type="text" class="form-control" id="eva_title" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-2">
							<label for="board_writer" style="width:50px;margin-left:12px;">작성자</label>
	    					<div class="col-md">
	      						<input type="text" class="form-control" id="eva_writer" value='<%=mks_id%>' style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-4">
							<label for="board_date" style="width:50px;margin-left:12px;">작성날짜</label>
	    					<div class="col-md">
	      						<input type="text" class="form-control" id="eva_date" value="<%=today%>" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row">
							<textarea class="form-control ml-1" rows="10" id="eva_content" placeholder="내용을 입력해 주세요"></textarea>
	    				</div>
					</form>
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
     				<%if(eva_code==null){//글쓰기 버튼을 누르고 들어왔니?%>
        				<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="board_ins()">저장</button>
        			<%}else{//수정 버튼을 누르고 들어왔니?%>
        				<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="board_upd()">저장</button>
        			<%}%>
        			<button type="button" class="btn btn-primary" data-dismiss="modal" data-dismiss="modal">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>
	<!-- 돔구성 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function(){
			<%if(eva_code==null){%>//글쓰기 버튼을 누르고 들어왔니?
				$.ajax({
					url: '/board/boardResList.crm?mks_id='+mks_id
					,success:function(data){
						var res = JSON.parse(data);
						alert(res);
						alert("사이즈: "+res.length);
						var imsi = '<option value="">선택</option>';
						for(var i=0; i<res.length; i++){
							var res_list = "["+res[i].SCH_DATE+"] "+res[i].HP_NAME+", "+res[i].DEPT_NAME+", "+res[i].DOC_NAME
							imsi += '<option value='+"'"+res[i].SCH_CODE+"''"+'>'+res_list+'</option>';
						}
						$("#res_list").html(imsi);
					}
				});
				$("#res_list").change(function() {
					alert(this.value);
					var res_choice = $('#res_list').val();
				});
			<%}else{%>//수정버튼을 누르고 들어왔니?
				var eva_code = '<%=eva_code%>'
				$.ajax({
					url: '/board/boardList.crm?num=1&eva_code='+eva_code
					,success: function(data){
						var res = JSON.parse(data);
						alert(res);
						alert("사이즈: "+res.length);
						$("#hp_name").val(res[0].HP_NAME);
						$("#eva_title").val(res[0].EVA_TITLE);
						$("#eva_writer").val(res[0].MKS_ID);
						$("#eva_date").val(res[0].EVA_DATE);
						$("#eva_content").val(res[0].EVA_CONTENT);
						$("#eva_writer").attr('readonly',true);
						$("#eva_date").attr('readonly', true);
					}
				});
				
			<%}%>
		});
	</script>
</body>
</html>