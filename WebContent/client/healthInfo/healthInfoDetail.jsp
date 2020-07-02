<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap"%>
<%
	String board_no = request.getParameter("board_no");

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
<title>건강정보 상세 화면</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
	var mks_id = '<%=mks_id%>';
	var board_no = '<%=board_no%>'
	function modal_del(){
		alert("삭제할까?");
		$("#modal_del").modal('show');
	}
	function board_del(){
		alert("삭제!");
		var i_pw = $("#i_pw").val();
		alert("입력한 비번: "+i_pw);
		var param = "mks_id="+mks_id+"&mks_pw="+i_pw+"&board_no="+board_no;
		$.ajax({
			url: '/health/healthDel.crm'
			,data: param
			,success:function(data){
				var res = data.trim();
				if(res=='불일치'){
					alert('비밀번호가 일치하지 않습니다.');
				}else if(res=='실패'){
					alert('삭제실패');
				}else{
					alert('삭제성공');
					location.href="/client/healthInfo/healthInfoList.jsp"
				}
			}
		});
	}
	function board_upd(){
		alert("수정모드로!");//@@@@@@@@@@
		location.href = "/client/healthInfo/healthInfoForm.jsp?board_no="+board_no;
	}
	function board_list(){
		alert("목록으로!");
		location.href="/client/healthInfo/healthInfoList.jsp"
	}
	function good(){
		alert("공감");
		var good = Number($("#good").html())+1;
		$.ajax({
			url: "/health/healthLike.crm?board_no="+board_no+"&good=1"
			,success: function(data){
				var res = data.trim();
				if(res=='실패'){
					alert('공감실패');
				}else{
					alert('공감성공');
					$("#good").html(good);
				}
			}
		});
	}
	function bad(){
		alert("비공감");
		var bad = Number($("#bad").html())+1;
		$.ajax({
			url: "/health/healthLike.crm?board_no="+board_no+"&bad=1"
			,success: function(data){
				var res = data.trim();
				if(res=='실패'){
					alert('비공감실패');
				}else{
					alert('비공감성공');
					$("#bad").html(bad);
				}
			}
		});
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
						<label style="font-size:x-large;font-color:#4C4C4C;margin-left:0;">건강정보</label>
					</div>
				</div>
				<hr>
				<!-- 테이블 -->
				<div class="row m-2" style="justify-content:center;">
					<form id="f_board">
						<div class="form-group row mb-2 mt-3">
							<label for="board_title" style="width:50px;margin-left:12px;">제목</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="board_title" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-2">
							<label for="board_writer" style="width:50px;margin-left:12px;">작성자</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="board_writer" value='<%=mks_id%>' style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row mb-4">
							<label for="board_date" style="width:50px;margin-left:12px;">작성날짜</label>
	    					<div class="col-md">
	      						<input type="text" readonly class="form-control" id="board_date" style="width:400px;">
	    					</div>
	    				</div>
	    				<div class="form-group row">
							<textarea readonly class="form-control ml-1" rows="10" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
	    				</div>
	    				<!-- 공감, 비공감 -->
	    				<div class="row mb-0">
							<div style="width:80px; text-align:center;">
								<div style="text-align:center;"><img src="./good.png" onClick="good()"></div>
								<div style="text-align:center;">유익해</div>
								<div id="good" style="text-align:center;"></div>
							</div>
							<div style="width:80px; text-align:center;">
								<div style="text-align:center;"><img src="./bad.png" onClick="bad()"></div>
								<div style="text-aling:center;">비공감</div>
								<div id="bad" style="text-align:center;"></div>
							</div>
							<a href="javascript:;" id="kakao-link-btn"> 
								<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
							</a>
							<script type="text/javascript">
								Kakao.init("265447647e1cb17951a10eb622ba9fbc");
								Kakao.Link.createDefaultButton({
									  container: '#kakao-link-btn',
									  objectType: 'feed',
									  content: {
									    title: '디저트 사진',
									    description: '아메리카노, 빵, 케익',
									    imageUrl:
									      'http://mud-kage.kakao.co.kr/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
									    link: {
									      mobileWebUrl: 'http://192.168.0.237:5000/client/healthInfo/healthInfoDetail.jsp?board_no=31',
									      androidExecParams: 'test'
									    }
									  },
									  social: {
									    likeCount: 10,
									    commentCount: 20,
									    sharedCount: 30,
									  },
									  buttons: [
									    {
									      title: '웹으로 이동',
									      link: {
										      webUrl: 'http://192.168.0.237:5000/client/healthInfo/healthInfoDetail.jsp?board_no=31'
									      },
									    }
									    ,
									    {
									      title: '앱으로 이동',
									      link: {
										      mobileWebUrl: 'http://192.168.0.237:5000/client/healthInfo/healthInfoDetail.jsp?board_no=31'
									      },
									    }, 
									  ],
									  success: function(response) {
									    console.log(response);
									  },
									  fail: function(error) {
									    console.log(error);
									  }
									});
							</script>
						</div>
					</form>
				</div>
				<!-- 버튼 -->
				<div class="row mb-2">
					<div class="col-md" style="text-align:right">
					<%if("jinaseebabo".equals(mks_id)){ //자신의 글일때만 삭제, 수정 가능!!!%>
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
        				<h6 class="modal-title">관리자 비밀번호를 입력해주세요.</h6>
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
	<!-- 돔구성 완료 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url: "/health/healthList.crm?num=1&board_no="+board_no
				,success: function(data){
					var res = JSON.parse(data);
					alert("본문사이즈: "+res.length);
					$("#board_title").val(res[0].BOARD_TITLE);
					$("#board_writer").val(res[0].MKS_ID);
					$("#board_date").val(res[0].BOARD_DATE);
					$("#content").val(res[0].BOARD_CONTENT);
					$("#good").html(res[0].GOOD);
					$("#bad").html(res[0].BAD);
				}
			});
		});
	</script>
</body>
</html>