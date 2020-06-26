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
	label{
		margin:8px;
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
		alert("수정!");
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
     					 			<input type="password" class="form-control" id="i_pw2">
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
     					 			<input type="text" class="form-control" id="i_email">
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
        				<h5 class="modal-title">다음 글을 저장하시겠습니까?</h5>
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
	
</body>
</html>