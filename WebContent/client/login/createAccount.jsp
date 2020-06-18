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
<%@ include file="/common/bootStrap4UI.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	label{
		margin:8px;
	}
	.col-4, .col{
		padding-right:10px;
		padding-left:10px;
	} 
</style>
<script type="text/javascript">
	function addrSearch() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	var zip = data.zonecode;
	            var addr = data.sigungu; // 최종 주소 변수
	            var addr1 = data.sido; // 최종 주소 변수
	            var addr2 = data.bname; // 최종 주소 변수
	            document.getElementById("i_addr").value = addr+" "+addr1+" "+addr2;
	            document.getElementById("i_zipcode").value = zip;
	        }
	    }).open();
	}
	function acc_check(){
		alert("회원가입버튼 호출");
	}
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../login/menu.jsp"/>
	<!-- 본문 -->
	<div class="container" style="font-family:'Do Hyeon', sans-serif;margin-top:20px;">
	  	<div class="row pt-3">
	  		<div class="col-md">
				<div class="row mb-0">
					<div class="col-md">
						<label style="font-size:x-large;font-color:#4C4C4C;">회원가입</label>
					</div>
				</div>
				<hr>
				<!-- 회원가입 입력폼 -->
				<div class="border mb-0 mt-4">
					<div class="row m-2 my-0" style="justify-content: center">
						<form>
							<!-- 이름 -->
 				 			<div class="form-group row">
    							<label for="i_name" style="width:80px;">이름</label>
    							<div class="col-md">
      								<input type="text" class="form-control" id="i_name">
    							</div>
  							</div>
  							<!-- 아이디 -->
  							<div class="form-group row">
    							<label for="i_id" style="width:80px;">아이디</label>
    							<div class="col-md">
     					 			<input type="text" class="form-control" id="i_id">
    							</div>
  							</div>
  							<!-- 비밀번호 -->
  							<div class="form-group row">
    							<label for="i_pw" style="width:80px;">비밀번호</label>
    							<div class="col-md">
     					 			<input type="password" class="form-control" id="i_pw">
    							</div>
  							</div>
  							<!-- 비밀번호  확인 -->
  							<div class="form-group row">
    							<label for="i_pw2" style="width:80px;">비밀번호 확인</label>
    							<div class="col-md">
     					 			<input type="password" class="form-control" id="i_pw2">
    							</div>
  							</div>
  							<!-- 우편번호 -->
  							<div class="form-group row">
    							<label for="i_zipcode" style="width:80px;">우편번호</label>
    							<div class="col-md">
	    							<div class="input-group">
	      								<input type="text" readonly class="form-control" id="i_zipcode">
	      								<div class="input-group-prepend">
	      									<button class="btn btn-md btn-dark" onClick="addrSearch()">주소검색</button>
	      								</div>
	   								</div>
    							</div>
  							</div>
  							<!-- 주소 -->
  							<div class="form-group row" >
    							<label for="i_addr" style="width:80px;">주소</label>
    							<div class="col-md">
     					 			<input type="text" readonly class="form-control" id="i_addr">
    							</div>
  							</div>
  							<!-- 상세주소 -->
  							<div class="form-group row">
    							<label for="i_addr2" style="width:80px;">상세주소</label>
    							<div class="col-md">
     					 			<input type="text" class="form-control" id="i_addr2">
    							</div>
  							</div>
  							<!-- 전화번호 -->
  							<div class="form-group row">
    							<label for="i_tel" style="width:80px;">전화번호</label>
    							<div class="col-md">
     					 			<input type="text" class="form-control" id="i_tel">
    							</div>
  							</div>
  							<!-- 이메일 -->
  							<div class="form-group row">
    							<label for="i_email" style="width:80px;">이메일</label>
    							<div class="col-md">
     					 			<input type="text" class="form-control" id="i_email">
    							</div>
  							</div>
						</form>
					</div>
					<!-- 버튼 -->
					<div class="row m-2">
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
</body>
</html>