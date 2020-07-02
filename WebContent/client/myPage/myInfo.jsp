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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c4b678674e7c8512ebf2cadc156977&libraries=services"></script>
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
	/*****************************************************************************
	 * 회원가입을 위한 조건들.........
	 * 1) id, reg, email에 저장된 값 = input에 현재 입력되어있는 값
	 * 2) id_check + reg_check + email_check + pw_check = 4 
	 * 두 조건을 만족해야 ==> insert 가능
	 */
	var email = null;//이메일 저장
	var email_num = null;//인증번호 저장
	var time_check = null;//인증번호 발송버튼 눌렀을 때의 시간 저장
	
	var pw_check=0;//비밀번호 일치시 1로
	var email_check=0;//이메일 인증성공시 1로
	
	var mks_id = '<%=mks_id%>';
	function addrSearch() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	var zip = data.zonecode;
	            var addr = data.sigungu; // 최종 주소 변수
	            var addr1 = data.sido; // 최종 주소 변수
	            var addr2 = data.bname; // 최종 주소 변수
	            /* $("#i_addr").val(addr+" "+addr1+" "+addr2);
	            $("#i_zipcode").val(zip); */
	            document.getElementById("i_addr").value = addr+" "+addr1+" "+addr2;
	            document.getElementById("i_zipcode").value = zip;
	        }
	    }).open();
	}
	function modal_ins(){
		alert("수정버튼 누름!");
		$('#modal_ins').modal('show');
	}
	function myinfo_ins(){
		if((pw_check+email_check)==2){
		   	if(email==$("#i_email").val()){
		      	alert("회원정보 수정하러 gogo~!!!");
		      	var mks_pw = $("#i_pw").val();
				var mem_address = $("#i_addr").val()+","+$("#i_addr2").val();
				var mem_phone = $("#i_tel").val();
				var param = "mks_id="+mks_id+"&mks_pw="+mks_pw+"&mem_address="+mem_address+"&mem_phone="+mem_phone+"&mks_email="+email;
				alert(param);
				$.ajax({
					url: '/mypage/mypageUpd.crm'
					,method: 'post'
					,data: param
					,success:function(data){
						var res = data.trim();
						if(res=='불일치'){
							alert('수정실패');
						}else if(res=='실패'){
							alert('수정실패');
						}else{
							alert('수정성공');
							location.href="/client/myPage/pwInput.jsp"
						}
					}
				});
		   	}else{
			  	alert("기준미달");
		   	}
		}else{
			  	alert("기준미달");
		}
		
	}
	function send_mail(){
		alert("인증번호 발송!");
		email = null;
		email_num = null;
		var input = $("#i_email").val();
		checkEmail(input);
		if(email_check==1){//이메일 기준 통과시
		   email = input;
		   var time = new Date();
		   time_check = time.getTime();
		   $.ajax({
		      url: './mailing.jsp?i_email='+email
		      ,success: function(data){
		         var res = data.trim();
		         email_num = res;
		         alert("인증번호: "+email_num);
		      }
		   });
		}else{
		   alert("이메일이 형식에 맞지 않습니다.");
		}
		
	}
	function check_mail(){
		if(email_num==null){
		   alert("인증번호가 발송되지 않았습니다.");
		   email_check=0;
		}else{
		   var time = new Date();
		   time = time.getTime();
		   if((time-time_check)>60000){//540000
		      $("#emailFail").html("입력시간이 초과되었습니다.");
		      $("#emailFail").attr('class','text-danger');
		      email_check=0;
		   }else{
		      var input = $("#i_email_check").val();
		      if(input==email_num){
		      alert("같음");
		         $("#emailFail").html("통과");
		         $("#emailFail").attr('class','text-success');
		         email_check=1;
		      }
		   }
		}
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
						<label style="font-size:x-large;font-color:#4C4C4C;margin-left:0;">내 정보</label>
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
				<!-- 개인정보 입력폼 -->
				<div class="border mb-0 mt-0">
					<div class="row m-2 my-0" style="justify-content: center">
						<form>
							<!-- 이름 -->
 				 			<div class="form-group row mb-1 mt-2">
    							<label for="i_name" style="width:80px;">이름</label>
    							<div class="col-md">
      								<input type="text" readonly class="form-control" id="i_name">
    							</div>
  							</div>
  							<!-- 아이디 -->
  							<div class="form-group row mb-1">
    							<label for="i_id" style="width:80px;">아이디</label>
    							<div class="col-md">
     					 			<input type="text" readonly class="form-control" id="i_id">
    							</div>
  							</div>
  							<!-- 비밀번호 @@@@@-->
  							<div class="form-group row mb-1">
    							<label for="i_pw" style="width:80px;">비밀번호</label>
                         		<div class="col-md">
                             		<div class="input-group">
                                 		<input type="password" class="form-control" id="i_pw">
                             		</div>
                             		<small id="pwFail" class="text-muted">7~12자이어야 하며 공백은 불가합니다.</small>
                        		</div>
  							</div>
  							<!-- 주민번호 -->
		                    <div class="form-group row mb-1">
		                      <label for="i_reg" style="width:80px;">주민번호</label>
		                      <div class="col-md">
		                           <div class="input-group">
		                              <input type="text" readonly class="form-control" id="i_reg1">
		                              <label>&nbsp;-&nbsp;</label>
		                              <input type="password" readonly class="form-control" id="i_reg2">
		                              <label></label>
		                           </div>
		                      </div>
		                    </div>
  							<!-- 우편번호 -->
  							<div class="form-group row mb-1">
    							<label style="width:80px;">우편번호</label>
    							<div class="col-md">
	    							<div class="input-group">
	      								<input type="text" readonly class="form-control" id="i_zipcode">
	      								<input type="button" onclick="addrSearch()" value="우편번호 찾기" 
	      													style="background-color:#353535;color:#F6F6F6;"><br>
	   								</div>
    							</div>
  							</div>
  							<!-- 주소 -->
  							<div class="form-group row mb-1" >
    							<label style="width:80px;">주소</label>
    							<div class="col-md">
     					 			<input type="text" readonly class="form-control" id="i_addr">
    							</div>
  							</div>
  							<!-- 상세주소 -->
  							<div class="form-group row mb-1">
    							<label for="i_addr2" style="width:80px;">상세주소</label>
    							<div class="col-md">
     					 			<input type="text" class="form-control" id="i_addr2">
    							</div>
  							</div>
  							<!-- 전화번호 -->
  							<div class="form-group row mb-1">
    							<label for="i_tel" style="width:80px;">전화번호</label>
    							<div class="col-md">
     					 			<input type="text" class="form-control" id="i_tel">
    							</div>
  							</div>
  							<!-- 이메일 -->
	                        <div class="form-group row mb-1">
	                          <label for="i_email" style="width:80px;">이메일</label>
	                          <div class="col-md">
	                             <div class="input-group">
	                                  <input type="text" class="form-control" id="i_email">
	                                  <input type="button" onclick="send_mail()" value="인증번호 받기" 
	                                                 style="background-color:#353535;color:#F6F6F6;"><br>
	                               </div>
	                          </div>
	                        </div>
	                        <!-- 인증번호 입력 -->
	                        <div class="form-group row mb-1">
	                          <label for="i_email_check" style="width:80px;"></label>
	                          <div class="col-md">
	                             <div class="input-group">
	                                  <input type="text" class="form-control" id="i_email_check">
	                                  <input type="button" onclick="check_mail()" value="인증하기" 
	                                                 style="background-color:#353535;color:#F6F6F6;"><br>
	                               </div>
	                               <small id="emailFail" class="text-muted">이메일을 입력해주세요.</small>
	                          </div>
	                        </div>
						</form>
					</div>
					<!-- 버튼 -->
					<div class="row mb-3 mr-2">
						<div class="col-md" style="text-align:right">
							<button class="btn btn-md btn-dark" onClick="modal_ins()">수정</button>
							<button class="btn btn-md btn-dark" onClick="location.href='/client/mypage/pwInput.jsp'">닫기</button>
						</div>
					</div>
				</div><!-- 개인정보 입력폼 -->
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
        				<h5 class="modal-title">회원정보를 수정하시겠습니까?</h5>
     				</div>
     			</div>
     			<!-- footer -->
     			<div class="modal-footer">
        			<button type="button" class="btn btn-primary" data-dismiss="modal" onClick="myinfo_ins();">저장</button>
        			<button type="button" class="btn btn-primary" data-dismiss="modal" data-dismiss="modal">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	 <!-- 돔구성 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function(){
		   $("#i_pw").keyup(function(){
		      var input = $("#i_pw").val();
		      checkPw(input,7,12);
		   });
		   $.ajax({
			   url: "/mypage/mypageSel.crm?mks_id="+mks_id
			   ,success: function(data){
				    var res = JSON.parse(data);
					$("#i_name").val(res[0].MEM_NAME);
					$("#i_id").val(res[0].MKS_ID);
					var reg = ""+res[0].MEM_SOCIALNUM;
					reg = reg.split("-");
					alert("주민번호: "+reg[0]+"-"+reg[1]);////
					$("#i_reg1").val(reg[0]);
					$("#i_reg2").val(reg[1]);
					var addr = ""+res[0].MEM_ADDRESS;
					addr = addr.split(",");
					alert("주소: "+addr[0]+","+addr[1]);////
					$("#i_addr").val(addr[0]);
					$("#i_addr2").val(addr[1]);
					$("#i_tel").val(res[0].MEM_PHONE);
					alert("이메일: "+res[0].MKS_EMAIL);
					$("#i_email").val(res[0].MKS_EMAIL);
			   }
		   });
		});
   </script>
	
</body>
</html>