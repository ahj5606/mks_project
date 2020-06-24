<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>회원가입</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9c4b678674e7c8512ebf2cadc156977&libraries=services"></script>
<%@ include file="/common/bootStrap4UI.jsp"%>
<style type="text/css">
	label{
		margin:8px;
	}
	.col-4, .col{
		padding-right:10px;
		padding-left:10px;
	} 
	.container{
		padding:5px;
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
	var id;//아이디
	var reg;//주민번호
	var email;//이메일
	var email_num;//인증번호
	var id_check=0;//아이디 중복검사 통과시 1로
	var reg_check=0;//주민번호 가입검사 통과시 1로
	var email_check=0;//이메일 인증성공시 1로
	var pw_check=0;//비밀번호 일치시 1로
	var time_check;//인증번호 발송버튼 눌렀을 때의 시간
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
	function acc_check(){
		alert("회원가입버튼 호출");
		//2가지조건 만족하니?
	}
	function check_id(){
		alert("아이디 중복검사!");
		//빈문자열이 아니니?
		//loginFail
	}
	function check_reg(){
		alert("주민번호 가입검사!");
		//빈문자열아니니?
		//숫자니?
		//길이는 맞니?
		//regFail
	}
	function send_mail(){
		alert("인증번호 발송!");
		//빈문자열 아니니?
		//이메일형식에 맞니?
		//emailFail
	}
	function check_mail(){
		alert("인증번호 검사!");
		//3분이 안지났니?
		//인증번호가 일치하니?
		//emailFail
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
						<label style="font-size:x-large;font-color:#4C4C4C;margin-left:0;">회원가입</label>
					</div>
				</div>
				<hr>
				<!-- 회원가입 입력폼 -->
				<div class="border mb-0 mt-3">
					<div class="row m-2 my-0" style="justify-content: center">
						<form>
							<!-- 이름 -->
 				 			<div class="form-group row mb-1 mt-3">
    							<label for="i_name" style="width:80px;">이름</label>
    							<div class="col-md">
      								<input type="text" class="form-control" id="i_name">
    							</div>
  							</div>
  							<!-- 아이디 -->
  							<div class="form-group row mb-1">
    							<label for="i_id" style="width:80px;">아이디</label>
    							<div class="col-md">
     					 			<div class="input-group">
	      								<input type="text" class="form-control" id="i_id">
	      								<input type="button" onclick="check_id()" value="중복 검사" 
	      													style="background-color:#353535;color:#F6F6F6;"><br>
	   								</div>
	   								<small id="loginFail" class="text-danger">이미 가입된 아이디 입니다.</small>
    							</div>
  							</div>
  							<!-- 비밀번호 -->
  							<div class="form-group row mb-1">
    							<label for="i_pw" style="width:80px;">비밀번호</label>
    							<div class="col-md">
     					 			<input type="password" class="form-control" id="i_pw">
    							</div>
  							</div>
  							<!-- 비밀번호  확인 -->
  							<div class="form-group row mb-1">
    							<label for="i_pw2" style="width:80px;">비밀번호 확인</label>
    							<div class="col-md">
    								<div class="input-group">
     					 				<input type="password" class="form-control" id="i_pw_check">
     					 			</div>
	    							<small id="pwFail" class="text-danger">비밀번호가 일치하지 않습니다.</small>
    							</div>
  							</div>
  							<!-- 주민번호 -->
  							<div class="form-group row mb-1">
    							<label for="i_reg" style="width:80px;">주민번호</label>
    							<div class="col-md">
     					 			<div class="input-group">
	      								<input type="text" class="form-control" id="i_reg1">
	      								<label>&nbsp;-&nbsp;</label>
	      								<input type="password" class="form-control" id="i_reg2">
	      								<label></label>
	      								<input type="button" onclick="check_reg()" value="가입 확인" 
	      													style="background-color:#353535;color:#F6F6F6;"><br>
	   								</div>
	   								<small id="regFail" class="text-danger">이미 가입된 주민번호 입니다.</small>
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
    							<label for="i_email" style="width:80px;"></label>
    							<div class="col-md">
    								<div class="input-group">
	      								<input type="text" class="form-control" id="i_email_check">
	      								<input type="button" onclick="check_mail()" value="인증하기" 
	      													style="background-color:#353535;color:#F6F6F6;"><br>
	   								</div>
	   								<small id="emailFail" class="text-danger">입력 가능 시간은 3분입니다.</small>
    							</div>
  							</div>
						</form>
					</div>
					<!-- 버튼 -->
					<div class="row mb-3 mr-2">
						<div class="col-md" style="text-align:right">
							<button class="btn btn-md btn-dark" onClick="acc_check()">회원가입하기</button>
						</div>
					</div>
				</div><!-- 회원가입 입력폼 끝 -->
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../login/footer.jsp"/>
	<!-- 돔구성 완료되었을 때 -->
	<script type="text/javascript">
		$(document).ready(function(){
			//$("#i_pw_check").
		});
	</script>
</body>
</html>