<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object parmeter = session.getAttribute("mks_id");
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
<title>내 정보</title>
	<%@ include file="/common/bootStrap4UI.jsp"%>
	<style type="text/css">
		.container{
			padding:5px;
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
	</style>
	<script type="text/javascript">
		var mks_id = '<%=mks_id%>';
		function pw_input() {
			var i_pw = $("#i_pw").val();
			$.ajax({
				url: "/mypage/mypagePassword.crm"
				,data: "mks_pw="+i_pw+"&mks_id="+mks_id
				,success: function(data){
					var res = data.trim();
					alert(res);
					if(res=='실패') {
						 alert('불일치');
						 $("#emailFail").html("비밀번호가 일치하지 않습니다.");
				         $("#emailFail").attr('class','text-danger');
					}
					else {
						location.href="/client/mypage/myInfo.jsp"
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
	  	<div class="row pt-4">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">내 정보</label>
					</div>
				</div>
				<hr>
				<!-- 메뉴 버튼 -->
				<div class="row mb-0 mt-3 ml-2">
					<button class="btn btn-md"
							style="font-size:large;color:#353535;background-color:#EAEAEA;" 
									onClick="location.href='./myReservationList.jsp'">예약목록</button>
					<button class="btn btn-md" 
							style="font-size:large;color:#F6F6F6;background-color:#007bff;" 
									onClick="location.href='./pwInput.jsp'">개인정보</button>
				</div>
				<!-- 내용 -->
				<div class="border mb-0 mt-0" style="height:400px;">
					<div class="row mx-2" >
						<div class="col">
							<div class="row" style="justify-content: center;padding-top:80px;">
								<div class="border py-4 px-5">
									<div class="form-group w-45">
	    								<label for="i_pw">비밀번호</label>
	    								<input type="password" class="form-control mb-1" id="i_pw">
	    								<small id="pwFail" class="text-muted ml-1">가입된 비밀번호를 입력해주세요.</small>
	    								<div class="row mt-2">
	    									<div class="col-md-5">
	    									</div>
	    									<div class="col-md">
		    									<button class="btn btn-dark btn-block" onClick="pw_input()" style="width:80px;">입력</button>
	    									</div>
	    								</div>
	  								</div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 내용 끝 -->
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../login/footer.jsp"/>
	<!-- 돔 구성이 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#t_myReList').bootstrapTable('refreshOptions', {
		          url: "/client/mypage/jsonMyReservationList.jsp?num="+1
				  ,onClickRow : function(row,element,field){
					  
				  }
			});
			$("div.fixed-table-loading").remove();
		});
	</script>
</body>
</html>